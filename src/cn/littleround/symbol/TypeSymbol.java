package cn.littleround.symbol;

import cn.littleround.Constants;

public class TypeSymbol extends ClassSymbol {
    public int size() {
        return Constants.typeToSize(this.getName());
    }
}
