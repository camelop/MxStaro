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
}
