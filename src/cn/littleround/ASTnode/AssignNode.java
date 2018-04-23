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

    @Override
    public void checkType() {
        super.checkType();
        // left
        if (!((op1() instanceof IdentifierNode)||(op1() instanceof SubscriptOpNode)||(op1() instanceof ThisNode))) {
            reportError("Semantic", "Assign to a r-value is illegal.");
        }
    }
}
