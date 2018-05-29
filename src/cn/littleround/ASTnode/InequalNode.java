package cn.littleround.ASTnode;

import cn.littleround.Constants;
import cn.littleround.ir.Function;
import cn.littleround.nasm.BasicBlock;
import cn.littleround.nasm.Instruction.AndLine;
import cn.littleround.nasm.Instruction.CmpLine;
import cn.littleround.nasm.Instruction.SetELine;
import cn.littleround.nasm.Instruction.SetNELine;
import cn.littleround.nasm.Operand.DecimalOperand;
import cn.littleround.nasm.Operand.VirtualRegOperand;

import java.util.ArrayDeque;

public class InequalNode extends BinaryOpNode {
    @Override
    public void updateType() {
        super.updateType();
        if (!op1().type.equals(op2().type)) {
            reportError("Semantic Error",
                    "Compare between different types( "+op1().type.toString()+" =? "+op2().type.toString()+" ).");
        }
        type = Constants.BOOL;
    }

    @Override
    public ArrayDeque<BasicBlock> renderNasm(Function f) throws Exception {
        // For NOW, TODO add string support
        ArrayDeque<BasicBlock> ret = super.renderNasm(f);
        int vid = f.nctx().getVid();
        BasicBlock bb = new BasicBlock();
        bb.add(new CmpLine(
                new VirtualRegOperand(f.nctx().getVid(op1())),
                new VirtualRegOperand(f.nctx().getVid(op2()))
        ));
        //bb.add(new XorLine(new VirtualRegOperand(vid))); // xor change flags!!!
        bb.add(new SetNELine(new VirtualRegOperand(vid)));
        bb.add(new AndLine(new VirtualRegOperand(vid), new DecimalOperand(Constants.byteMask)));
        f.nctx().setNodeVid(this ,vid);
        BasicBlock.dequeCombine(ret, bb);
        return ret;
    }
}
