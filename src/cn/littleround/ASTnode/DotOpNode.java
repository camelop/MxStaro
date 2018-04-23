package cn.littleround.ASTnode;

import cn.littleround.symbol.ClassSymbol;
import cn.littleround.symbol.Symbol;
import cn.littleround.type.UserDefinedType;

public class DotOpNode extends UnaryOpNode {
    private String identifier;

    public String getIdentifier() {
        return identifier;
    }

    public void setIdentifier(String identifier) {
        this.identifier = identifier;
    }

    @Override
    public void updateType() {
        super.updateType();
        if (!(op1().type instanceof UserDefinedType))
            reportError("Semantic Error", "Dot operator after traditional types is not allowed.");
        ClassSymbol cs = (ClassSymbol) getSymbolTable().getClassSymbol(op1().type.toString());
        Symbol s = cs.getSymbol(identifier);
        type = symbolToType(s);
    }
}
