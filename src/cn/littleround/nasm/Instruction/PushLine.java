package cn.littleround.nasm.Instruction;

import cn.littleround.nasm.Operand.BaseOperand;

public class PushLine extends BaseLine {
    public PushLine(BaseOperand op) {
        op1 = op;
    }

    @Override
    String getIns() {
        return "push";
    }
}
