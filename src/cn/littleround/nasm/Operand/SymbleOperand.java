package cn.littleround.nasm.Operand;

public class SymbleOperand extends ImmOperand {
    private String sym;

    public SymbleOperand(String sym) {
        this.sym = sym;
    }

    @Override
    public String toString() {
        return sym;
    }

    @Override
    int getSize() {
        return 0;
    }
}
