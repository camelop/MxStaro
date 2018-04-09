package cn.littleround.ASTnode;

public class BinaryOpNode extends ExpressionNode {

    public ASTBaseNode op1() {
        return this.getSons().get(0);
    }

    public ASTBaseNode op2() {
        return this.getSons().get(1);
    }
}
