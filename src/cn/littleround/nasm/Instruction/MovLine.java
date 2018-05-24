package cn.littleround.nasm.Instruction;

import cn.littleround.nasm.Operand.BaseOperand;

public class MovLine extends BaseLine {
    public MovLine(BaseOperand op1, BaseOperand op2) {
        this.op1 = op1;
        this.op2 = op2;
    }

    @Override
    String getIns() {
        return "mov";
    }
}
