package cn.littleround.ASTnode;

public class TypeNode extends ASTBaseNode {
    private boolean isInline = false;
    private String identifier = "NoType";

    public boolean isInline() {
        return isInline;
    }

    public void setInline(boolean inline) {
        isInline = inline;
    }

    public String getIdentifier() {
        return identifier;
    }

    public void setIdentifier(String identifier) {
        this.identifier = identifier;
    }
}
