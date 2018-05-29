package cn.littleround.ASTnode;

import cn.littleround.ir.Function;
import cn.littleround.nasm.BasicBlock;
import cn.littleround.nasm.Instruction.JmpLine;
import cn.littleround.nasm.Operand.SymbleOperand;

import java.util.ArrayDeque;

public class ContinueNode extends LoopJumpNode {
    @Override
    public ArrayDeque<BasicBlock> renderNasm(Function f) throws Exception {
        String label = f.getLabel()+"_for"+String.valueOf(f.nctx().getCurrentLoop());
        ArrayDeque<BasicBlock> ret = new ArrayDeque<BasicBlock>();
        BasicBlock bb = new BasicBlock(label+"_"+f.nctx().getContinueCnt());
        bb.add(new JmpLine(new SymbleOperand(label+"_continue")));
        ret.add(bb);
        return ret;
    }
}
