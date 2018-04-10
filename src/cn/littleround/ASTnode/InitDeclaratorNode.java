package cn.littleround.ASTnode;

public class InitDeclaratorNode extends ASTBaseNode {
    private boolean isInitialized;

    public boolean isInitialized() {
        return isInitialized;
    }

    public void setInitialized(boolean initialized) {
        isInitialized = initialized;
    }

    public DeclaratorNode declarator() {
        return (DeclaratorNode) getSons().get(0);
    }

    public ExpressionNode initValue() {
        if (!isInitialized) return null;
        return (ExpressionNode) getSons().get(1);
    }
}
