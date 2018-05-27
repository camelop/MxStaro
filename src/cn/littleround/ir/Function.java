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
        BasicBlock head = new BasicBlock(label);
        // add rsp change
        head.add(new SubLine(
                new RegOperand("rsp"),
                new DecimalOperand(Constants.sizeOfReg * nasmCtx.countVid())
        ));
        cfg.addFirst(head);

        ArrayList<BaseLine> ret = new ArrayList<>();
        ret.add(new CommentLine(" --- [ "+label+" ] ---"));
        for (BasicBlock bb: cfg) {
            ret.add(new CommentLine("[----------------------------------"));
            for (BaseLine line:bb.getLines()) {
                if (line instanceof RetLine) {
                    // add rsp change
                    ret.add(new AddLine(
                            new RegOperand("rsp"),
                            new DecimalOperand(Constants.sizeOfReg * nasmCtx.countVid())
                    ));
                }
                if (line.isVirtual()) {
                    // eliminate useless lines
                    if (line.op1 instanceof VirtualRegOperand) {
                        if (!visited.contains(((VirtualRegOperand) line.op1).getVid())) continue;
                    }
                    if (line.op2 instanceof VirtualRegOperand) {
                        if (!visited.contains(((VirtualRegOperand) line.op2).getVid())) continue;
                    }
                    // move in
                    if (line.op1 instanceof VirtualRegOperand) {
                        ret.add(new MovLine(
                                new RegOperand("r10"),
                                nasmCtx.convertVid(((VirtualRegOperand) line.op1).getVid()),
                                "load->v"+String.valueOf(((VirtualRegOperand) line.op1).getVid())
                        ));
                    }
                    if (line.op2 instanceof VirtualRegOperand) {
                        ret.add(new MovLine(
                                new RegOperand("r11"),
                                nasmCtx.convertVid(((VirtualRegOperand) line.op2).getVid()),
                                "load->v"+String.valueOf(((VirtualRegOperand) line.op2).getVid())
                        ));
                    }
                    // convert
                    BaseLine newLine = line.clone();
                    if (line.op1 instanceof VirtualRegOperand) {
                        newLine.op1 = new RegOperand("r10");
                    }
                    if (line.op2 instanceof VirtualRegOperand) {
                        newLine.op2 = new RegOperand("r11");
                    }
                    ret.add(newLine);
                    // move out
                    if (line.op1 instanceof VirtualRegOperand) {
                        ret.add(new MovLine(
                                nasmCtx.convertVid(((VirtualRegOperand) line.op1).getVid()),
                                new RegOperand("r10"),
                                "save->v"+String.valueOf(((VirtualRegOperand) line.op1).getVid())
                        ));
                    }
                    if (line.op2 instanceof VirtualRegOperand) {
                        ret.add(new MovLine(
                                nasmCtx.convertVid(((VirtualRegOperand) line.op2).getVid()),
                                new RegOperand("r11"),
                                "save->v"+String.valueOf(((VirtualRegOperand) line.op2).getVid())
                        ));
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
        int vSize = nasmCtx.countVid()+18;
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
        System.out.print("in ["+label+"] unused vr: ");
        for (int i=0; i<nasmCtx.countVid()+18; ++i) {
            if (!visited.contains(i)) {
                System.out.print(i);
                System.out.print(", ");
            }
        }
        System.out.println();
    }

    public void reportDependency() {
        if (dependGraph == null) return;
        int vSize = nasmCtx.countVid()+18;
        System.out.println("Data Dependency Graph of ["+label+"]");
        for (int i=0; i<vSize; ++i) {
            System.out.println("point-"+String.valueOf(i));
            System.out.println(dependGraph[i].toString());
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