package cn.littleround.symbol;

import java.util.HashMap;

public class ClassSymbol extends Symbol {
    private SymbolTable st = new SymbolTable();

    public void setSize(int size) {
        this.size = size;
    }

    private int size = 0;

    @Override
    public int size() {
        return size;
    }

    public boolean addSymbol(Symbol s) {
        return st.add(s);
    }

    public Symbol getSymbol(String name) {
        return st.getSymbol(name);
    }

    public SymbolTable getSymbolTable() {
        return st;
    }

    @Override
    public String toString() {
        return "Class("+getName()+")";
    }

    private HashMap<String, Integer> offsets = null;
    public void setOffset(HashMap<String, Integer> stringIntegerHashMap) {
        offsets = stringIntegerHashMap;
    }

    public int getOffset(String id) {
        return offsets.get(id);
    }
}
