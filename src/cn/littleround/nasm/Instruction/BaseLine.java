package cn.littleround.nasm.Instruction;

import cn.littleround.nasm.Operand.BaseOperand;
import org.abego.treelayout.internal.util.java.lang.string.StringUtil;

public abstract class BaseLine {
    protected String label;
    abstract String getIns();

    public void setComment(String comment) {
        this.comment = comment;
    }

    protected String comment;
    protected BaseOperand op1, op2;

    @Override
    public String toString() {
        String sep = "\t\t";
        StringBuilder sb = new StringBuilder();
        if (label != null) sb.append(label);
        if (label != null) sb.append(":"+System.lineSeparator());
        sb.append(sep);
        sb.append(getIns());
        sb.append(sep);
        if (op1 != null) sb.append(op1.toString());
        if (op2 != null) {
            sb.append(", ");
            sb.append(op2.toString());
        }
        sb.append(sep);
        if (comment != null) sb.append("; ");
        if (comment != null) sb.append(comment);
        sb.append(System.lineSeparator());

        return sb.toString();
    }
}
