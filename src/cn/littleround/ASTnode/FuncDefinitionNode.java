package cn.littleround.ASTnode;

import cn.littleround.symbol.FuncFormSymbol;
import cn.littleround.symbol.Symbol;
import cn.littleround.symbol.VariableSymbol;

import java.util.ArrayList;

public class FuncDefinitionNode extends DeclarationNode {
    public ArgumentTypeListNode args() {
        return (ArgumentTypeListNode) getSons().get(1).getSons().get(1);
    }

    public DeclaratorNode declarator() {
        return (DeclaratorNode) getSons().get(1).getSons().get(0);
    }

    public Symbol getSymbol() {
        FuncFormSymbol ffs = new FuncFormSymbol();
        ffs.setRetType(specifier());
        ffs.setName(declarator().getIdentifier());
        for (Symbol i:args().getSymbols()) {
            VariableSymbol vs = (VariableSymbol) i;
            ffs.addParam(vs.getType());
        }
        ffs.setSrc(this);
        return ffs;
    }

    @Override
    public ArrayList<Symbol> getSymbols() {
        ArrayList<Symbol> sl = new ArrayList<>();
        sl.add(getSymbol());
        return sl;
    }
}
