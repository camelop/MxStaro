package cn.littleround.nasm.Instruction;

import cn.littleround.nasm.Operand.BaseOperand;

public class NegLine extends UnaryOpLine {
    public NegLine(BaseOperand op) {
        super(op);
    }

    @Override
    String getIns() {
        return "neg";
    }
}
