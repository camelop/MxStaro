package cn.littleround.ASTnode;

import cn.littleround.ir.Function;
import cn.littleround.nasm.BasicBlock;
import cn.littleround.type.KlassType;
import cn.littleround.type.UserDefinedType;

import java.util.ArrayDeque;

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

    @Override
    public ArrayDeque<BasicBlock> renderNasm(Function f) throws Exception {
        ArrayDeque<BasicBlock> ret = new ArrayDeque<BasicBlock>();
        int vid = f.nctx().getVid("this");
        f.nctx().setNodeVid(this, vid);
        return ret;
    }
}
