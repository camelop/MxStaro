package cn.littleround.ASTnode;

import cn.littleround.type.BaseType;

public class TypeNode extends ASTBaseNode {
    private boolean isInline = false;

    public TypeAttributeNode attribute() {
        if (getSons().size() != 1) return null;
        return (TypeAttributeNode) getSons().get(0);
    }

    public boolean isInline() {
        return isInline;
    }

    public void setInline(boolean inline) {
        isInline = inline;
    }

    @Override
    public boolean equals(Object obj) {
        if (!(obj instanceof TypeNode)) return false;
        TypeNode tn = (TypeNode) obj;
        return this.getSons().size() == 1 && tn.getSons().size() == 1 && this.attribute().equals(tn.attribute());
    }

    public BaseType getType() {
        return attribute().getType();
    }
}
