package cn.littleround.nasm.Instruction;

import cn.littleround.nasm.Operand.BaseOperand;

public abstract class BinaryOpLine extends BaseLine {
    public BinaryOpLine(BaseOperand op1, BaseOperand op2) {
        this.op1 = op1;
        this.op2 = op2;
    }
}
