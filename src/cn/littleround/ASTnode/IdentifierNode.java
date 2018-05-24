package cn.littleround.ASTnode;

import cn.littleround.Constants;
import cn.littleround.ir.Function;
import cn.littleround.nasm.BasicBlock;
import cn.littleround.nasm.Instruction.MovLine;
import cn.littleround.nasm.Operand.GlobalVariableOperand;
import cn.littleround.nasm.Operand.VirtualRegOperand;
import cn.littleround.symbol.*;
import cn.littleround.type.FuncType;
import cn.littleround.type.KlassType;

import java.util.ArrayDeque;

public class IdentifierNode extends ExpressionNode {
    private Symbol def;

    private String Identifier;

    public String getIdentifier() {
        return Identifier;
    }

    public void setIdentifier(String identifier) {
        Identifier = identifier;
    }

    public IdentifierNode(String identifier) {
        Identifier = identifier;
    }

    @Override
    public void updateType() {
        super.updateType();
        def = getSymbolTable().getSymbol(Identifier);
        //System.out.println(getSymbolTable().toInfoString());
        if (Identifier.startsWith("_")) {
            reportError("Syntax", "Identifier start with \'_\'.");
        }
        if (def == null) {
            reportError("Semantic", "Can't resolve symbol \'"+Identifier+"\'.");
        }
        if (def instanceof VariableSymbol && isSonOf(def.getSrc())) {
            reportError("Semantic", "Self reference \'"+Identifier+"\'."); //TODO ? BUG? self ref !!!
        }
        type = symbolToType(def);
    }

    public void updateTypeToFunc() {
        def = getSymbolTable().getFuncSymbol(Identifier);
        //System.out.println(getSymbolTable().toInfoString());
        if (def == null) {
            reportError("Semantic", "Can't resolve symbol \'"+Identifier+"\'.");
        }
        type = symbolToType(def);
    }

    @Override
    public ArrayDeque<BasicBlock> renderNasm(Function f) throws Exception {
        ArrayDeque<BasicBlock> ret = new ArrayDeque<>();
        BasicBlock bb = new BasicBlock();
        if (f.nctx().contains(Identifier)) {
            // local variable
            f.nctx().setNodeVid(this, f.nctx().getVid(Identifier));
        } else {
            // global variable
            int newVid = f.nctx().getVid();
            f.nctx().damage(newVid);
            bb.add(new MovLine(
                    new VirtualRegOperand(newVid),
                    new GlobalVariableOperand(Identifier)
            ));
            f.nctx().setNodeVid(this, newVid);
        }
        ret.add(bb);
        return ret;
    }
}
