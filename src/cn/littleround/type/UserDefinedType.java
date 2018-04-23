package cn.littleround.type;

public class UserDefinedType extends BaseType {
    private String typename = null;
    @Override
    public String toString() {
        return typename;
    }

    public UserDefinedType(String typename) {
        this.typename = typename;
    }
}
