package cn.littleround.ASTnode;

import cn.littleround.symbol.ClassSymbol;
import cn.littleround.symbol.FuncSymbol;
import cn.littleround.symbol.Symbol;
import cn.littleround.symbol.VariableSymbol;
import cn.littleround.type.BaseType;
import cn.littleround.type.FuncType;
import cn.littleround.type.KlassType;

public class ExpressionNode extends ASTBaseNode {
    protected BaseType symbolToType(Symbol def) {
        BaseType ret = null;
        if (def instanceof VariableSymbol) ret = ((VariableSymbol) def).getType(); else {
            if (def instanceof FuncSymbol) ret = new FuncType((FuncSymbol) def); else {
                if (def instanceof ClassSymbol) {
                    ret = new KlassType((ClassSymbol) def);
                }
            }
        }
        return ret;
    }
}
