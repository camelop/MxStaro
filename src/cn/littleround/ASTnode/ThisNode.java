package cn.littleround.ASTnode;

import cn.littleround.type.KlassType;
import cn.littleround.type.UserDefinedType;

public class ThisNode extends ExpressionNode {
    private UserDefinedType findFatherType() {
        ASTBaseNode f = getParent();
        while ((f != null) && !(f instanceof ClassDefinitionNode)) f=f.getParent();
        if (f == null)
            reportError("Semantic Error", "\'this\' should be used in class definition.");
        return new UserDefinedType(((ClassDefinitionNode) f).getIdentifier());
    }
    @Override
    public void updateType() {
        super.updateType();
        type = findFatherType();
    }
}
