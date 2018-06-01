package cn.littleround.ASTnode;

import cn.littleround.Constants;
import cn.littleround.ir.Function;
import cn.littleround.nasm.BasicBlock;
import cn.littleround.nasm.Instruction.AndLine;
import cn.littleround.nasm.Instruction.MovLine;
import cn.littleround.nasm.Instruction.NotLine;
import cn.littleround.nasm.Operand.DecimalOperand;
import cn.littleround.nasm.Operand.VirtualRegOperand;

import java.util.ArrayDeque;

public class BitwiseNotNode extends IntUnaryOpNode {
    @Override
    public ArrayDeque<BasicBlock> renderNasm(Function f) throws Exception {
        ArrayDeque<BasicBlock> ret = super.renderNasm(f);
        int vid = f.nctx().getVid();
        BasicBlock bb = new BasicBlock();
        bb.add(new MovLine(
                new VirtualRegOperand(vid),
                new VirtualRegOperand(f.nctx().getVid(op1()))
        ));
        bb.add(new NotLine(new VirtualRegOperand(vid)));
        bb.add(new AndLine(new VirtualRegOperand(vid), new DecimalOperand(Constants.dwordMask)));
        f.nctx().setNodeVid(this, vid);
        BasicBlock.dequeCombine(ret, bb);
        return ret;
    }
}
