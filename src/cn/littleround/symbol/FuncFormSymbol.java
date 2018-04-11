package cn.littleround.symbol;

import cn.littleround.ASTnode.TypeNode;

public class FuncFormSymbol extends Symbol {
    private TypeNode retType;
    private ParamTypeList paramTypeList = new ParamTypeList();
    @Override
    public int size() {
        return 0;
    }

    public void addParam(TypeNode tn) {
        paramTypeList.add(tn);
    }

    public void setRetType(TypeNode retType) {
        this.retType = retType;
    }

    public ParamTypeList getParamTypeList() {
        return this.paramTypeList;
    }
}
