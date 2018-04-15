package cn.littleround.symbol;

import cn.littleround.ASTnode.ASTBaseNode;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class FuncSymbol extends Symbol {
    private HashMap<ParamTypeList, FuncFormSymbol> ffsm = new HashMap<>();
    @Override
    public ASTBaseNode getSrc() {
        System.err.println("Invalid call: FuncSymbol.getSrc()");
        return null;
    }

    @Override
    public void setSrc(ASTBaseNode src) {
        System.err.println("Invalid call: FuncSymbol.setSrc()");
    }

    @Override
    public int size() {
        return 0;
    }

    public void addFuncForm(FuncFormSymbol ffs) {
        ffsm.put(ffs.getParamTypeList(), ffs);
    }

    public boolean contains(ParamTypeList ptl) {
        return ffsm.containsKey(ptl);
    }

    public ArrayList<FuncFormSymbol> getFuncFormSymbols () {
        return new ArrayList<>(ffsm.values());
    }
}
