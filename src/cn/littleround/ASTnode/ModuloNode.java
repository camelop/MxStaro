package cn.littleround.ASTnode;

import cn.littleround.Constants;
import cn.littleround.ir.Function;
import cn.littleround.nasm.BasicBlock;
import cn.littleround.nasm.Instruction.*;
import cn.littleround.nasm.Operand.DecimalOperand;
import cn.littleround.nasm.Operand.RegOperand;
import cn.littleround.nasm.Operand.VirtualRegOperand;

import java.util.ArrayDeque;

public class ModuloNode extends IntBinaryOpNode {
    @Override
    public ArrayDeque<BasicBlock> renderNasm(Function f) throws Exception {
        ArrayDeque<BasicBlock> ret = super.renderNasm(f);
        VirtualRegOperand vl = new VirtualRegOperand(f.nctx().getVid(op1()));
        VirtualRegOperand vr = new VirtualRegOperand(f.nctx().getVid(op2()));
        VirtualRegOperand vt = new VirtualRegOperand(f.nctx().getVid());
        BasicBlock bb = new BasicBlock();
        int vdx = f.nctx().getVid();
        int vax = f.nctx().getVid();
        // save regs
        bb.add(new MovLine(
                new VirtualRegOperand(vdx),
                new RegOperand("rdx")
        ));
        bb.add(new MovLine(
                new VirtualRegOperand(vax),
                new RegOperand("rax")
        ));
        // operate idiv
        VirtualRegOperand vdivisor = vr;
        bb.add(new MovLine(
                new RegOperand("rax"),
                vl
        ));
        bb.add(new AndLine(
                new RegOperand("rax"),
                new DecimalOperand(Constants.dwordMask)
        ));
        bb.add(new AndLine(
                vdivisor,
                new DecimalOperand(Constants.dwordMask)
        ));
        bb.add(new CqoLine());
        bb.add(new DivLine(vdivisor));
        bb.add(new MovLine(
                vt,
                new RegOperand("rdx")
        ));
        // load regs
        bb.add(new MovLine(
                new RegOperand("rdx"),
                new VirtualRegOperand(vdx)
        ));
        bb.add(new MovLine(
                new RegOperand("rax"),
                new VirtualRegOperand(vax)
        ));
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
        return new ConstantNode(ll.getConstant()%rr.getConstant());
    }
}
