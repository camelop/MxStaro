package cn.littleround.ASTnode;

import cn.littleround.Constants;
import cn.littleround.type.BoolType;

public class BoolUnaryOpNode extends UnaryOpNode {
    @Override
    public void updateType() {
        super.updateType();
        if (!(op1().type instanceof BoolType))
            reportError("Semantic Error", "Expect bool value after \'!\' operator.");
        type = Constants.BOOL;
    }
}
