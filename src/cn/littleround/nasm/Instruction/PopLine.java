package cn.littleround.nasm.Instruction;

import cn.littleround.nasm.Operand.BaseOperand;

public class PopLine extends BaseLine {
    public PopLine(BaseOperand op) {
        this.op1 = op;
    }

    @Override
    String getIns() {
        return "pop";
    }
}
