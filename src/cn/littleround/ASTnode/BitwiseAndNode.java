package cn.littleround.ASTnode;

public class BitwiseAndNode extends UnaryOpNode {
    @Override
    public void updateType() {
        super.updateType();
        reportError("Semantic Error", "No \'&\' unary-operator in MxStar.");
    }
}
