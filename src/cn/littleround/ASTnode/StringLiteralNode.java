package cn.littleround.ASTnode;

import cn.littleround.Constants;

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

    @Override
    public void updateType() {
        super.updateType();
        type = Constants.STRING;
    }
}
