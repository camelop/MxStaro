package cn.littleround.ASTnode;

import cn.littleround.symbol.Symbol;
import cn.littleround.symbol.VariableSymbol;

import java.util.ArrayList;

public class ArgumentDeclarationNode extends DeclarationNode {

    public DeclaratorNode declarator() {
        return (DeclaratorNode) getSons().get(1);
    }

    public String getIdentifer() {
        return declarator().getIdentifier();
    }

    public Symbol getSymbol() {
        VariableSymbol v = new VariableSymbol(specifier());
        v.setName(declarator().getIdentifier());
        v.setSrc(this);
        return v;
    }

    @Override
    public ArrayList<Symbol> getSymbols() {
        ArrayList<Symbol> sl = new ArrayList<>();
        sl.add(getSymbol());
        return sl;
    }

    @Override
    public void checkType() {
        for (ASTBaseNode i:getSons()) i.checkType();
    }
}
