package cn.littleround.type;

public abstract class BaseType {

    @Override
    public String toString() {
        return "BaseType";
    }

    @Override
    public boolean equals(Object obj) {
        return this.toString().equals(obj.toString());
    }

    abstract public int getSize();
}
