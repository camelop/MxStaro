package cn.littleround.symbol;

import cn.littleround.ASTnode.TypeNode;
import cn.littleround.type.BaseType;

public class FuncFormSymbol extends Symbol {
    private TypeNode retType;
    private ParamTypeNodeList paramTypeNodeList = new ParamTypeNodeList();
    @Override
    public int size() {
        return 0;
    }

    public void addParam(TypeNode tn) {
        paramTypeNodeList.add(tn);
    }

    public void setRetType(TypeNode retType) {
        this.retType = retType;
    }

    public ParamTypeNodeList getParamTypeNodeList() {
        return this.paramTypeNodeList;
    }

    public BaseType getRetType() {
        //System.out.println("Resolve "+retType.getCtx().getText()+" -> "+retType.getType().toString());
        return retType.getType();
    }

    @Override
    public String toString() {
        return "("+paramTypeNodeList.toTypeList().toString()+")";
    }
}
