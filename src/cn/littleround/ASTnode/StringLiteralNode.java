package cn.littleround.ASTnode;

public class StringLiteralNode extends ExpressionNode {
    private String string;

    public String getString() {
        return string;
    }

    public void setString(String string) {
        this.string = string;
    }

    public StringLiteralNode(String string) {
        this.string = string;
    }
}
