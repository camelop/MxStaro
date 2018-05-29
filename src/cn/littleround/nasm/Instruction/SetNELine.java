package cn.littleround.nasm.Instruction;

import cn.littleround.nasm.Operand.RegOperand;

public class SetNELine extends SetLine {
    public SetNELine(RegOperand op) {
        super(op);
    }

    @Override
    String getIns() {
        return "setne";
    }
}
