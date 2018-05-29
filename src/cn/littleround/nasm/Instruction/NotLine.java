package cn.littleround.nasm.Instruction;

import cn.littleround.nasm.Operand.BaseOperand;

public class NotLine extends UnaryOpLine {
    public NotLine(BaseOperand op) {
        super(op);
    }

    @Override
    String getIns() {
        return "not";
    }
}
