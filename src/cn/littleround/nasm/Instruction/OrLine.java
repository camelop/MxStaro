package cn.littleround.nasm.Instruction;

import cn.littleround.nasm.Operand.BaseOperand;

public class OrLine extends BinaryOpLine {
    public OrLine(BaseOperand op1, BaseOperand op2) {
        super(op1, op2);
    }

    @Override
    String getIns() {
        return "or";
    }
}
