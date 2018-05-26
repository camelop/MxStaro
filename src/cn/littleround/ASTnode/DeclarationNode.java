package cn.littleround.ASTnode;

import cn.littleround.ir.Function;
import cn.littleround.nasm.BasicBlock;
import cn.littleround.symbol.Symbol;
import cn.littleround.symbol.VariableSymbol;
import cn.littleround.type.VoidType;

import java.util.ArrayDeque;
import java.util.ArrayList;

public class DeclarationNode extends ASTBaseNode {

    public TypeNode specifier() {
        return (TypeNode) getSons().get(0);
    }

    public DeclaratorListNode initDeclaratorList() {
        return (DeclaratorListNode) getSons().get(1);
    }

    public ArrayList<Symbol> getSymbols() {
        ArrayList<Symbol> sl = new ArrayList<>();
        for (ASTBaseNode i: initDeclaratorList().getSons()) {
            InitDeclaratorNode idn = (InitDeclaratorNode) i;
            VariableSymbol v = new VariableSymbol(specifier());
            v.setName(idn.declarator().getIdentifier());
            if (idn.isInitialized()) v.setInitValue(idn.initValue());
            v.setSrc(this);
            sl.add(v);
        }
        return sl;
    }

    @Override
    public void checkType() {
        super.checkType();
        if (specifier().getType() instanceof VoidType)
            reportError("Semantic", "Void cannot be declared as variable.");
    }

    public int getSize() {
        return specifier().getType().getSize() * initDeclaratorList().getSons().size();
    }
    @Override
    public ArrayDeque<BasicBlock> renderNasm(Function f) throws Exception {
        return initDeclaratorList().renderNasm(f);
    }
}
