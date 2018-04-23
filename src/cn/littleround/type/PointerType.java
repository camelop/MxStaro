package cn.littleround.type;

public class PointerType extends BaseType {
    private BaseType originType;
    @Override
    public String toString() {
        return originType.toString()+"[]";
    }

    public BaseType getOriginType() {
        return originType;
    }

    public PointerType(BaseType originType) {
        this.originType = originType;
    }

    @Override
    public boolean equals(Object obj) {
        if (!(obj instanceof PointerType)) return false;
        if (obj instanceof NullType) return true;
        if (this instanceof NullType) return true;
        return super.equals(obj);
    }
}
