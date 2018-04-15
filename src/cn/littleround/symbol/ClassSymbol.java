package cn.littleround.symbol;

public class ClassSymbol extends Symbol {
    private SymbolTable st = new SymbolTable();
    private int size = 0;

    @Override
    public int size() {
        return size;
    }

    public boolean addSymbol(Symbol s) {
        return st.add(s);
    }
}
