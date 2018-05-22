package cn.littleround.type;

import cn.littleround.Constants;

public class UserDefinedType extends BaseType {
    private String typename = null;
    @Override
    public String toString() {
        return typename;
    }

    public UserDefinedType(String typename) {
        this.typename = typename;
    }

    @Override
    public boolean equals(Object obj) {
        if (!(obj instanceof BaseType)) return false;
        if (obj instanceof NullType) return true;
        return super.equals(obj);
    }

    @Override
    public int getSize() {
        return Constants.sizeOfPointer;
    }
}
