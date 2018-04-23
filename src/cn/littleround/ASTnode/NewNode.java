package cn.littleround.ASTnode;

public class NewNode extends BinaryOpNode {
    @Override
    public void updateType() {
        super.updateType();
        type = ((TypeNode) op1()).getType();
    }
}
