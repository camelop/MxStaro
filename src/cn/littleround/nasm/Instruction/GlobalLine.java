package cn.littleround.nasm.Instruction;

import cn.littleround.nasm.Operand.SymbleOperand;

public class GlobalLine extends BaseLine {
    @Override
    String getIns() {
        return "global";
    }

    public GlobalLine() {
        op1 = new SymbleOperand("main");
    }
}
