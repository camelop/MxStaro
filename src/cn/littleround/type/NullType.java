package cn.littleround.type;

public class NullType extends PointerType {
    public NullType() {
        super(null);
    }

    @Override
    public String toString() {
        return "null";
    }
}
