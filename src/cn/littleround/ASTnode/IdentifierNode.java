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
        if (def == null) {
            reportError("Semantic", "Can't resolve symbol \'"+Identifier+"\'.");
        }
        type = symbolToType(def);
    }

    @Override
    public void checkType() {
        super.checkType();
        if ((def instanceof VariableSymbol) && def.getSrc().getCtx().getStart().getLine() > getCtx().getStart().getLine())
            reportError("Semantic", "Invalid or Backref \'"+def.getName()+"\'.");
    }
}
