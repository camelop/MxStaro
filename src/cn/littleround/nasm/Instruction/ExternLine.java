package cn.littleround.nasm.Instruction;

import cn.littleround.nasm.Operand.SymbleOperand;

public class ExternLine extends BaseLine {
    @Override
    String getIns() {
        return "extern";
    }

    public ExternLine(String sym) {
        op1 = new SymbleOperand(sym);
    }
}
