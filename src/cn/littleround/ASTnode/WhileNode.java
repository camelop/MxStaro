package cn.littleround.ASTnode;

import cn.littleround.type.BoolType;

public class WhileNode extends LoopNode {
    @Override
    public void checkType() {
        super.checkType();
        if (!(getSons().get(0).type instanceof BoolType))
            reportError("Semantic","Non-boolean value inside while conditions.");
    }
}
