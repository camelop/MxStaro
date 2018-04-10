package cn.littleround.symbol;

import java.util.ArrayList;

public class ParamTypeList {
    private ArrayList<Symbol> list;

    public ParamTypeList(ArrayList<Symbol> list) {
        this.list = list;
    }

    public ParamTypeList() {
        this.list = new ArrayList<>();
    }

    public void add(Symbol tn) {
        this.list.add(tn);
    }

    @Override
    public boolean equals(Object obj) {
        if (!(obj instanceof ParamTypeList)) return false;
        ParamTypeList rhs = (ParamTypeList) obj;
        return this.list.equals(rhs.list);
    }
}
