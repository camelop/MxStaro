package cn.littleround.ir;

import cn.littleround.ASTnode.FuncDefinitionNode;
import cn.littleround.Constants;
import cn.littleround.nasm.BasicBlock;
import cn.littleround.nasm.Instruction.*;
import cn.littleround.nasm.NasmContext;
import cn.littleround.nasm.Operand.*;
import javafx.util.Pair;

import java.util.*;

public abstract class Function {
    public String getLabel() {
        return label;
    }

    protected String label;
    protected FuncDefinitionNode astSource;
    protected ArrayList<String> callList;

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
        if (Constants.libFunc.containsKey(label)) return;
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
        // TODO make BasicBlock.next correct
    }

    public ArrayList<BaseLine> toLines() {
        if (Constants.libFunc.containsKey(label)) {
            return Constants.libFunc.get(label);
        }
        //TODO arrange cfg basic blocks, but for now, output it all
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
                    // eliminate useless lines, some how damaged...... useless...
                    /*
                    if (line.op1 instanceof VirtualRegOperand) {
                        if (!visited.contains(((VirtualRegOperand) line.op1).getVid()+Constants.virtualRegOperandIdOffset)) continue;
                    }
                    if (line.op2 instanceof VirtualRegOperand) {
                        if (!visited.contains(((VirtualRegOperand) line.op2).getVid()+Constants.virtualRegOperandIdOffset)) continue;
                    }*/

                    for (BaseLine nline: line.render(this)) {
                        ret.add(nline);
                    }
                } else ret.add(line);
            }
            ret.add(new CommentLine("----------------------------------]"));
        }
        ret = optimCombineR1011(ret);
        return ret;
    }

    private ArrayList<BaseLine> optimCombineR1011(ArrayList<BaseLine> ret) {
        ArrayList<BaseLine> ret2 = new ArrayList<BaseLine>();
        BaseLine nw = null;
        for (BaseLine line: ret) {
            if (nw == null) {
                if (line.hasLabel()) ret2.add(line); else {
                    nw = line;
                }
            } else {
                if (nw instanceof MovLine && line instanceof MovLine) {
                    if ((nw.op1.toString().equals("r10") || nw.op1.toString().equals("r11"))
                            && nw.op1.equals(line.op2) && !(nw.op2 instanceof MemOperand && line.op1 instanceof MemOperand)) {
                        //System.err.print(" "+nw.toString()+"+"+line.toString()+"=");
                        nw.op1 = line.op1;
                        //System.err.println(nw.toString());
                        continue;
                    }
                }
                ret2.add(nw);
                nw = line;
            }
        }
        if (nw != null) ret2.add(nw);
        return ret2;
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
                }
                if (line.op2 != null) for (Integer des: BaseLine.toId(line.op2)){
                    dependGraph[des].update(lineCnt);
                    if (loopRecorder.size() > 0) {
                        loopRecorder.peek().vids.add(des);
                    }
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

        for (int i=0; i<nasmCtx.countVid(); ++i) {
            int nwColor = dependGraph[i+Constants.virtualRegOperandIdOffset].color;
            if (nwColor != -1) {
                nasmCtx.assign(i, new RegOperand(Constants.assignableRegs[nwColor]));
            } else {
                MemRegOperand mro = new MemRegOperand(new RegOperand("rsp"));
                mro.setOffset(i*8);
                nasmCtx.assign(i, mro);
            }
        }
    }

    private void color(int nColor) {
        ArrayList<_Seg> bumpList = new ArrayList<>();
        for (int i = Constants.virtualRegOperandIdOffset; i < dependGraph.length; ++i) {
            if (!nasmCtx.ableToCache(i-Constants.virtualRegOperandIdOffset)) continue;
            if (dependGraph[i].start == 0x7fffffff) continue;
            bumpList.add(new _Seg(i, dependGraph[i].start, dependGraph[i].end));
        }
        System.err.println(getLabel());
        Collections.sort(bumpList);
        // for (_Seg i:bumpList) System.err.println(i.toString());

        // linear scan
        PriorityQueue<_Seg> active = new PriorityQueue<>(new Comparator<_Seg>() {
            @Override
            public int compare(_Seg o1, _Seg o2) {
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
                if (active.peek().end > nw.end) {
                    nw.color = active.peek().color;
                    active.peek().color = -1;
                    active.poll();
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
        for (_Seg i:bumpList) System.err.println(i.toString());
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
    public void update(int nw) {
        start = (start > nw) ? (nw) : (start);
        end = (end < nw) ? (nw) : (end);
    }
    public int color = -1;
    @Override
    public String toString() {
        return "\tin: "+_in.toString()+System.lineSeparator()+"\tout: "+_out.toString();
    }
}

class _Seg implements Comparable{
    public int vid;
    public int start;
    public int end;
    public int color = -1;

    public _Seg(int vid, int start, int end) {
        this.vid = vid;
        this.start = start;
        this.end = end;
    }

    @Override
    public int compareTo(Object o) {
        if (!(o instanceof _Seg)) return 0;
        _Seg rhs = (_Seg) o;
        return Integer.valueOf(start).compareTo(Integer.valueOf(rhs.start));
    }

    @Override
    public String toString() {
        return String.valueOf(vid)+" :  "+String.valueOf(start)+"->"+String.valueOf(end)+"    C = "+String.valueOf(color);
    }
}

class _LoopHandler{
    public ArrayList<Integer> vids = new ArrayList<>();
    public int start, end;

    public _LoopHandler(int start) {
        this.start = start;
    }
}