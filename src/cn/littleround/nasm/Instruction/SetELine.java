package cn.littleround.nasm.Instruction;

import cn.littleround.nasm.Operand.RegOperand;

public class SetELine extends SetLine {
    public SetELine(RegOperand op) {
        super(op);
    }

    @Override
    String getIns() {
        return "sete";
    }
}
