package cn.littleround.ASTnode;

import cn.littleround.symbol.ClassSymbol;

public class ClassDefinitionNode extends DeclarationNode {
    private String identifier;

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
}
