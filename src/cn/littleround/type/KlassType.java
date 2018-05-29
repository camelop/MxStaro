package cn.littleround.type;

import cn.littleround.symbol.ClassSymbol;

public class KlassType extends BaseType {
    ClassSymbol cs;
    // example: A x = new A();
    // First A --- UserDefinedType
    // Second A --- KlassType
    // x --- UserDefinedType
    public KlassType(ClassSymbol cs) {
        this.cs = cs;
    }

    @Override
    public int getSize() {
        return 0;
    }
}
