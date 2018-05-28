package cn.littleround.ASTnode;

import cn.littleround.Constants;
import cn.littleround.ir.Function;
import cn.littleround.nasm.BasicBlock;
import cn.littleround.nasm.Instruction.*;
import cn.littleround.nasm.Operand.DecimalOperand;
import cn.littleround.nasm.Operand.MemRegOperand;
import cn.littleround.nasm.Operand.RegOperand;
import cn.littleround.nasm.Operand.VirtualRegOperand;
import cn.littleround.type.VoidType;

import java.util.ArrayDeque;

public class NewNode extends BinaryOpNode {
    @Override
    public void updateType() {
        super.updateType();
        type = ((TypeNode) op1()).getType();
        if (type instanceof VoidType)
            reportError("Semantic", "New void is unacceptable.");
    }

    @Override
    public ArrayDeque<BasicBlock> renderNasm(Function f) throws Exception {
        // prepare size
        ArrayDeque<BasicBlock> ret = op1().renderNasm(f);
        BasicBlock bb = new BasicBlock();
        // calculate size
        int vid = f.nctx().getVid();
        bb.add(new MovLine(new VirtualRegOperand(vid), new VirtualRegOperand(f.nctx().getVid(op1()))));
        int width = ((TypeNode) op1()).attribute().getWidth();
        bb.add(new MulLine(new VirtualRegOperand(vid), new DecimalOperand(width)));
        bb.add(new AddLine(new VirtualRegOperand(vid), new DecimalOperand(width)));
        // call malloc
        saveCallerRegs(bb, f);
        bb.add(new MovLine(
                new RegOperand("rdi"),
                new VirtualRegOperand(vid)
        ));
        bb.add(new CallLine("malloc"));
        int vdes = f.nctx().getVid();
        bb.add(new MovLine(
                new VirtualRegOperand(vdes),
                new RegOperand("rax")
        ));
        bb.add(new MovLine(
                new MemRegOperand(new RegOperand("rax")),
                new VirtualRegOperand(vid)
        ));
        loadCallerRegs(bb, f);
        // set return new value
        f.nctx().setNodeVid(this, vdes);
        BasicBlock.dequeCombine(ret, bb);
        // suger
        TypeAttributeNode tan = ((TypeNode) op1()).attribute();
        if (tan.getPointerExpressionList().size() > 1 && !(tan.getPointerExpressionList().get(1) instanceof EmptyExpressionNode)) {
            for (int i = 1; i < tan.getPointerExpressionList().size(); ++i) {
                //TODO: use nasm to construct safe loops
            }
        }
        return ret;
    }
}
