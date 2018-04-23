package cn.littleround.ASTnode;

import cn.littleround.Constants;

public class IntCompareBinaryOpNode extends IntBinaryOpNode {
    @Override
    public void updateType() {
        super.updateType();
        type = Constants.BOOL;
    }
}
