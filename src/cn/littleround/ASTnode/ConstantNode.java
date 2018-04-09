package cn.littleround.ASTnode;

public class ConstantNode extends ExpressionNode {
    private int constant;

    public int getConstant() {
        return constant;
    }

    public void setConstant(int constant) {
        this.constant = constant;
    }

    public ConstantNode(int constant) {
        this.constant = constant;
    }
}
