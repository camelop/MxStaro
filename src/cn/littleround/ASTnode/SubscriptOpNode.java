package cn.littleround.ASTnode;

import cn.littleround.type.IntType;
import cn.littleround.type.PointerType;

public class SubscriptOpNode extends BinaryOpNode {
    @Override
    public void updateType() {
        super.updateType();
        if (!(op1().type instanceof IntType))
            reportError("Semantic","Expect int after \'.\' operator.");
        if (!(op1().type instanceof PointerType))
            reportError("Semantic Error", "Expect pointer type before \'.\' operator.");
        else
            type = ((PointerType) op1().type).getOriginType();
    }
}
