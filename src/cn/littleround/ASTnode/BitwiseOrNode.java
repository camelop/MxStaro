package cn.littleround.ASTnode;

public class BitwiseOrNode extends UnaryOpNode {
    @Override
    public void updateType() {
        super.updateType();
        reportError("Semantic Error", "No \'|\' unary-operator in MxStar.");
    }
}
