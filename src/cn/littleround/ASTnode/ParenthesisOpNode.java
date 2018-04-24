package cn.littleround.ASTnode;

import cn.littleround.symbol.VariableSymbol;
import cn.littleround.type.FuncType;
import cn.littleround.type.TypeList;

public class ParenthesisOpNode extends BinaryOpNode {
    @Override
    public void updateType() {
        super.updateType();
        if (!(op1().type instanceof FuncType)) {
            if (op1() instanceof IdentifierNode) {
                ((IdentifierNode) op1()).updateTypeToFunc();
            }
            if (op1() instanceof DotOpNode) {
                // WTF, tired to solve
            }
        }
        if (!(op1().type instanceof FuncType)) {
            reportError("Semantic Error", "op1 should be Func type in parenthesis operation.");
        }

        TypeList tl = new TypeList();
        for (ASTBaseNode i:op2().getSons()) {
            tl.add(i.type);
        }
        type = ((FuncType) op1().type).getRetType(tl);
        if (type == null)
            reportError("Semantic", "Cannot find coresponding function form.");
    }
}
