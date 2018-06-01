package cn.littleround.nasm.Instruction;

import cn.littleround.nasm.Operand.BaseOperand;
import cn.littleround.nasm.Operand.ConstantOperand;
import cn.littleround.nasm.Operand.DecimalOperand;
import cn.littleround.nasm.Operand.SymbleOperand;

public class DbLine extends BaseLine {

    public DbLine(String label, String sym, BaseOperand c) {
        this.label = label;
        op1 = new SymbleOperand("`"+sym+"`");
        op2 = c;
    }

    public DbLine(String sym) {
        // should support better
        if (sym.contains("`")) {
            //System.err.println(sym);
            StringBuilder sb = new StringBuilder();
            for (char i:sym.toCharArray()) {
                if (i == '`') {
                    sb.append("\\`");
                } else {
                    sb.append(i);
                }
            }
            op1 = new SymbleOperand("`"+sb.toString()+"`");
            return;
        }
        op1 = new SymbleOperand("`"+sym+"`");
    }

    public DbLine(int c) {
        op1 = new DecimalOperand(c);
    }

    @Override
    String getIns() {
        return "db";
    }
}
