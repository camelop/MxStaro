package cn.littleround.ASTnode;

import cn.littleround.symbol.ClassSymbol;
import cn.littleround.symbol.Symbol;
import cn.littleround.type.PointerType;
import cn.littleround.type.StringType;
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
        if (!(op1().type instanceof UserDefinedType) &&
                !(op1().type instanceof StringType) &&
                !(op1().type instanceof PointerType))
            reportError("Semantic Error", "Dot operator after traditional types is not allowed.");
        if (op1().type instanceof UserDefinedType) {
            ClassSymbol cs = (ClassSymbol) getSymbolTable().getClassSymbol(op1().type.toString());
            Symbol s = cs.getSymbol(identifier);
            type = symbolToType(s);
        } else if (op1().type instanceof StringType) {
            ClassSymbol cs = (ClassSymbol) getSymbolTable().getClassSymbol("built_in_string");
            Symbol s = cs.getSymbol(identifier);
            type = symbolToType(s);
        } else /* pointer Type */ {
            ClassSymbol cs = (ClassSymbol) getSymbolTable().getClassSymbol("built_in_array");
            Symbol s = cs.getSymbol(identifier);
            type = symbolToType(s);
        }
    }
}
