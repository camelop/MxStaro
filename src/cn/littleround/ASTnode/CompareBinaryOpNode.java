package cn.littleround.ASTnode;

import cn.littleround.Constants;
import cn.littleround.type.IntType;
import cn.littleround.type.StringType;

public class CompareBinaryOpNode extends BinaryOpNode {
    @Override
    public void updateType() {
        super.updateType();
        type = Constants.BOOL;
    }

    @Override
    public void checkType() {
        super.checkType();
        if (!(((op1().type instanceof IntType) && op2().type instanceof IntType)||((op1().type instanceof StringType)&&( op2().type instanceof StringType))))
            if (op1().type == null || op2().type == null) {
                reportError("Semantic", "Expect int or string value between operators, not null.");
            } else
                reportError("Semantic", "Expect int or string value between operators, not "+op1().type.toString()+" and "+op2().type.toString()+".");
    }
}
