package cn.littleround.nasm.Instruction;

import cn.littleround.nasm.Operand.SymbleOperand;

public class DbLine extends BaseLine {

    public DbLine(String label, String sym) {
        this.label = label;
        op1 = new SymbleOperand("\'"+sym+"\'");
    }

    @Override
    String getIns() {
        return "db";
    }
}
