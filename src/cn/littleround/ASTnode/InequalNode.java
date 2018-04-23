package cn.littleround.ASTnode;

import cn.littleround.Constants;

public class InequalNode extends BinaryOpNode {
    @Override
    public void updateType() {
        super.updateType();
        if (!op1().type.equals(op2().type)) {
            reportError("Semantic Error",
                    "Compare between different types( "+op1().type.toString()+" =? "+op2().type.toString()+" ).");
        }
        type = Constants.BOOL;
    }
}
