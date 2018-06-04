package cn.littleround.ir;

import cn.littleround.ASTnode.ExpressionNode;
import cn.littleround.ASTnode.FuncDefinitionNode;

import java.util.ArrayList;

public class Macro {
    public ArrayList<FuncDefinitionNode> fs = new ArrayList<FuncDefinitionNode>();
    public boolean contains(String id) {
        for (FuncDefinitionNode f: fs) {
            if (f.getIdentifier().equals(id)) return true;
        }
        return false;
    }

    public ExpressionNode transform(String name, ArrayList<ExpressionNode> ids) throws CloneNotSupportedException {
        FuncDefinitionNode nw = null;
        for (FuncDefinitionNode f: fs) {
            if (f.getIdentifier().equals(name)) {
                nw = f;
                break;
            }
        }
        ExpressionNode ret = (ExpressionNode) nw.retExpression.clone();
        assert nw.identifierList.size() == ids.size();
        for (int i=0; i<ids.size(); ++i) {
            ret.replaceIdentifier(nw.identifierList.get(i), ids.get(i));
        }
        return ret;
    }
}
