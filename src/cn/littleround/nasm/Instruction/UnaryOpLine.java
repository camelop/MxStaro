package cn.littleround.nasm.Instruction;

import cn.littleround.nasm.Operand.BaseOperand;

public abstract class UnaryOpLine extends BaseLine {
    public UnaryOpLine(BaseOperand op) {
        this.op1 = op;
    }
}
