package cn.littleround;

import cn.littleround.symbol.FuncSymbol;
import cn.littleround.type.*;

public class Constants {
    public final static int sizeOfInt = 4;
    public final static int sizeOfBoolean = 1;
    public final static int sizeOfString = 0; //?
    public final static BoolType BOOL = new BoolType();
    public final static IntType INT = new IntType();
    public final static StringType STRING = new StringType();
    public final static VoidType VOID = new VoidType();
    public final static int typeToSize(String typename) {
        switch (typename) {
            case "int":
                return sizeOfInt;
            case "bool":
                return sizeOfBoolean;
            case "string":
                return sizeOfString;
            default:
                /*void*/
                return 0;
        }
    }
}
