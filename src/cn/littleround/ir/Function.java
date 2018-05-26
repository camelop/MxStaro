package cn.littleround.ir;

import cn.littleround.ASTnode.FuncDefinitionNode;
import cn.littleround.Constants;
import cn.littleround.nasm.BasicBlock;
import cn.littleround.nasm.Instruction.BaseLine;
import cn.littleround.nasm.Instruction.CallLine;
import cn.littleround.nasm.Instruction.CommentLine;
import cn.littleround.nasm.NasmContext;

import java.util.ArrayDeque;
import java.util.ArrayList;

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
        // create a head tag
        cfg.add(new BasicBlock(label));
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
        reportVirtualReg();
        // TODO make BasicBlock.next correct
    }

    public ArrayList<BaseLine> toLines() {
        if (Constants.libFunc.containsKey(label)) {
            return Constants.libFunc.get(label);
        }
        //TODO arrange cfg basic blocks, but for now, output it all
        ArrayList<BaseLine> ret = new ArrayList<>();
        ret.add(new CommentLine(" --- [ "+label+" ] ---"));
        for (BasicBlock bb: cfg) {
            for (BaseLine line:bb.getLines()) {
                ret.add(line);
            }
            ret.add(new CommentLine("-----------------------------------"));
        }
        return ret;
    }

    private _GraphNode[] dependGraph = null;
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
        reportDependency();
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