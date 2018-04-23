package cn.littleround.ASTnode;

import cn.littleround.Constants;
import cn.littleround.type.IntType;

public class IntBinaryOpNode extends BinaryOpNode {
    @Override
    public void updateType() {
        super.updateType();
        if (!(op1().type instanceof IntType) || !(op2().type instanceof IntType))
            reportError("Semantic Error", "Expect bool value between bool operator.");
        type = Constants.INT;
    }
}
