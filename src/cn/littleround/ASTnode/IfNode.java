package cn.littleround.ASTnode;

public class IfNode extends StatementNode {
    private boolean elseExist;

    public boolean isElseExist() {
        return elseExist;
    }

    public void setElseExist(boolean elseExist) {
        this.elseExist = elseExist;
    }
}
