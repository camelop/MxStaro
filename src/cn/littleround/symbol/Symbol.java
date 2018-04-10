package cn.littleround.symbol;

import cn.littleround.Constants;

public abstract class Symbol {
    private String name;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public abstract int size();

    @Override
    public boolean equals(Object obj) {
        if (this.getClass().equals(obj.getClass())) return false;
        Symbol rhs = (Symbol) obj;
        return this.name.equals(rhs.name);
    }
}
