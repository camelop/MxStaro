package cn.littleround.ASTnode;

import cn.littleround.ir.Function;
import cn.littleround.nasm.BasicBlock;
import cn.littleround.nasm.Instruction.SetGLine;
import cn.littleround.nasm.Instruction.SetLELine;
import cn.littleround.nasm.Operand.VirtualRegOperand;

import java.util.ArrayDeque;

public class GreaterThanNode extends CompareBinaryOpNode {
    @Override
    public ArrayDeque<BasicBlock> renderNasm(Function f) throws Exception {
        ArrayDeque<BasicBlock> ret = super.renderNasm(f);
        int vid = f.nctx().getVid();
        BasicBlock bb = new BasicBlock();
        //bb.add(new XorLine(new VirtualRegOperand(vid))); // xor change flags!!!
        bb.add(new SetGLine(new VirtualRegOperand(vid)));
        f.nctx().setNodeVid(this ,vid);
        BasicBlock.dequeCombine(ret, bb);
        return ret;
    }
}
