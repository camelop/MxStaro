package cn.littleround.nasm.Instruction;

import cn.littleround.nasm.Operand.BaseOperand;
import cn.littleround.nasm.Operand.ConstantOperand;
import cn.littleround.nasm.Operand.SymbleOperand;

public class DbLine extends BaseLine {

    public DbLine(String label, String sym, BaseOperand c) {
        this.label = label;
        op1 = new SymbleOperand("\'"+sym+"\'");
        op2 = c;
    }

    public DbLine(String label, String sym) {
        this.label = label;
        op1 = new SymbleOperand("\'"+sym+"\'");
        op2 = null;
    }

    @Override
    String getIns() {
        return "db";
    }
}
