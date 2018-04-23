package cn.littleround.ASTnode;

import cn.littleround.Constants;
import cn.littleround.symbol.*;
import cn.littleround.type.FuncType;
import cn.littleround.type.KlassType;

public class IdentifierNode extends ExpressionNode {
    private Symbol def;

    private String Identifier;

    public String getIdentifier() {
        return Identifier;
    }

    public void setIdentifier(String identifier) {
        Identifier = identifier;
    }

    public IdentifierNode(String identifier) {
        Identifier = identifier;
    }

    @Override
    public void updateType() {
        super.updateType();
        def = getSymbolTable().getSymbol(Identifier);
        //System.out.println(getSymbolTable().toInfoString());
        type = symbolToType(def);
    }
}
