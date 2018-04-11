package cn.littleround.symbol;

import java.util.Map;

public class SymbolTable {
    private Map<String, VariableSymbol> vsm;
    private Map<String, FuncSymbol> fsm;

    public boolean add(Symbol s) {
        // detect which kind of symbol
        if (s instanceof VariableSymbol) {
            if (vsm.containsKey(s.getName())) return false;
            vsm.put(s.getName(), (VariableSymbol) s);
        } else if (s instanceof FuncFormSymbol) {
            FuncFormSymbol ffs = (FuncFormSymbol) s;
            if (fsm.containsKey(ffs.getName())) {
                FuncSymbol fs = fsm.get(ffs.getName());
                if (fs.contains(ffs.getParamTypeList())) return false;
                fs.addFuncForm(ffs);
                return true;
            } else {
                FuncSymbol fs = new FuncSymbol();
                fs.addFuncForm(ffs);
                fsm.put(fs.getName(), fs);
                return true;
            }
        } else if (s instanceof FuncSymbol) {
            // TODO
            return false;
        } else if (s instanceof ClassSymbol) {
            // TODO
            return false;
        } else {
            return false;
        }
        return false;
    }
}
