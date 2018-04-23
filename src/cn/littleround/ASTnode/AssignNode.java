package cn.littleround.ASTnode;

public class AssignNode extends BinaryOpNode {
    @Override
    public void updateType() {
        super.updateType();
        if (!op1().type.equals(op2().type)) {
            reportError("Semantic",
                    "Compare between different types( "+op1().type.toString()+" =? "+op2().type.toString()+" ).");
        }
    }
}
