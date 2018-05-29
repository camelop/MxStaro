package cn.littleround.ASTnode;

import cn.littleround.Constants;
import cn.littleround.ir.Function;
import cn.littleround.nasm.BasicBlock;
import cn.littleround.nasm.Instruction.AndLine;
import cn.littleround.nasm.Instruction.SetLLine;
import cn.littleround.nasm.Operand.DecimalOperand;
import cn.littleround.nasm.Operand.VirtualRegOperand;

import java.util.ArrayDeque;

public class LessThanNode extends CompareBinaryOpNode {
    @Override
    public ArrayDeque<BasicBlock> renderNasm(Function f) throws Exception {
        ArrayDeque<BasicBlock> ret = super.renderNasm(f);
        int vid = f.nctx().getVid();
        BasicBlock bb = new BasicBlock();
        //bb.add(new XorLine(new VirtualRegOperand(vid))); // xor change flags!!!
        bb.add(new SetLLine(new VirtualRegOperand(vid)));
        bb.add(new AndLine(new VirtualRegOperand(vid), new DecimalOperand(Constants.byteMask)));
        f.nctx().setNodeVid(this ,vid);
        BasicBlock.dequeCombine(ret, bb);
        return ret;
    }
}
