package cn.littleround.ASTnode;

import cn.littleround.Constants;
import cn.littleround.ir.Function;
import cn.littleround.nasm.BasicBlock;
import cn.littleround.nasm.Instruction.AndLine;
import cn.littleround.nasm.Instruction.MovLine;
import cn.littleround.nasm.Instruction.MulLine;
import cn.littleround.nasm.Instruction.SubLine;
import cn.littleround.nasm.Operand.DecimalOperand;
import cn.littleround.nasm.Operand.VirtualRegOperand;

import java.util.ArrayDeque;

public class MultiplyNode extends IntBinaryOpNode {
    @Override
    public ArrayDeque<BasicBlock> renderNasm(Function f) throws Exception {
        ArrayDeque<BasicBlock> ret = super.renderNasm(f);
        VirtualRegOperand vl = new VirtualRegOperand(f.nctx().getVid(op1()));
        VirtualRegOperand vr = new VirtualRegOperand(f.nctx().getVid(op2()));
        VirtualRegOperand vt = new VirtualRegOperand(f.nctx().getVid());
        BasicBlock bb = new BasicBlock();
        bb.add(new MovLine(vt, vl));
        bb.add(new MulLine(vt, vr));
        bb.add(new AndLine(vt, new DecimalOperand(Constants.dwordMask)));
        f.nctx().setNodeVid(this, vt.getVid());
        BasicBlock.dequeCombine(ret, bb);
        return ret;
    }

    @Override
    public ConstantNode toConstant() {
        ConstantNode ll = op1().toConstant();
        if (ll == null) return null;
        ConstantNode rr = op2().toConstant();
        if (rr == null) return null;
        return new ConstantNode(ll.getConstant()*rr.getConstant());
    }
}
