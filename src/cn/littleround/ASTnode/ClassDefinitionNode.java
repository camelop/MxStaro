package cn.littleround.ASTnode;

import cn.littleround.symbol.*;

import java.util.ArrayList;
import java.util.HashMap;

public class ClassDefinitionNode extends DeclarationNode {
    private String identifier;
    private boolean hasConstructor = false;

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

    private HashMap<String, Integer> collectOffset() {
        HashMap<String, Integer> ret = new HashMap<String, Integer>();
        int nw = 0;
        for (ASTBaseNode i:getSons()) {
            if (i instanceof DeclarationNode && !(i instanceof FuncDefinitionNode)) {
                DeclarationNode dn = (DeclarationNode) i;
                int size = dn.getTypeSize();
                for (String id:dn.getIdentifiers()) {
                    ret.put(id, nw);
                    nw += dn.getSize();
                }
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
        cs.setOffset(collectOffset());
        // System.out.println(identifier+" "+String.valueOf(cs.size()));
        for (ASTBaseNode i:getSons()) {
            DeclarationNode dn = (DeclarationNode) i;
            for (Symbol s:dn.getSymbols()) {
                if (!cs.addSymbol(s)) reportError("Semantic",s.getName() + " is not a valid symbol.");
            }
            if (dn instanceof FuncDefinitionNode && ((FuncDefinitionNode) dn).getIdentifier().equals(getIdentifier())){
                hasConstructor = true;
            }
        }
        cs.setHasConstructor(hasConstructor);
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

    public ArrayList<FuncDefinitionNode> getInnerFuncs() {
        ArrayList<FuncDefinitionNode> ret = new ArrayList<>();
        for (ASTBaseNode i:getSons()) {
            if (i instanceof FuncDefinitionNode) {
                ret.add((FuncDefinitionNode) i);
            }
        }
        return ret;
    }

    @Override
    public String toTreeString(int blank, int step) {
        // hide built-in
        if (getIdentifier().startsWith("built_in_"))
            return "";
        return super.toTreeString(blank, step);
    }
}
