package cn.littleround.ASTnode;

public class ConstantNode extends ExpressionNode {
    private int constant;
    private boolean isBool = false;

    public int getConstant() {
        return constant;
    }

    public void setConstant(int constant) {
        this.constant = constant;
    }

    public ConstantNode(int constant) {
        this.constant = constant;
    }

    public ConstantNode(boolean constant) {
        this.isBool = true;
        this.constant = constant ? 1 : 0;
    }

    public boolean isBool() {
        return isBool;
    }

    public void setBool(boolean bool) {
        isBool = bool;
    }
}
