package cn.littleround.ASTnode;

import cn.littleround.symbol.Symbol;
import cn.littleround.symbol.VariableSymbol;

import java.util.ArrayList;

public class DeclarationNode extends ASTBaseNode {

    public TypeNode specifier() {
        return (TypeNode) getSons().get(0);
    }

    private DeclaratorListNode initDeclaratorList() {
        return (DeclaratorListNode) getSons().get(1);
    }

    public ArrayList<Symbol> getSymbols() {
        ArrayList<Symbol> sl = new ArrayList<>();
        for (ASTBaseNode i: initDeclaratorList().getSons()) {
            InitDeclaratorNode idn = (InitDeclaratorNode) i;
            VariableSymbol v = new VariableSymbol(specifier());
            v.setName(idn.declarator().getIdentifier());
            if (idn.isInitialized()) v.setInitValue(idn.initValue());
            v.setSrc(this);
            sl.add(v);
        }
        return sl;
    }
}
