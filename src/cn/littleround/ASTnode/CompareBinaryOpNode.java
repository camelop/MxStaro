package cn.littleround.ASTnode;

import cn.littleround.Constants;
import cn.littleround.ir.Function;
import cn.littleround.nasm.BasicBlock;
import cn.littleround.nasm.Instruction.CmpLine;
import cn.littleround.nasm.Operand.VirtualRegOperand;
import cn.littleround.type.IntType;
import cn.littleround.type.StringType;

import java.util.ArrayDeque;

public class CompareBinaryOpNode extends BinaryOpNode {
    @Override
    public void updateType() {
        super.updateType();
        type = Constants.BOOL;
    }

    @Override
    public void checkType() {
        super.checkType();
        if (!(((op1().type instanceof IntType) && op2().type instanceof IntType)||((op1().type instanceof StringType)&&( op2().type instanceof StringType))))
            if (op1().type == null || op2().type == null) {
                reportError("Semantic", "Expect int or string value between operators, not null.");
            } else
                reportError("Semantic", "Expect int or string value between operators, not "+op1().type.toString()+" and "+op2().type.toString()+".");
    }

    @Override
    public ArrayDeque<BasicBlock> renderNasm(Function f) throws Exception {
        ArrayDeque<BasicBlock> ret = super.renderNasm(f);
        BasicBlock bb = new BasicBlock();
        VirtualRegOperand vl = new VirtualRegOperand(f.nctx().getVid(op1()));
        vl.isDWORD = true;
        VirtualRegOperand vr = new VirtualRegOperand(f.nctx().getVid(op2()));
        vr.isDWORD = true;
        bb.add(new CmpLine(vl, vr));
        BasicBlock.dequeCombine(ret, bb);
        return ret;
    }
}
