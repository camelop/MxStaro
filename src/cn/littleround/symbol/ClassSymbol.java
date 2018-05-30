package cn.littleround.symbol;

import java.util.HashMap;

public class ClassSymbol extends Symbol {
    private SymbolTable st = new SymbolTable();

    public boolean isHasConstructor() {
        return hasConstructor;
    }

    private boolean hasConstructor = false;

    public void setHasConstructor(boolean hasConstructor) {
        this.hasConstructor = hasConstructor;
    }

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
        //System.err.println(id+":"+offsets.toString());
        if (!offsets.containsKey(id)) {
            // maybe a function?
            return -1;
        }
        return offsets.get(id);
    }
}
