package cn.littleround.ASTnode;

import cn.littleround.ir.Function;
import cn.littleround.nasm.BasicBlock;
import cn.littleround.nasm.Instruction.AddLine;
import cn.littleround.nasm.Instruction.MovLine;
import cn.littleround.nasm.Instruction.MulLine;
import cn.littleround.nasm.Operand.DecimalOperand;
import cn.littleround.nasm.Operand.MemRegOperand;
import cn.littleround.nasm.Operand.VirtualRegOperand;
import cn.littleround.type.IntType;
import cn.littleround.type.PointerType;

import java.util.ArrayDeque;

public class SubscriptOpNode extends BinaryOpNode {
    @Override
    public void updateType() {
        super.updateType();
        if (!(op2().type instanceof IntType))
            reportError("Semantic Error","Expect int after \'[]\' operator.");
        if (!(op1().type instanceof PointerType))
            reportError("Semantic Error", "Expect pointer type before \'[]\' operator.");
        else
            type = ((PointerType) op1().type).getOriginType();
    }

    @Override
    public ArrayDeque<BasicBlock> renderNasm(Function f) throws Exception {
        ArrayDeque<BasicBlock> ret = super.renderNasm(f);
        BasicBlock bb = new BasicBlock();
        int vOp1 = f.nctx().getVid(op1());
        int vOp2 = f.nctx().getVid(op2());
        int vid = f.nctx().getVid();
        bb.add(new MovLine(new VirtualRegOperand(vid), new VirtualRegOperand(vOp2)));
        int vsize = op1().type.getSize();
        bb.add(new MulLine(new VirtualRegOperand(vid), new DecimalOperand(vsize)));
        bb.add(new AddLine(new VirtualRegOperand(vid), new DecimalOperand(vsize)));
        bb.add(new AddLine(new VirtualRegOperand(vid), new VirtualRegOperand(vOp1)));

        MemRegOperand src = new MemRegOperand(new VirtualRegOperand(vid));

        int vnew = f.nctx().getVid();
        bb.add(new MovLine(
                new VirtualRegOperand(vnew),
                src
        ));
        f.nctx().setNodeVid(this, vnew);
        f.nctx().setMemRef(this, src);
        BasicBlock.dequeCombine(ret, bb);
        return ret;
    }
}
