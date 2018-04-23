package cn.littleround.ASTnode;

import cn.littleround.symbol.Symbol;

import java.util.ArrayList;

public class ArgumentTypeListNode extends DeclarationNode {
    @Override
    public TypeNode specifier() {
        reportError("Unexpected","ArgumentTypeListNode specifier called.");
        return null;
    }

    @Override
    public ArrayList<Symbol> getSymbols() {
        ArrayList<Symbol> sl = new ArrayList<>();
        for (ASTBaseNode i:getSons()) {
            ArgumentDeclarationNode adn = (ArgumentDeclarationNode) i;
            sl.add(adn.getSymbol());
        }
        return sl;
    }

    @Override
    public void checkType() {
        for (ASTBaseNode i:getSons()) i.checkType();
    }
}
