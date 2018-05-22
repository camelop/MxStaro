package cn.littleround.type;

import cn.littleround.symbol.FuncSymbol;

public class FuncType extends BaseType {
    FuncSymbol fs;

    public FuncType(FuncSymbol fs) {
        this.fs = fs;
    }

    public BaseType getRetType(TypeList tl) {
        return fs.getRetType(tl);
    }

    @Override
    public int getSize() {
        return 0;
    }
}
