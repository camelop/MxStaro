package cn.littleround.nasm.Instruction;

import cn.littleround.nasm.Operand.RegOperand;

public class SetLLine extends SetLine {
    public SetLLine(RegOperand op) {
        super(op);
    }

    @Override
    String getIns() {
        return "setl";
    }
}
