package cn.littleround.ASTnode;

public class LoopJumpNode extends JumpNode {
    private ASTBaseNode findFatherLoop() {
        ASTBaseNode f = getParent();
        while ((f != null) && !(f instanceof LoopNode)) f = f.getParent();
        return f;
    }
    @Override
    public void checkType() {
        super.checkType();
        if (findFatherLoop() == null) {
            reportError("Semantic", "Break/Continue should be in a loop.");
        }
    }
}
