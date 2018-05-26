package cn.littleround.nasm.Instruction;

import cn.littleround.nasm.Operand.BaseOperand;
import cn.littleround.nasm.Operand.RegOperand;

public abstract class SetLine extends BaseLine {
    public SetLine(RegOperand op) {
        this.op1 = op;
    }
}
