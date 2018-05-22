package cn.littleround.type;

import cn.littleround.Constants;

public class StringType extends BaseType {
    @Override
    public String toString() {
        return "string";
    }

    @Override
    public int getSize() {
        return Constants.sizeOfString;
    }
}
