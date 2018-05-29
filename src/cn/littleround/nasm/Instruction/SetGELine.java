package cn.littleround.nasm.Instruction;

import cn.littleround.nasm.Operand.RegOperand;

public class SetGELine extends SetLine {
    public SetGELine(RegOperand op) {
        super(op);
    }

    @Override
    String getIns() {
        return "setge";
    }
}
