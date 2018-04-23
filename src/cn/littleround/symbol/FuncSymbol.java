package cn.littleround.symbol;

import cn.littleround.ASTnode.ASTBaseNode;
import cn.littleround.type.BaseType;
import cn.littleround.type.TypeList;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class FuncSymbol extends Symbol {
    private HashMap<ParamTypeNodeList, FuncFormSymbol> ffsm = new HashMap<>();
    private HashMap<String, FuncFormSymbol> tffsm = null;

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
        ffsm.put(ffs.getParamTypeNodeList(), ffs);
    }

    public boolean contains(ParamTypeNodeList ptl) {
        return ffsm.containsKey(ptl);
    }

    public ArrayList<FuncFormSymbol> getFuncFormSymbols () {
        return new ArrayList<>(ffsm.values());
    }

    private void transform() {
        tffsm = new HashMap<>();
        for (Map.Entry<ParamTypeNodeList, FuncFormSymbol> entry: ffsm.entrySet()) {
            tffsm.put(entry.getKey().toTypeList().toString(), entry.getValue());
        }
    }

    public BaseType getRetType(TypeList tl) {
        if (tffsm == null) transform();
        if (tffsm.get(tl.toString()) == null) {
            System.err.println("Fail while searching "+this.getName()+":"+tl.toString());
            System.err.println("Only got:\n"+tffsm.toString());
            return null;
        }
        return tffsm.get(tl.toString()).getRetType();
    }
}
