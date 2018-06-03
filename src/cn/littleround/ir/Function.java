package cn.littleround.ir;

import cn.littleround.ASTnode.FuncDefinitionNode;
import cn.littleround.Constants;
import cn.littleround.nasm.BasicBlock;
import cn.littleround.nasm.Instruction.*;
import cn.littleround.nasm.NasmContext;
import cn.littleround.nasm.Operand.*;

import javax.swing.plaf.basic.BasicLabelUI;
import java.util.*;

public abstract class Function {
    public String getLabel() {
        return label;
    }

    protected String label;
    protected FuncDefinitionNode astSource;
    protected HashSet<String> callList;
    public ArrayList<BaseLine> lines;

    public Program getProgram() {
        return pg;
    }

    public GlobalRecord getGlobalRecord() {
        return pg.getGlobalRecord();
    }

    protected Program pg;
    protected NasmContext nasmCtx = new NasmContext();
    protected ArrayDeque<BasicBlock> cfg;

    public NasmContext nctx() {
        return nasmCtx;
    }

    public Function(String label, FuncDefinitionNode astSource, Program pg) {
        this.label = label;
        this.astSource = astSource;
        this.pg = pg;
    }

    private void reportVirtualReg() {
        System.err.print(label+"-VR: ");
        System.err.println(nctx().getIdentifierToVid().toString());
    }

    public void convertNasm() throws Exception {
        cfg = new ArrayDeque<>();
        // only for [head]_text__main:
        if (label.equals(pg.getHead()+"_text__main")) {
            BasicBlock bb = new BasicBlock(label+"_built_in_call_data_init");
            CallLine cl = new CallLine(pg.getHead()+"_datainit");
            cl.setComment("protocol required, built_in");
            bb.add(cl);
            cfg.add(bb);
        }
        // construct cfg
        cfg.addAll(astSource.renderNasm(this));
        // reportVirtualReg();
    }

    public void collectBB() {
        // make bb in cfg behave correctly
        ArrayDeque<BasicBlock> newCfg = new ArrayDeque<>();
        for (BasicBlock bb: cfg) {
            if (newCfg.isEmpty()) {
                newCfg.add(bb);
            } else {
                // Try merge
                BasicBlock last = newCfg.getLast();
                if (last.endsWithJmp()) {
                    newCfg.add(bb);
                } else {
                    // merge two
                    last.add(bb);
                }
            }
        }
        cfg = newCfg;
        // scan bb label
        HashMap<String, BasicBlock> getBasicBlockById = new HashMap<String, BasicBlock>();
        for (BasicBlock bb: cfg) {
            for (BaseLine line: bb.getLines()) {
                if (line.hasLabel()) {
                    getBasicBlockById.put(line.getLabel(), bb);
                }
            }
        }
        BasicBlock lastbb = null;
        HashSet<BasicBlock> valid = new HashSet<BasicBlock>();
        for (BasicBlock bb: cfg) {
            if (lastbb == null) {
                valid.add(bb);
            } else {
                if (lastbb.endsWithJmp()) {
                    if (lastbb.lastJump() instanceof RetLine) {
                        lastbb.next = new ArrayList<BasicBlock>();
                    } else if (lastbb.lastJump() instanceof JmpLine) {
                        // unconditional
                        lastbb.next = new ArrayList<BasicBlock>();
                        BasicBlock jmpToBB = getBasicBlockById.get(((JmpLine) lastbb.lastJump()).op1.toString());
                        lastbb.next.add(jmpToBB);
                        valid.add(jmpToBB);
                    } else {
                        lastbb.next = new ArrayList<BasicBlock>();
                        lastbb.next.add(bb);
                        BasicBlock jmpToBB = getBasicBlockById.get((lastbb.lastJump()).op1.toString());
                        lastbb.next.add(jmpToBB);
                        valid.add(jmpToBB);
                        valid.add(bb);
                    }
                } else {
                    lastbb.next = new ArrayList<BasicBlock>();
                    lastbb.next.add(bb);
                    valid.add(bb);
                }
            }
            lastbb = bb;
        }
        lastbb.next = new ArrayList<BasicBlock>();
        // delete unused bb
        newCfg = new ArrayDeque<BasicBlock>();
        for (BasicBlock bb: cfg) {
            if (valid.contains(bb)) newCfg.add(bb);
        }
        cfg = newCfg;
    }

    public void collectCalls() {
        callList = new HashSet<String>();
        for (BasicBlock bb: cfg) {
            for (BaseLine line: bb.getLines()) {
                if (line instanceof CallLine) {
                    callList.add(line.getLabel());
                }
            }
        }
        //reportCollectCalls();
    }

    private void reportCollectCalls() {
        System.err.println(getLabel()+": "+callList.toString());
    }

    public void rearrangeVR() {
        for (BasicBlock bb: cfg) {
            ArrayDeque<BaseLine> newLines = new ArrayDeque<BaseLine>();
            BasicBlock nwBB = null;
            for (BaseLine line:bb.getLines()) {
                if (nwBB == null) {
                    nwBB = new BasicBlock();
                    nwBB.add(line);
                } else {
                    if (line instanceof ControlFlowLine
                            || line instanceof LabelLine
                            || line instanceof CmpLine
                            || line instanceof SetLine) {
                        newLines.addAll(rearrange(nwBB).getLines());
                        nwBB = new BasicBlock();
                        nwBB.add(line);
                    } else {
                        nwBB.add(line);
                    }
                }
            }
            if (nwBB != null) {
                newLines.addAll(rearrange(nwBB).getLines());
            }
            bb.setLines(newLines);
        }
    }

    private BasicBlock rearrange(BasicBlock oldBB) {
        System.err.println("Receive "+String.valueOf(oldBB.getLines().size()));
        BasicBlock ret = new BasicBlock();
        HashMap<Integer, _LineNode> output = new HashMap<Integer, _LineNode>();
        HashSet<_LineNode> useful = new HashSet<_LineNode>();
        int usefulCnt = 0;
        for (BaseLine line:oldBB.getLines()) {
            ArrayList<Integer> nwOut = line.getDes();
            _LineNode nw = new _LineNode(line);
            if (line instanceof ControlFlowLine) useful.add(nw);
            for (int i:line.getSrc()) {
                if (output.containsKey(i)) {
                    nw._from.add(output.get(i));
                    output.get(i)._to.add(nw);
                }
            }
            for (int i:line.getDes()) {
                output.put(i, nw);
            }
        }
        for (Map.Entry<Integer, _LineNode> e: output.entrySet()) {
            useful.add(e.getValue());
        }
        ArrayList<_LineNode> wk = new ArrayList<_LineNode>(useful);
        for (int i=0; i<wk.size(); ++i) {
            _LineNode nw = wk.get(i);
            for (_LineNode from:nw._from) {
                if (!useful.contains(from)) {
                    useful.add(from);
                    wk.add(from);
                }
            }
            nw.nReq = nw._from.size();
        }
        wk = new ArrayList<_LineNode>();
        for (_LineNode nw:useful) {
            if (nw.nReq == 0) {
                ret.add(nw.line);
                wk.add(nw);
                nw.nReq--;
            }
        }
        for (int i=0; i<wk.size(); ++i) {
            _LineNode nw = wk.get(i);
            for (_LineNode to:nw._to) {
                --to.nReq;
                if (to.nReq == 0) {
                    ret.add(to.line);
                    wk.add(to);
                }
            }
        }
        System.err.println("Return "+String.valueOf(ret.getLines().size()));
        return ret;
    }

    static int inlineCnt = 0;
    public void expandCalls(HashMap<String ,ArrayList<BaseLine>> dic) {
        ArrayList<BaseLine> newLines = new ArrayList<BaseLine>();
        for (BaseLine line: lines) {
            if (line instanceof CallLine && dic.containsKey(line.getLabel())) {
                String label = Constants.head+"_expand_"+line.getLabel()+String.valueOf(inlineCnt);
                ++inlineCnt;
                newLines.add(new LabelLine(label+"_start"));
                for (BaseLine rline: dic.get(line.getLabel())) {
                    //TODO ERROR LABELS!!!!
                    if (rline instanceof RetLine) {
                        newLines.add(new JmpLine(new SymbleOperand(label+"_end")));
                    } else {
                        newLines.add(rline);
                    }
                }
                newLines.add(new LabelLine(label+"_end"));
            } else {
                newLines.add(line);
            }
        }
        lines = newLines;
    }


    public ArrayList<BaseLine> toLines() {
        if (Constants.libFunc.containsKey(label)) {
            return Constants.libFunc.get(label);
        }
        // create a head label
        BasicBlock head;
        if (label.equals(pg.getHead()+"_text__main")) {
            head = new BasicBlock("main");
        } else {
            head = new BasicBlock(label);
        }
        // add rsp change
        if (dependGraph != null)
            head.add(new SubLine(
                new RegOperand("rsp"),
                new DecimalOperand(nasmCtx.getRspOffset())
            ));
        cfg.addFirst(head);

        ArrayList<BaseLine> ret = new ArrayList<>();
        ret.add(new CommentLine(" --- [ "+label+" ] ---"));
        for (BasicBlock bb: cfg) {
            ret.add(new CommentLine("[----------------------------------"));
            for (BaseLine line:bb.getLines()) {
                if (dependGraph == null) {
                    ret.add(line);
                    continue;
                }
                if (line instanceof RetLine) {
                    // add rsp change
                    ret.add(new AddLine(
                            new RegOperand("rsp"),
                            new DecimalOperand(nasmCtx.getRspOffset())
                    ));
                }
                if (line.op1 instanceof MemRegOperand && ((MemRegOperand) line.op1).needAddRspOffset) {
                    ((MemRegOperand) line.op1).addOffset(nasmCtx.getRspOffset());
                }
                if (line.op2 instanceof MemRegOperand && ((MemRegOperand) line.op2).needAddRspOffset) {
                    ((MemRegOperand) line.op2).addOffset(nasmCtx.getRspOffset());
                }
                if (line.isVirtual()) {
                    ret.addAll(line.render(this));
                } else ret.add(line);
            }
            ret.add(new CommentLine("----------------------------------]"));
        }

        int oldsize = -1;
        while (ret.size() != oldsize) {
            oldsize = ret.size();
            ret = optimCombineR1011(ret);
        }
        return ret;
    }

    private ArrayList<BaseLine> optimCombineR1011(ArrayList<BaseLine> ret) {
        ArrayList<BaseLine> ret2 = new ArrayList<BaseLine>();
        BaseLine last = null;
        for (BaseLine line: ret) {
            if (line instanceof EmptyLine || (line instanceof LabelLine && line.getLabel() == null))
                continue;
            if (last == null) {
                if (line.hasLabel()) ret2.add(line); else {
                    last = line;
                }
            } else {
                if (last instanceof MovLine && line instanceof MovLine) {
                    if ((last.op1.toString().equals("r10") || last.op1.toString().equals("r11"))
                            && last.op1.equals(line.op2) && !(last.op2 instanceof MemOperand && line.op1 instanceof MemOperand)) {
                        //System.err.print(" "+last.toString()+"+"+line.toString()+"=");
                        last.op1 = line.op1;
                        last.appendComment(line.getComment());
                        //System.err.println(last.toString());
                        continue;
                    }
                    if ((last.op1.equals(line.op2)) && last.op2.equals(line.op1)) {
                        last.appendComment(line.getComment());
                        // no need
                        continue;
                    }
                    if (!(line.op2 instanceof MemOperand)&&(last.op1.equals(line.op1))) {
                        last.op2 = line.op2;
                        last.appendComment(line.getComment());
                        continue;
                    }
                }
                ret2.add(last);
                last = line;
            }
        }
        if (last != null) ret2.add(last);
        return ret2;
    }

    public void removeCallSave() {
        for (String r:Constants.callConvReservRegs) {
            int leastAppears = 2+nasmCtx.getRetId();
            HashSet<BaseLine> damagedLine = new HashSet<BaseLine>();
            int nwId = BaseLine.toId(new RegOperand(r)).get(0);
            for (BaseLine line:lines) {
                if (line.getDes().contains(nwId) || line.getSrc().contains(nwId)) {
                    damagedLine.add(line);
                    --leastAppears;
                }
            }
            assert leastAppears <= 0;
            if (leastAppears == 0) {
                // should be eliminated
                ArrayList<BaseLine> newLines = new ArrayList<BaseLine>();
                for (BaseLine line: lines) {
                    if (!damagedLine.contains(line)) newLines.add(line);
                }
                lines = newLines;
            }
        }
    }

    private _GraphNode[] dependGraph = null;
    HashSet<Integer> visited = new HashSet<>();
    public void regAlloc() {
        if (cfg == null) return;
        int vSize = nasmCtx.countVid()+Constants.virtualRegOperandIdOffset;
        dependGraph = new _GraphNode[vSize];
        for (int i=0; i<vSize; ++i) dependGraph[i] = new _GraphNode();

        int lineCnt = 0;
        Stack<_LoopHandler> loopRecorder = new Stack<_LoopHandler>();
        for (BasicBlock bb: cfg) {
            for (BaseLine line:bb.getLines()) {
                ++lineCnt;
                if (line.getLabel() != null && line.getLabel().contains("for") && line.getLabel().endsWith("_init")) {
                    loopRecorder.push(new _LoopHandler(lineCnt));
                }
                if (line.getLabel() != null && line.getLabel().contains("for") && line.getLabel().endsWith("_end")) {
                    loopRecorder.peek().end = lineCnt;
                    for (int vid: loopRecorder.peek().vids) {
                        dependGraph[vid].update(loopRecorder.peek().start);
                        dependGraph[vid].update(loopRecorder.peek().end);
                    }
                    loopRecorder.pop();
                }
                if (line.op1 != null) for (Integer src: BaseLine.toId(line.op1)) {
                    dependGraph[src].update(lineCnt);
                    if (loopRecorder.size() > 0) {
                        loopRecorder.peek().vids.add(src);
                    }
                    dependGraph[src].updatePri(loopRecorder.size());
                }
                if (line.op2 != null) for (Integer des: BaseLine.toId(line.op2)){
                    dependGraph[des].update(lineCnt);
                    if (loopRecorder.size() > 0) {
                        loopRecorder.peek().vids.add(des);
                    }
                    dependGraph[des].updatePri(loopRecorder.size());
                }
                for (Integer src:line.getSrc()) {
                    if (src.equals(Constants.noId)) continue;
                    for (Integer des:line.getDes()) {
                        if (des.equals(Constants.noId)) continue;
                        dependGraph[src]._out.add(des);
                        dependGraph[des]._in.add(src);
                    }
                }
            }
        }

        //analyse unused virtual Regs
        ArrayList<Integer> queue = new ArrayList<>();
        for (String s: Constants.funcDesRegs) {
            int nw = (new RegOperand(s)).getId();
            queue.add(nw);
            visited.add(nw);
        }
        queue.add(Constants.memOperandId); visited.add(Constants.memOperandId);
        queue.add(Constants.flagId); visited.add(Constants.flagId);
        for (int i=0; i<queue.size(); ++i) {
            for (int j: dependGraph[queue.get(i)]._in) {
                if (!visited.contains(j)) {
                    queue.add(j);
                    visited.add(j);
                }
            }
        }

        //reportUnusedVRs();
        //reportDependency();
        color(Constants.assignableRegs.length);

        nasmCtx.realVid = 0;
        for (int i=0; i<nasmCtx.countVid(); ++i) {
            int nwColor = dependGraph[i+Constants.virtualRegOperandIdOffset].color;
            if (nwColor != -1) {
                nasmCtx.assign(i, new RegOperand(Constants.assignableRegs[nwColor]));
            } else {
                MemRegOperand mro = new MemRegOperand(new RegOperand("rsp"));
                mro.setOffset(nasmCtx.realVid * 8);
                nasmCtx.assign(i, mro);
                nasmCtx.realVid += 1;
            }
        }
    }

    private void color(int nColor) {
        ArrayList<_Seg> bumpList = new ArrayList<>();
        for (int i = Constants.virtualRegOperandIdOffset; i < dependGraph.length; ++i) {
            if (!nasmCtx.ableToCache(i-Constants.virtualRegOperandIdOffset)) continue;
            if (dependGraph[i].start == 0x7fffffff) continue;
            bumpList.add(new _Seg(i, dependGraph[i].start, dependGraph[i].end, dependGraph[i].pri));
        }
        System.err.println(getLabel());
        Collections.sort(bumpList);
        // for (_Seg i:bumpList) System.err.println(i.toString());

        // linear scan
        PriorityQueue<_Seg> active = new PriorityQueue<>(new Comparator<_Seg>() {
            @Override
            public int compare(_Seg o1, _Seg o2) {
                //if (o1.pri != o2.pri) return o1.pri - o2.pri;
                return o1.end - o2.end;
            }
        });
        boolean[] using = new boolean[Constants.assignableRegs.length];
        for (int i=0; i<using.length; ++i) using[i] = false;
        for (_Seg nw:bumpList) {
            //expire old intervals
            while (active.peek() != null && active.peek().end < nw.start) {
                using[active.peek().color] = false;
                active.poll();
            }
            //check if spill
            if (active.size() == Constants.assignableRegs.length) {
                // must spill
                _Seg toDelete = nw;
                for (_Seg i:active) {
                    if (i.pri < toDelete.pri ||
                            ((i.pri == toDelete.pri)&&(i.end > toDelete.end))) {
                        toDelete = i;
                    }
                }
                if (toDelete != nw) {
                    //System.err.println("Replace "+toDelete.toString()+" with "+nw.toString());
                    //System.err.println("  Current heap "+active.toString());
                    nw.color = toDelete.color;
                    toDelete.color = -1;
                    active.remove(toDelete);
                    active.add(nw);
                }
            } else {
                // assign one
                int nxt = -1;
                for (int j=0; j<using.length; ++j) if (!using[j]) {
                    nxt = j;
                    break;
                }
                assert nxt != -1;
                nw.color = nxt;
                using[nxt] = true;
                active.add(nw);
            }
        }

        // color feedback
        for (_Seg nw: bumpList) dependGraph[nw.vid].color = nw.color;
        //for (_Seg i:bumpList) System.err.println(i.toString());
    }

    public void reportUnusedVRs() {
        System.err.print("in ["+label+"] unused vr: ");
        for (int i=0; i<nasmCtx.countVid()+Constants.virtualRegOperandIdOffset; ++i) {
            if (!visited.contains(i)) {
                System.err.print(i);
                System.err.print(", ");
            }
        }
        System.err.println();
    }

    public void reportDependency() {
        if (dependGraph == null) return;
        int vSize = nasmCtx.countVid()+Constants.virtualRegOperandIdOffset;
        System.err.println("Data Dependency Graph of ["+label+"]");
        for (int i=0; i<vSize; ++i) {
            System.err.println("point-"+String.valueOf(i));
            System.err.println(dependGraph[i].toString());
        }
    }
}

class _GraphNode{
    public ArrayList<Integer> _in = new ArrayList<>();
    public ArrayList<Integer> _out = new ArrayList<>();
    public int start = 0x7fffffff;
    public int end = -1;
    public int pri = 0;
    public void update(int nw) {
        start = (start > nw) ? (nw) : (start);
        end = (end < nw) ? (nw) : (end);
    }
    public int color = -1;
    @Override
    public String toString() {
        return "\tin: "+_in.toString()+System.lineSeparator()+"\tout: "+_out.toString();
    }

    public void updatePri(int p) {
        pri = (pri > p) ? pri : p;
    }
}

class _Seg implements Comparable{
    public int vid;
    public int pri = 0;
    public int start;
    public int end;
    public int color = -1;

    public _Seg(int vid, int start, int end, int pri) {
        this.vid = vid;
        this.start = start;
        this.end = end;
        this.pri = pri;
    }

    @Override
    public int compareTo(Object o) {
        if (!(o instanceof _Seg)) return 0;
        _Seg rhs = (_Seg) o;
        return Integer.valueOf(start).compareTo(Integer.valueOf(rhs.start));
    }

    @Override
    public String toString() {
        return String.valueOf(vid)+" :  "+String.valueOf(start)+"->"+String.valueOf(end)+" pri="+String.valueOf(pri)+"    C = "+String.valueOf(color);
    }
}

class _LoopHandler{
    public ArrayList<Integer> vids = new ArrayList<>();
    public int start, end;

    public _LoopHandler(int start) {
        this.start = start;
    }
}

class _LineNode{
    public BaseLine line;
    public ArrayList<_LineNode> _to = new ArrayList<>();
    public ArrayList<_LineNode> _from = new ArrayList<>();
    int nReq;

    public _LineNode(BaseLine line) {
        this.line = line;
    }
}