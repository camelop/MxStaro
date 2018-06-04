package cn.littleround.ASTnode;

import cn.littleround.ir.Function;
import cn.littleround.nasm.BasicBlock;
import cn.littleround.symbol.ClassSymbol;
import cn.littleround.symbol.FuncSymbol;
import cn.littleround.symbol.Symbol;
import cn.littleround.symbol.VariableSymbol;
import cn.littleround.type.BaseType;
import cn.littleround.type.FuncType;
import cn.littleround.type.KlassType;

import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.HashMap;

public class ExpressionNode extends ASTBaseNode {
    protected boolean isLvalue(ASTBaseNode n) {
        return (n instanceof IdentifierNode) ||
                (n instanceof SubscriptOpNode) ||
        //        (n instanceof ThisNode) ||
                (n instanceof DotOpNode);
    }

    @Override
    public ArrayDeque<BasicBlock> renderNasm(Function f) throws Exception {
        return new ArrayDeque<BasicBlock>();
    }

    public void replaceIdentifier(String id, ExpressionNode src) throws CloneNotSupportedException {
        HashMap<ASTBaseNode, ASTBaseNode> replace = new HashMap<ASTBaseNode, ASTBaseNode>();
        for (ASTBaseNode son: getSons()) {
            if (son instanceof IdentifierNode
                    && ((IdentifierNode) son).getIdentifier().equals(id)) {
                replace.put(son, src.clone());
            }
        }
        if (replace.size() > 0) {
            ArrayList<ASTBaseNode> newSons = new ArrayList<ASTBaseNode>();
            for (ASTBaseNode son: getSons()) {
                if (replace.containsKey(son)) {
                    newSons.add(replace.get(son));
                } else {
                    newSons.add(son);
                }
            }
            setSons(newSons);
        }
        for (ASTBaseNode son: getSons()) {
            ExpressionNode e = (ExpressionNode) son;
            ((ExpressionNode) son).replaceIdentifier(id, src);
        }
    }
}
