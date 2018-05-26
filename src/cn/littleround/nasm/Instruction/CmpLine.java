package cn.littleround.nasm.Instruction;

import cn.littleround.nasm.Operand.BaseOperand;
import cn.littleround.nasm.Operand.DecimalOperand;

public class CmpLine extends BinaryOpLine {
    public CmpLine(BaseOperand op1, BaseOperand op2) {
        super(op1, op2);
    }

    public CmpLine(BaseOperand op1) {
        super(op1, new DecimalOperand(0));
    }

    @Override
    String getIns() {
        return "cmp";
    }
}
