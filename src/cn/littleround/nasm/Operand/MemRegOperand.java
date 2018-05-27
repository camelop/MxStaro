package cn.littleround.nasm.Operand;

public class MemRegOperand extends MemOperand {
    private RegOperand op1, op2;

    public void setScale(int scale) {
        this.scale = scale;
    }

    private int scale = 1;

    public void setOffset(int offset) {
        this.offset = offset;
    }

    private int offset = 0;

    public MemRegOperand(RegOperand op1, RegOperand op2) {
        this.op1 = op1;
        this.op2 = op2;
    }

    public MemRegOperand(RegOperand op1) {
        this.op1 = op1;
        this.op2 = null;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("qword [");
        if (op1 != null) sb.append(op1.toString());
        if (op2 != null) {
            if (scale >= 0) {
                sb.append("+");
                sb.append(op2.toString());
                if (scale != 1) sb.append("*"+String.valueOf(scale));
            } else {
                sb.append("-");
                sb.append(op2.toString());
                if (scale != -1) sb.append("*"+String.valueOf(-scale));
            }
        }
        if (offset != 0) {
            if (offset > 0) {
                if (op1 != null) sb.append("+");
                sb.append(String.valueOf(offset));
            } else {
                sb.append("-");
                sb.append(String.valueOf(-offset));
            }
        }
        sb.append("]");
        return sb.toString();
    }
}
