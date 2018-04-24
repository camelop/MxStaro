package cn.littleround.ASTnode;

import cn.littleround.type.BoolType;

public class ForConditionNode extends StatementNode {
    private boolean declarationExist = false;
    private boolean e1Exist = false;
    private boolean e2Exist = false;
    private boolean e3Exist = false;


    public boolean isDeclarationExist() {
        return declarationExist;
    }

    public void setDeclarationExist(boolean declarationExist) {
        this.declarationExist = declarationExist;
    }

    public boolean isE1Exist() {
        return e1Exist;
    }

    public void setE1Exist(boolean e1Exist) {
        this.e1Exist = e1Exist;
    }

    public boolean isE2Exist() {
        return e2Exist;
    }

    public void setE2Exist(boolean e2Exist) {
        this.e2Exist = e2Exist;
    }

    public boolean isE3Exist() {
        return e3Exist;
    }

    public void setE3Exist(boolean e3Exist) {
        this.e3Exist = e3Exist;
    }

    @Override
    public void checkType() {
        super.checkType();
        if (!(getSons().get(1).type instanceof BoolType))
            reportError("Semantic", "Non-boolean value in for conditions.");
    }
}
