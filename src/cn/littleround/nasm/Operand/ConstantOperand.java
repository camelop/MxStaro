package cn.littleround.nasm.Operand;

public class ConstantOperand extends ImmOperand {
    private int value;

    public ConstantOperand(int value) {
        this.value = value;
    }

    @Override
    public String toString() {
        return String.valueOf(value);
    }
}
