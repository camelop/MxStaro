package cn.littleround.ASTnode;

import cn.littleround.ir.Function;
import cn.littleround.nasm.BasicBlock;
import cn.littleround.nasm.Instruction.AndLine;
import cn.littleround.nasm.Instruction.MovLine;
import cn.littleround.nasm.Instruction.SubLine;
import cn.littleround.nasm.Operand.VirtualRegOperand;

import java.util.ArrayDeque;

public class AndNode extends IntBinaryOpNode {
    @Override
    public ArrayDeque<BasicBlock> renderNasm(Function f) throws Exception {
        ArrayDeque<BasicBlock> ret = super.renderNasm(f);
        VirtualRegOperand vl = new VirtualRegOperand(f.nctx().getVid(op1()));
        VirtualRegOperand vr = new VirtualRegOperand(f.nctx().getVid(op2()));
        VirtualRegOperand vt = new VirtualRegOperand(f.nctx().getVid());
        BasicBlock bb = new BasicBlock();
        bb.add(new MovLine(vt, vl));
        bb.add(new AndLine(vt, vr));
        f.nctx().setNodeVid(this, vt.getVid());
        BasicBlock.dequeCombine(ret, bb);
        return ret;
    }
}
