package cn.littleround.symbol;

import cn.littleround.ASTnode.ASTBaseNode;
import cn.littleround.ASTnode.ConstantNode;
import cn.littleround.ASTnode.ExpressionNode;
import cn.littleround.ASTnode.TypeNode;

public class VariableSymbol extends Symbol {

    private TypeNode type;
    private ExpressionNode initValue = null;

    @Override
    public int size() {
        return 0;
    }

    public VariableSymbol(TypeNode type) {
        this.type = type;
    }

    public ExpressionNode getInitValue() {
        return initValue;
    }

    public void setInitValue(ExpressionNode initValue) {
        this.initValue = initValue;
    }
}
