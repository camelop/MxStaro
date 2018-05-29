package cn.littleround.nasm.Instruction;

import cn.littleround.nasm.Operand.BaseOperand;

public class AndLine extends BinaryOpLine {
    public AndLine(BaseOperand op1, BaseOperand op2) {
        super(op1, op2);
    }

    @Override
    String getIns() {
        return "and";
    }
}
