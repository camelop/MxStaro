package cn.littleround.ASTnode;

import cn.littleround.Constants;
import cn.littleround.type.IntType;

public class IntBinaryOpNode extends BinaryOpNode {
    @Override
    public void updateType() {
        super.updateType();
        if (!(op1().type instanceof IntType) || !(op2().type instanceof IntType))
            if (op1().type == null || op2().type == null) {
                reportError("Semantic Error", "Expect int value between int operator, not null.");
            } else
                reportError("Semantic Error", "Expect int value between int operator, not "+op1().type.toString()+" and "+op2().type.toString()+".");
        type = Constants.INT;
    }
}
