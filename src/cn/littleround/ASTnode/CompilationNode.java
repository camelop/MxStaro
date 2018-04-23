package cn.littleround.ASTnode;

import cn.littleround.symbol.ClassSymbol;
import cn.littleround.symbol.FuncFormSymbol;
import cn.littleround.symbol.FuncSymbol;

public class CompilationNode extends ASTBaseNode {
    @Override
    public void checkType() {
        super.checkType();
        if (!(getSymbolTable().getSymbol("main") instanceof FuncSymbol))
            reportError("Semantic","No valid main function.");
    }
}
