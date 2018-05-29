package cn.littleround.nasm.Instruction;

import cn.littleround.nasm.Operand.BaseOperand;
import cn.littleround.nasm.Operand.RegOperand;

public class SalLine extends BinaryOpLine {
    public SalLine(BaseOperand op1, BaseOperand op2) {
        super(op1, op2);
        ((RegOperand) op1).isBYTE = true;
    }

    @Override
    String getIns() {
        return "sal";
    }
}
