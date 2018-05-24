package cn.littleround.ASTnode;

import cn.littleround.Constants;
import cn.littleround.type.IntType;
import cn.littleround.type.StringType;

public class AddNode extends BinaryOpNode {
    //TODO addVariable string

    @Override
    public void updateType() {
        super.updateType();
        //System.out.println(op2().getSymbolTable().toInfoString());
        if (!(((op1().type instanceof IntType) && op2().type instanceof IntType)||((op1().type instanceof StringType)&&( op2().type instanceof StringType))))
            if (op1().type == null || op2().type == null) {
                reportError("Semantic", "Expect int or string value between \'+\', not null.");
            } else
                reportError("Semantic", "Expect int or string value between \'+\', not "+op1().type.toString()+" and "+op2().type.toString()+".");
        type = op1().type;
    }
}
