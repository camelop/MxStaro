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

        // TODO make BasicBlock.next correct
    }

    public ArrayList<BaseLine> toLines() {
        if (Constants.libFunc.containsKey(label)) {
            return Constants.libFunc.get(label);
        }
        //TODO arrange cfg basic blocks, but for now, output it all
        ArrayList<BaseLine> ret = new ArrayList<>();
        ret.add(new CommentLine(label));
        for (BasicBlock bb: cfg) {
            for (BaseLine line:bb.getLines()) {
                ret.add(line);
            }
        }
        return ret;
    }
}
