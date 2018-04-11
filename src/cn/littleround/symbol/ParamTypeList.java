package cn.littleround.symbol;

import cn.littleround.ASTnode.TypeNode;

import java.util.ArrayList;

public class ParamTypeList {
    private ArrayList<TypeNode> list;

    public ParamTypeList() {
        this.list = new ArrayList<>();
    }

    public void add(TypeNode tn) {
        this.list.add(tn);
    }

    @Override
    public boolean equals(Object obj) {
        if (!(obj instanceof ParamTypeList)) return false;
        ParamTypeList rhs = (ParamTypeList) obj;
        return this.list.equals(rhs.list);
    }
}
