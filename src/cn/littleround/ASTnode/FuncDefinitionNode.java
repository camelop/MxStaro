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

    public BlockNode block() { return (BlockNode) getSons().get(2);}

    public Symbol getSymbol() {
        FuncFormSymbol ffs = new FuncFormSymbol();
        ffs.setRetType(specifier());
        ffs.setName(declarator().getIdentifier());
        for (Symbol i:args().getSymbols()) {
            VariableSymbol vs = (VariableSymbol) i;
            ffs.addParam(vs.getTypeNode());
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

    @Override
    public void createSymbolTable() {
        for (ASTBaseNode i:block().getSons()) {
            if (i instanceof DeclarationNode) {
                for (Symbol s:((DeclarationNode) i).getSymbols()) {
                    if (!getSymbolTable().add(s)) reportError("Semantic Error", "Redefined symbol "+s.getName()+".");
                }
            }
            i.createSymbolTable();
        }
        //System.out.println("Table\n"+getSymbolTable().toInfoString());
        for (Symbol s:args().getSymbols()) {
            //System.out.println(s.getName());
            if (!getSymbolTable().add(s))
                reportError("Semantic Error", "Redefined symbol "+s.getName()+".");
        }
    }

    @Override
    public void checkType() {
        for (ASTBaseNode i:getSons()) i.checkType();
        if (specifier().attribute() == null) {
            // check if it is constructor
            ASTBaseNode f = getParent();
            while ((f!=null)&&!(f instanceof ClassDefinitionNode)) f = f.getParent();
            if (f == null)
                reportError("Semantic", "Where is the function specifiers?");
            else if (!((ClassDefinitionNode) f).getIdentifier().equals(declarator().getIdentifier())) {
                reportError("Semantic", "Constructor should be named \'"+
                        ((ClassDefinitionNode) f).getIdentifier()+
                        "\', not \'"+
                        declarator().getIdentifier()+"\'.");
            }
        }
    }
}
