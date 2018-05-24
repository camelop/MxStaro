package cn.littleround.nasm.Instruction;

import cn.littleround.nasm.Operand.SymbleOperand;

public class CallLine extends BaseLine {

    public CallLine(String des) {
        op1 = new SymbleOperand(des);
    }

    @Override
    String getIns() {
        return "call";
    }
}
