package cn.littleround.type;

import cn.littleround.Constants;

public class BoolType extends BaseType {
    @Override
    public String toString() {
        return "bool";
    }

    @Override
    public int getSize() {
        return Constants.sizeOfBoolean;
    }
}
