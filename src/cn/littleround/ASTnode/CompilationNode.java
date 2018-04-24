package cn.littleround.ASTnode;

import cn.littleround.symbol.ClassSymbol;
import cn.littleround.symbol.FuncFormSymbol;
import cn.littleround.symbol.FuncSymbol;
import cn.littleround.symbol.Symbol;
import cn.littleround.type.IntType;
import cn.littleround.type.TypeList;

public class CompilationNode extends ASTBaseNode {
    @Override
    public void checkType() {
        super.checkType();
        Symbol s = getSymbolTable().getSymbol("main");
        if (!(s instanceof FuncSymbol) || ((FuncSymbol) s).getRetType(new TypeList()) == null)
            reportError("Semantic","No valid main function.");
        else if (!(((FuncSymbol) s).getRetType(new TypeList()) instanceof IntType))
            reportError("Semantic","\'main\' function should return int.");
    }
}
