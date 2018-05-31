package cn.littleround.ASTnode;

import cn.littleround.ir.Function;
import cn.littleround.nasm.BasicBlock;
import cn.littleround.nasm.Instruction.MovLine;
import cn.littleround.nasm.Instruction.SalLine;
import cn.littleround.nasm.Instruction.SarLine;
import cn.littleround.nasm.Operand.RegOperand;
import cn.littleround.nasm.Operand.VirtualRegOperand;

import java.util.ArrayDeque;

public class ShiftRightNode extends IntBinaryOpNode {

    @Override
    public ArrayDeque<BasicBlock> renderNasm(Function f) throws Exception {
        ArrayDeque<BasicBlock> ret = super.renderNasm(f);
        VirtualRegOperand vl = new VirtualRegOperand(f.nctx().getVid(op1()));
        VirtualRegOperand vr = new VirtualRegOperand(f.nctx().getVid(op2()));
        VirtualRegOperand vt = new VirtualRegOperand(f.nctx().getVid());
        BasicBlock bb = new BasicBlock();
        // save rcx
        VirtualRegOperand vrcx = new VirtualRegOperand(f.nctx().getVid("_rcx"));
        bb.add(new MovLine(vrcx, new RegOperand("rcx")));
        bb.add(new MovLine(vt, vl));
        bb.add(new MovLine(
                new RegOperand("rcx"),
                vr
        ));
        bb.add(new SarLine(vt));
        // load rcx
        bb.add(new MovLine(new RegOperand("rcx"), vrcx));
        f.nctx().setNodeVid(this, vt.getVid());
        BasicBlock.dequeCombine(ret, bb);
        return ret;
    }
}
