package cn.littleround.ASTnode;

public class TypeAttributeNode extends ASTBaseNode {
    private String identifier;
    private int pointerLevel = 0;

    public String getIdentifier() {
        return identifier;
    }

    public void setIdentifier(String identifier) {
        this.identifier = identifier;
    }

    public TypeAttributeNode(String identifier) {
        this.identifier = identifier;
    }

    public int getPointerLevel() {
        return pointerLevel;
    }

    public void addPointerLevel() {
        ++this.pointerLevel;
    }
}
