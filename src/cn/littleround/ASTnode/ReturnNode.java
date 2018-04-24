package cn.littleround.ASTnode;

import cn.littleround.Constants;
import cn.littleround.symbol.FuncFormSymbol;
import cn.littleround.symbol.FuncSymbol;
import cn.littleround.type.BaseType;
import cn.littleround.type.VoidType;

public class ReturnNode extends JumpNode {
    private BaseType findFatherRetType() {
        ASTBaseNode f = getParent();
        while ((f != null) && !(f instanceof FuncDefinitionNode)) {
            f = f.getParent();
        }
        if (f == null) {
            reportError("Semantic","return not in a function.");
            return Constants.VOID;
        }
        return ((FuncFormSymbol) ((FuncDefinitionNode) f).getSymbol()).getRetType();
    }
    @Override
    public void checkType() {
        super.checkType();
        BaseType retType = findFatherRetType();
        if (retType instanceof VoidType) {
            if (getSons().size() > 0)
                reportError("Semantic", "\'"+getSons().get(0).getCtx().getText()+"\' unexpected after return in void function.");
        } else {
            if (getSons().size() == 0) {
                reportError("Semantic", "Return value missing.");
            } else if (getSons().size() > 1){
                reportError("Semantic", "Multi value unexpected while return.");
            } else {
                if (!retType.equals(getSons().get(0).type))
                    reportError("Semantic", "\'"+getSons().get(0).type.toString()+"\' should be replaced by a \'"+retType.toString()+"\' after return.");
            }
        }
    }
}
