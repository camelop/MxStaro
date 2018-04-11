package cn.littleround.ASTnode;

import java.lang.reflect.Type;

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

    @Override
    public boolean equals(Object obj) {
        if (!(obj instanceof ASTBaseNode)) return false;
        TypeAttributeNode tan = (TypeAttributeNode) obj;
        return this.identifier == tan.identifier && this.pointerLevel == tan.pointerLevel;
    }
}
