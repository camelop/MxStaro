package cn.littleround.ASTnode;

import cn.littleround.ir.Function;
import cn.littleround.nasm.BasicBlock;
import cn.littleround.nasm.Instruction.IncLine;
import cn.littleround.nasm.Instruction.MovLine;
import cn.littleround.nasm.Operand.VirtualRegOperand;

import java.util.ArrayDeque;

public class PostfixAddNode extends IntUnaryOpNode {
    @Override
    public void checkType() {
        super.checkType();
        if (!isLvalue(op1())) {
            reportError("Semantic", "++ to a r-value is illegal.");
        }
    }
    @Override
    public ArrayDeque<BasicBlock> renderNasm(Function f) throws Exception {
        ArrayDeque<BasicBlock> ret = super.renderNasm(f);
        BasicBlock bb = new BasicBlock();
        int vid = f.nctx().getVid(op1());
        int temp = f.nctx().getVid();
        bb.add(new MovLine(
                new VirtualRegOperand(temp),
                new VirtualRegOperand(vid)
        ));
        bb.add(new IncLine(new VirtualRegOperand(vid)));
        f.nctx().setNodeVid(this, temp);
        BasicBlock.dequeCombine(ret, bb);
        return ret;
    }
}
