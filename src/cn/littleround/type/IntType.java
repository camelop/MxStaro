package cn.littleround.type;

import cn.littleround.Constants;

public class IntType extends BaseType {
    @Override
    public String toString() {
        return "int";
    }

    @Override
    public int getSize() {
        return Constants.sizeOfInt;
    }
}
