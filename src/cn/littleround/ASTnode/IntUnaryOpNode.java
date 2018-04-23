package cn.littleround.ASTnode;

import cn.littleround.Constants;
import cn.littleround.type.IntType;

public class IntUnaryOpNode extends UnaryOpNode {
    @Override
    public void updateType() {
        super.updateType();
        if (!(op1().type instanceof IntType))
            reportError("Semantic Error", "Expected int after int operator.");
        type = Constants.INT;
    }
}
