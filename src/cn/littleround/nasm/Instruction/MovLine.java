package cn.littleround.nasm.Instruction;

import cn.littleround.nasm.Operand.BaseOperand;

public class MovLine extends BinaryOpLine {

    public MovLine(BaseOperand op1, BaseOperand op2) {
        super(op1, op2);
    }


    public MovLine(BaseOperand op1, BaseOperand op2, String comment) {
        super(op1, op2);
        this.comment = comment;
    }

    @Override
    String getIns() {
        return "mov";
    }
}
