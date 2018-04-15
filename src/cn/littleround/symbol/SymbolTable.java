package cn.littleround.symbol;

import java.util.HashMap;
import java.util.Map;

public class SymbolTable {
    private HashMap<String, VariableSymbol> vsm = new HashMap<>();
    private HashMap<String, FuncSymbol> fsm = new HashMap<>();
    private HashMap<String, ClassSymbol> csm = new HashMap<>();

    public boolean add(Symbol s) {
        // detect which kind of symbol
        if (s instanceof VariableSymbol) {
            if (vsm.containsKey(s.getName())) return false;
            vsm.put(s.getName(), (VariableSymbol) s);
            return true;
        } else if (s instanceof FuncFormSymbol) {
            FuncFormSymbol ffs = (FuncFormSymbol) s;
            if (fsm.containsKey(ffs.getName())) {
                FuncSymbol fs = fsm.get(ffs.getName());
                if (fs.contains(ffs.getParamTypeList())) return false;
                fs.addFuncForm(ffs);
                return true;
            } else {
                FuncSymbol fs = new FuncSymbol();
                fs.setName(ffs.getName());
                fs.addFuncForm(ffs);
                fsm.put(fs.getName(), fs);
                return true;
            }
        } else if (s instanceof FuncSymbol) {
            FuncSymbol fs = (FuncSymbol) s;
            if (fsm.containsKey(fs.getName())) {
                FuncSymbol fsLocal = fsm.get(fs.getName());
                for (FuncFormSymbol ffs:fs.getFuncFormSymbols()) {
                    if (fsLocal.contains(ffs.getParamTypeList())) return false;
                    fsLocal.addFuncForm(ffs);
                }
                return true;
            } else {
                fsm.put(fs.getName(), fs);
                return true;
            }
        } else if (s instanceof ClassSymbol) {
            if (s instanceof TypeSymbol) return true;
            ClassSymbol cs = (ClassSymbol) s;
            if (csm.containsKey(cs.getName())) return false;
            csm.put(cs.getName(), cs);
            return false;
        } else {
            return false;
        }
    }

    public String toInfoString() {
        StringBuffer sb = new StringBuffer();
        sb.append("Variables:\n");
        for (String name:vsm.keySet()) sb.append("\t"+name+"\n");
        sb.append("Functions:\n");
        for (String name:fsm.keySet()) sb.append("\t"+name+"\n");
        sb.append("Classes:\n");
        for (String name:csm.keySet()) sb.append("\t"+name+"\n");
        return sb.toString();
    }
}
