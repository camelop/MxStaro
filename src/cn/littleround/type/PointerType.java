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
}
