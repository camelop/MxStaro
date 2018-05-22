package cn.littleround.ASTnode;

import cn.littleround.symbol.*;

import java.util.ArrayList;

public class ClassDefinitionNode extends DeclarationNode {
    private String identifier;

    public String getIdentifier() {
        return identifier;
    }

    public void setIdentifier(String identifier) {
        this.identifier = identifier;
    }

    private int collectSize() {
        int ret = 0;
        for (ASTBaseNode i:getSons()) {
            if (i instanceof DeclarationNode && !(i instanceof FuncDefinitionNode)) {
                DeclarationNode dn = (DeclarationNode) i;
                ret += dn.getSize();
            }
        }
        return ret;
    }

    // sons are declarations and functionDefinitions
    public ClassSymbol toClassSymbol() {
        ClassSymbol cs = new ClassSymbol();
        cs.setName(identifier);
        // update size
        cs.setSize(collectSize());
        // System.out.println(identifier+" "+String.valueOf(cs.size()));
        for (ASTBaseNode i:getSons()) {
            DeclarationNode dn = (DeclarationNode) i;
            for (Symbol s:dn.getSymbols()) {
                if (!cs.addSymbol(s)) reportError("Semantic",s.getName() + " is not a valid symbol.");
            }
        }
        return cs;
    }

    @Override
    public ArrayList<Symbol> getSymbols() {
        ArrayList<Symbol> sl= new ArrayList<>();
        sl.add(toClassSymbol());
        return sl;
    }

    @Override
    public void checkType() {
        for (ASTBaseNode i:getSons()) i.checkType();
    }

    @Override
    public void createSymbolTable() {
        for (ASTBaseNode i:getSons()) {
            if (i instanceof DeclarationNode) {
                for (Symbol s:((DeclarationNode) i).getSymbols()) {
                    if (!getSymbolTable().add(s)) reportError("Semantic Error", "Redefined symbol "+s.getName()+".");
                }
            }
        }
        for (ASTBaseNode i:getSons()) {
            i.createSymbolTable();
            i.updateSymbolTable();
        }
    }

    public ArrayList<ASTBaseNode> innerFuncs() {
        ArrayList<ASTBaseNode> ret = new ArrayList<>();
        for (ASTBaseNode i:getSons()) {
            if (i instanceof FuncDefinitionNode) {
                ret.add(i);
            }
        }
        return ret;
    }
}
