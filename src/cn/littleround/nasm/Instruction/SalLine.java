package cn.littleround.nasm.Instruction;

import cn.littleround.nasm.Operand.BaseOperand;
import cn.littleround.nasm.Operand.RegOperand;

public class SalLine extends BinaryOpLine {
    public SalLine(BaseOperand op1, BaseOperand op2) {
        super(op1, op2);
    }

    public SalLine(BaseOperand op1) {
        super(op1);
        op2 = new RegOperand("rcx");
        ((RegOperand)op2).isBYTE = true;
    }

    @Override
    String getIns() {
        return "sal";
    }
}
