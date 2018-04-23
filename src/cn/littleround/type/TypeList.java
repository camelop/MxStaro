package cn.littleround.type;

import cn.littleround.symbol.ParamTypeNodeList;

import java.util.ArrayList;

public class TypeList {
    private ArrayList<BaseType> list = new ArrayList<>();

    public void add(BaseType bt) { this.list.add(bt); }

    @Override
    public boolean equals(Object obj) {
        if (!(obj instanceof TypeList)) return false;
        TypeList rhs = (TypeList) obj;
        return this.list.equals(rhs.list);
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        boolean first = true;
        for (BaseType i:list) {
            if (!first) {
                sb.append(" ");
            } else {
                first = false;
            }
            sb.append(i.toString());
        }
        return sb.toString();
    }
}
