package cn.littleround.ASTnode;

import cn.littleround.ir.Macro;
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

    @Override
    public void createSymbolTable() {
        for (ASTBaseNode i:getSons()) {
            if ((i instanceof FuncDefinitionNode) || (i instanceof ClassDefinitionNode)) {
                for (Symbol s:((DeclarationNode) i).getSymbols()) {
                    if (!getSymbolTable().add(s)) reportError("Semantic Error", "Redefined symbol "+s.getName()+".");
                }
            }
        }
        for (ASTBaseNode i:getSons()) {
            if ((i instanceof DeclarationNode) && !(i instanceof FuncDefinitionNode) && !(i instanceof ClassDefinitionNode)) {
                for (Symbol s:((DeclarationNode) i).getSymbols()) {
                    if (!getSymbolTable().add(s)) reportError("Semantic Error", "Redefined symbol "+s.getName()+".");
                }
            }
            i.createSymbolTable();
            i.updateSymbolTable();
        }
    }

    public FuncDefinitionNode findFunctionFDN(String s) {

        for (ASTBaseNode i: getSons()) {
            if (i instanceof FuncDefinitionNode) {
                if (((FuncDefinitionNode) i).getIdentifier().equals(s)) {
                    return (FuncDefinitionNode) i;
                }
            }
        }
        return null;
    }

    public Macro collectMacros() {
        Macro ret = new Macro();
        for (ASTBaseNode son: getSons()) {
            if (son instanceof FuncDefinitionNode &&
                    ((FuncDefinitionNode) son).isMacro()) {
                ret.fs.add((FuncDefinitionNode) son);
            }
        }
        return ret;
    }
}
