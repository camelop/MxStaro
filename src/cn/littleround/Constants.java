package cn.littleround;

import cn.littleround.ASTnode.TypeNode;
import cn.littleround.symbol.FuncSymbol;
import cn.littleround.type.*;

import java.util.HashMap;

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

    // temp
    public final static String lib =
            "class built_in_string {\n" +
                    "    int length() {\n" +
                    "        return 0;\n" +
                    "    }\n" +
                    "    string substring(int left, int right) {\n" +
                    "        return \"\";\n" +
                    "    }\n" +
                    "    int parseInt() {\n" +
                    "        return 0;\n" +
                    "    }\n" +
                    "    int ord(int pos) {\n" +
                    "        return 0;\n" +
                    "    }\n" +
                    "}\n" +
                    "\n" +
                    "void print(string str) {\n" +
                    "}\n" +
                    "\n" +
                    "void println(string str) {\n" +
                    "}\n" +
                    "\n" +
                    "string getString() {\n" +
                    "    return \"abracadabra\";\n" +
                    "}\n" +
                    "\n" +
                    "int getInt() {\n" +
                    "    return 0;\n" +
                    "}\n" +
                    "\n" +
                    "string toString(int i) {\n" +
                    "    return \"abracadabra\";\n" +
                    "}\n";
}
