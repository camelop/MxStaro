package cn.littleround.nasm.Operand;

public class DecimalOperand extends ImmOperand {
    private int number;

    public DecimalOperand(int number) {
        this.number = number;
    }

    @Override
    public String toString() {
        return String.valueOf(number);
    }
}
