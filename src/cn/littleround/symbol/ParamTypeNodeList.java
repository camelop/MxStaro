package cn.littleround.symbol;

import cn.littleround.ASTnode.TypeNode;
import cn.littleround.type.BaseType;
import cn.littleround.type.TypeList;

import java.util.ArrayList;

public class ParamTypeNodeList {
    private ArrayList<TypeNode> list = new ArrayList<>();

    public void add(TypeNode tn) {
        this.list.add(tn);
    }

    @Override
    public boolean equals(Object obj) {
        if (!(obj instanceof ParamTypeNodeList)) return false;
        ParamTypeNodeList rhs = (ParamTypeNodeList) obj;
        return this.list.equals(rhs.list);
    }

    public TypeList toTypeList() {
        TypeList tl = new TypeList();
        for (TypeNode i: list) {
            tl.add(i.getType());
        }
        return tl;
    }
}
