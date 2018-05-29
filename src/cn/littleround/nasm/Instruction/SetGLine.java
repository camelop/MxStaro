package cn.littleround.nasm.Instruction;

import cn.littleround.nasm.Operand.RegOperand;

public class SetGLine extends SetLine {
    public SetGLine(RegOperand op) {
        super(op);
    }

    @Override
    String getIns() {
        return "setg";
    }
}
