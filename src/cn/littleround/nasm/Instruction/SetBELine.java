package cn.littleround.nasm.Instruction;

import cn.littleround.nasm.Operand.BaseOperand;
import cn.littleround.nasm.Operand.RegOperand;

public class SetBELine extends SetLine {

    public SetBELine(RegOperand op) {
        super(op);
    }

    @Override
    String getIns() {
        return "setbe";
    }
}
