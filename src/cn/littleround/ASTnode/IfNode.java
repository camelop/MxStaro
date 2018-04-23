package cn.littleround.ASTnode;

import cn.littleround.type.BoolType;

public class IfNode extends StatementNode {
    private boolean elseExist;

    public boolean isElseExist() {
        return elseExist;
    }

    public void setElseExist(boolean elseExist) {
        this.elseExist = elseExist;
    }

    public ExpressionNode condition() {
        return (ExpressionNode) getSons().get(0);
    }

    @Override
    public void checkType() {
        super.checkType();
        if (!(condition().type instanceof BoolType))
            reportError("Semantic", "Non-Boolean value used in if-statement.");
    }
}
