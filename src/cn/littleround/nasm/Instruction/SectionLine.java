package cn.littleround.nasm.Instruction;

import cn.littleround.nasm.Operand.SymbleOperand;

public class SectionLine extends BaseLine {

    public SectionLine(String sym) {
        op1 = new SymbleOperand(sym);
    }

    @Override
    String getIns() {
        return "section";
    }
}
