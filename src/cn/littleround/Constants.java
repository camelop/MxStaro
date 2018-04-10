package cn.littleround;

public class Constants {
    public final static int sizeOfInt = 4;
    public final static int sizeOfBoolean = 1;
    public final static int sizeOfString = 0; //?

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
