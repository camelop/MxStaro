package cn.littleround.ASTnode;

public class UnaryOpNode extends ExpressionNode {
    public ASTBaseNode op1() {
        return this.getSons().get(0);
    }
}
