package cn.littleround.Type;

import cn.littleround.Constants;

public class Type {
    private String name;
    private int size;

    public Type() {
    }

    public Type(String name) {
        if (name.equals("void")) size = 0;
        if (name.equals("int"))  size = Constants.sizeOfInt;
        if (name.equals("bool")) size = Constants.sizeOfBoolean;
        if (name.equals("String")) size = Constants.sizeOfString;
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }
}
