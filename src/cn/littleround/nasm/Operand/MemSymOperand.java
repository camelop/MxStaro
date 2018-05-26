package cn.littleround.nasm.Operand;

public class MemSymOperand extends MemOperand {
    private String label;

    public MemSymOperand(String label) {
        this.label = label;
    }

    @Override
    public String toString() {
        return "["+label+"]";
    }
}
