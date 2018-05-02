package cn.littleround.ASTnode;

import cn.littleround.type.VoidType;

public class NewNode extends BinaryOpNode {
    @Override
    public void updateType() {
        super.updateType();
        type = ((TypeNode) op1()).getType();
        if (type instanceof VoidType)
            reportError("Semantic", "New void is unacceptable.");
    }
}
