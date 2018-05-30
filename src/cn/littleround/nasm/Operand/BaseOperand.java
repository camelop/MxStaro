package cn.littleround.nasm.Operand;

public abstract class BaseOperand {
    abstract int getSize();

    @Override
    public boolean equals(Object obj) {
        return obj instanceof BaseOperand && toString().equals(obj.toString());
    }
}
