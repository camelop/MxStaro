package cn.littleround.ASTnode;

import cn.littleround.symbol.Symbol;
import cn.littleround.type.BaseType;
import cn.littleround.type.VoidType;

public class InitDeclaratorNode extends ASTBaseNode {
    private boolean isInitialized;

    private BaseType fatherType() {
        return ((DeclarationNode) getParent().getParent()).specifier().getType();
    }

    public boolean isInitialized() {
        return isInitialized;
    }

    public void setInitialized(boolean initialized) {
        isInitialized = initialized;
    }

    public DeclaratorNode declarator() {
        return (DeclaratorNode) getSons().get(0);
    }

    public ExpressionNode initValue() {
        if (!isInitialized) return null;
        return (ExpressionNode) getSons().get(1);
    }

    @Override
    public void checkType() {
        super.checkType();
        if (isInitialized) {
            if (!fatherType().equals(getSons().get(1).type))
                reportError("Semantic", "Declaration init value should be type: "+fatherType().toString()+".");
        }
    }

}
