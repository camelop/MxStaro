package cn.littleround.ASTnode;

import cn.littleround.Constants;
import cn.littleround.type.BoolType;

public class BoolBinaryOpNode extends BinaryOpNode {
    @Override
    public void updateType() {
        super.updateType();
        if (!(op1().type instanceof BoolType) || !(op2().type instanceof BoolType))
            reportError("Semantic Error", "Expect bool value between bool operator.");
        type = Constants.BOOL;
    }
}
