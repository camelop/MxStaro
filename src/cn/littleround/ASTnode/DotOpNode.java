package cn.littleround.ASTnode;

public class DotOpNode extends UnaryOpNode {
    private String identifier;

    public String getIdentifier() {
        return identifier;
    }

    public void setIdentifier(String identifier) {
        this.identifier = identifier;
    }
}
