package cn.littleround.ASTnode;

public class InitDeclaratorNode extends ASTBaseNode {
    private boolean isInitialized;

    public boolean isInitialized() {
        return isInitialized;
    }

    public void setInitialized(boolean initialized) {
        isInitialized = initialized;
    }
}
