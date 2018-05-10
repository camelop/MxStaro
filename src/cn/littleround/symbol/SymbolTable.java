package cn.littleround.symbol;

import java.util.HashMap;

public class SymbolTable {
    private HashMap<String, VariableSymbol> vsm = new HashMap<>();
    private HashMap<String, FuncSymbol> fsm = new HashMap<>();
    private HashMap<String, ClassSymbol> csm = new HashMap<>();

    public boolean add(Symbol s) {
        // detect which kind of symbol
        if (s instanceof VariableSymbol) {
            if (vsm.containsKey(s.getName())) return false;
            // begin stupid standard
            if (csm.containsKey(s.getName())) return false;
            if (fsm.containsKey(s.getName())) return false;
            // end stupid standard
            vsm.put(s.getName(), (VariableSymbol) s);
            return true;
        } else if (s instanceof FuncFormSymbol) {
            // begin stupid standard
            if (vsm.containsKey(s.getName())) return false;
            if (csm.containsKey(s.getName())) return false;
            // end stupid standard
            FuncFormSymbol ffs = (FuncFormSymbol) s;
            if (fsm.containsKey(ffs.getName())) {
                FuncSymbol fs = fsm.get(ffs.getName());
                if (fs.contains(ffs.getParamTypeNodeList())) return false;
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
            // begin stupid standard
            if (vsm.containsKey(s.getName())) return false;
            if (csm.containsKey(s.getName())) return false;
            // end stupid standard
            FuncSymbol fs = (FuncSymbol) s;
            if (fsm.containsKey(fs.getName())) {
                FuncSymbol fsLocal = fsm.get(fs.getName());
                for (FuncFormSymbol ffs:fs.getFuncFormSymbols()) {
                    if (fsLocal.contains(ffs.getParamTypeNodeList())) return false;
                    fsLocal.addFuncForm(ffs);
                }
                return true;
            } else {
                fsm.put(fs.getName(), fs);
                return true;
            }
        } else if (s instanceof ClassSymbol) {
            if (s instanceof TypeSymbol) return true;
            // begin stupid standard
            if (vsm.containsKey(s.getName())) return false;
            if (fsm.containsKey(s.getName())) return false;
            // end stupid standard
            ClassSymbol cs = (ClassSymbol) s;
            if (csm.containsKey(cs.getName())) return false;
            csm.put(cs.getName(), cs);
            return true;
        } else {
            return false;
        }
    }

    public String toInfoString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Variables:\n");
        for (String name:vsm.keySet()) sb.append("\t"+name+"\n");
        sb.append("Functions:\n");
        for (HashMap.Entry<String, FuncSymbol> entry: fsm.entrySet())
            sb.append("\t"+entry.getKey()+"\t"+entry.getValue().getFuncFormSymbols().toString()+"\n");
        sb.append("Classes:\n");
        for (String name:csm.keySet()) sb.append("\t"+name+"\n");
        return sb.toString();
    }

    public Symbol getSymbol(String name) {
        if (vsm.containsKey(name)) return vsm.get(name);
        if (fsm.containsKey(name)) return fsm.get(name);
        if (csm.containsKey(name)) return csm.get(name);
        return null;
    }

    public Symbol getClassSymbol(String name) {
        if (csm.containsKey(name)) return csm.get(name);
        if (fsm.containsKey(name)) return fsm.get(name);
        if (vsm.containsKey(name)) return vsm.get(name);
        return null;
    }

    public Symbol getFuncSymbol(String name) {
        if (fsm.containsKey(name)) return fsm.get(name);
        if (csm.containsKey(name)) return csm.get(name);
        if (vsm.containsKey(name)) return vsm.get(name);
        return null;
    }

    public void merge(SymbolTable rhs) {
        for (HashMap.Entry<String, VariableSymbol> entry: rhs.vsm.entrySet())
            vsm.putIfAbsent(entry.getKey(), entry.getValue());
        for (HashMap.Entry<String, FuncSymbol> entry: rhs.fsm.entrySet())
            fsm.putIfAbsent(entry.getKey(), entry.getValue());
        for (HashMap.Entry<String, ClassSymbol> entry: rhs.csm.entrySet())
            csm.putIfAbsent(entry.getKey(), entry.getValue());
    }

    public void reverse_merge(SymbolTable rhs) {
        for (HashMap.Entry<String, VariableSymbol> entry: rhs.vsm.entrySet())
            vsm.put(entry.getKey(), entry.getValue());
        for (HashMap.Entry<String, FuncSymbol> entry: rhs.fsm.entrySet())
            fsm.put(entry.getKey(), entry.getValue());
        for (HashMap.Entry<String, ClassSymbol> entry: rhs.csm.entrySet())
            csm.put(entry.getKey(), entry.getValue());
    }
}
