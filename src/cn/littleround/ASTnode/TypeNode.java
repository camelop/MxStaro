package cn.littleround.ASTnode;

public class TypeNode extends ASTBaseNode {
    private boolean isInline = false;

    public boolean isInline() {
        return isInline;
    }

    public void setInline(boolean inline) {
        isInline = inline;
    }
}
