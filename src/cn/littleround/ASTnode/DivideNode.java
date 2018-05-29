package cn.littleround.ASTnode;

import cn.littleround.ir.Function;
import cn.littleround.nasm.BasicBlock;
import cn.littleround.nasm.Instruction.MovLine;
import cn.littleround.nasm.Instruction.MulLine;
import cn.littleround.nasm.Operand.RegOperand;
import cn.littleround.nasm.Operand.VirtualRegOperand;

import java.util.ArrayDeque;

public class DivideNode extends IntBinaryOpNode {
    @Override
    public ArrayDeque<BasicBlock> renderNasm(Function f) throws Exception {
        ArrayDeque<BasicBlock> ret = super.renderNasm(f);
        VirtualRegOperand vl = new VirtualRegOperand(f.nctx().getVid(op1()));
        VirtualRegOperand vr = new VirtualRegOperand(f.nctx().getVid(op2()));
        VirtualRegOperand vt = new VirtualRegOperand(f.nctx().getVid());
        BasicBlock bb = new BasicBlock();
        int vdx = f.nctx().getVid("_"+"rdx");
        int vax = f.nctx().getVid("_"+"rda");
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
        VirtualRegOperand vdivisor = new VirtualRegOperand(f.nctx().getVid());
        vdivisor.isDWORD = true;
        bb.add(new MovLine(
                new RegOperand("rdx"),
                vl
        ));
        bb.add(new MovLine(
                new RegOperand("rax"),
                vl
        ));
        //TODO TODO TODO TODO TODO TODO
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
}
