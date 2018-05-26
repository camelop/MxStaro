package cn.littleround.ASTnode;

import cn.littleround.ir.Function;
import cn.littleround.nasm.BasicBlock;
import cn.littleround.nasm.Instruction.SetBELine;
import cn.littleround.nasm.Instruction.XorLine;
import cn.littleround.nasm.Operand.VirtualRegOperand;

import java.util.ArrayDeque;

public class LessOrEqualThanNode extends CompareBinaryOpNode {
    @Override
    public ArrayDeque<BasicBlock> renderNasm(Function f) throws Exception {
        ArrayDeque<BasicBlock> ret = super.renderNasm(f);
        int vid = f.nctx().getVid();
        VirtualRegOperand vr = new VirtualRegOperand(vid);
        BasicBlock bb = new BasicBlock();
        bb.add(new XorLine(vr));
        bb.add(new SetBELine(vr));
        f.nctx().setNodeVid(this ,vid);
        BasicBlock.dequeCombine(ret, bb);
        return ret;
    }
}
