package cn.littleround.ASTnode;

import cn.littleround.symbol.ClassSymbol;
import cn.littleround.symbol.FuncSymbol;
import cn.littleround.symbol.Symbol;
import cn.littleround.symbol.VariableSymbol;

import java.util.ArrayList;

public class ClassDefinitionNode extends DeclarationNode {
    private String identifier;
    private ArrayList<VariableSymbol> vl = new ArrayList<>();
    private ArrayList<FuncSymbol> fl = new ArrayList<>();

    public String getIdentifier() {
        return identifier;
    }

    public void setIdentifier(String identifier) {
        this.identifier = identifier;
    }

    // sons are declarations and functionDefinitions
    public ClassSymbol toClassSymbol() {
        ClassSymbol cs = new ClassSymbol();
        cs.setName(identifier);
        //TODO
        return null;
    }

    public void addVariable(Symbol s) {
        //TODO
    }
}
