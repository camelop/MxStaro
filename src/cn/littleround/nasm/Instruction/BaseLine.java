package cn.littleround.nasm.Instruction;

import cn.littleround.Constants;
import cn.littleround.nasm.Operand.*;
import org.abego.treelayout.internal.util.java.lang.string.StringUtil;

import java.util.ArrayList;

public abstract class BaseLine {
    protected String label;
    abstract String getIns();

    public void setComment(String comment) {
        this.comment = comment;
    }

    protected String comment;
    protected BaseOperand op1, op2;

    private String align(String src, int length) {
        String ret = src;
        while (ret.length() < length) {
            ret = ret+" ";
        }
        return ret;
    }

    @Override
    public String toString() {
        String sep = "";
        StringBuilder sb = new StringBuilder();
        if (label != null) {
            if (label.length()<10) {
                sb.append(align(label+":   ",14));
            } else {
                sb.append(label);
                sb.append(":"+System.lineSeparator());
                sb.append("              ");//14
            }
        } else {
            sb.append("              ");//14
        }
        sb.append(sep);
        sb.append(align(getIns(), 8));
        sb.append(sep);
        if (op1 != null) sb.append(align(op1.toString(), 5));
            else sb.append("     ");//5
        if (op2 != null) {
            sb.append(", ");
            sb.append(align(op2.toString(),5));
        } else
            sb.append("     ");//5
        sb.append(sep);
        if (comment != null) sb.append("; ");
        if (comment != null) sb.append(comment);
        sb.append(System.lineSeparator());

        return sb.toString();
    }

    public int toId(BaseOperand op) {
        if (op instanceof ImmOperand) return Constants.noId;
        if (op instanceof MemOperand) return Constants.memOperandId;
        if (op instanceof VirtualRegOperand) return ((VirtualRegOperand) op).getVid()+Constants.virtualRegOperandIdOffset;
        if (op instanceof RegOperand) return ((RegOperand) op).getId();
        System.err.println("Oops?");
        return -1;
    }

    public ArrayList<Integer> getSrc() {
        return new ArrayList<>();
    }
    public ArrayList<Integer> getDes() {
        return new ArrayList<>();
    }
}
