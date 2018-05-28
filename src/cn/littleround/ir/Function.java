package cn.littleround.ir;

import cn.littleround.ASTnode.FuncDefinitionNode;
import cn.littleround.Constants;
import cn.littleround.nasm.BasicBlock;
import cn.littleround.nasm.Instruction.*;
import cn.littleround.nasm.NasmContext;
import cn.littleround.nasm.Operand.DecimalOperand;
import cn.littleround.nasm.Operand.MemRegOperand;
import cn.littleround.nasm.Operand.RegOperand;
import cn.littleround.nasm.Operand.VirtualRegOperand;

import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.HashSet;

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
                    // eliminate useless lines
                    /* for now... TODO recover this
                    if (line.op1 instanceof VirtualRegOperand) {
                        if (!visited.contains(((VirtualRegOperand) line.op1).getVid()+Constants.virtualRegOperandIdOffset)) continue;
                    }
                    if (line.op2 instanceof VirtualRegOperand) {
                        if (!visited.contains(((VirtualRegOperand) line.op2).getVid()+Constants.virtualRegOperandIdOffset)) continue;
                    }
                    */
                    for (BaseLine nline: line.render(this)) {
                        ret.add(nline);
                    }
                } else ret.add(line);
            }
            ret.add(new CommentLine("----------------------------------]"));
        }
        return ret;
    }

    private _GraphNode[] dependGraph = null;
    HashSet<Integer> visited = new HashSet<>();
    public void regAlloc() {
        if (cfg == null) return;
        int vSize = nasmCtx.countVid()+Constants.virtualRegOperandIdOffset;
        dependGraph = new _GraphNode[vSize];
        for (int i=0; i<vSize; ++i) dependGraph[i] = new _GraphNode();

        for (BasicBlock bb: cfg) {
            for (BaseLine line:bb.getLines()) {
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

        for (int i=0; i<nasmCtx.countVid(); ++i) {
            MemRegOperand mro = new MemRegOperand(new RegOperand("rsp"));
            mro.setOffset(i*8);
            nasmCtx.assign(i, mro);
        }
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

    @Override
    public String toString() {
        return "\tin: "+_in.toString()+System.lineSeparator()+"\tout: "+_out.toString();
    }
}