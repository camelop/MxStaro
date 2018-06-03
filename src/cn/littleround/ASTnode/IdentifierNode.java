package cn.littleround.ASTnode;

import cn.littleround.Constants;
import cn.littleround.ir.Function;
import cn.littleround.nasm.BasicBlock;
import cn.littleround.nasm.Instruction.MovLine;
import cn.littleround.nasm.Operand.MemSymOperand;
import cn.littleround.nasm.Operand.VirtualRegOperand;
import cn.littleround.symbol.*;
import cn.littleround.type.UserDefinedType;

import java.util.ArrayDeque;

public class IdentifierNode extends ExpressionNode {
    private Symbol def;

    private String identifier;

    public String getIdentifier() {
        return identifier;
    }

    public void setIdentifier(String identifier) {
        this.identifier = identifier;
    }

    public IdentifierNode(String identifier) {
        this.identifier = identifier;
    }

    @Override
    public void updateType() {
        super.updateType();
        def = getSymbolTable().getSymbol(identifier);
        //System.out.println(getSymbolTable().toInfoString());
        if (identifier.startsWith("_")) {
            reportError("Syntax", "identifier start with \'_\'.");
        }
        if (def == null) {
            reportError("Semantic", "Can't resolve symbol \'"+ identifier +"\'.");
        }
        if (def instanceof VariableSymbol && isSonOf(def.getSrc())) {
            reportError("Semantic", "Self reference \'"+ identifier +"\'."); //BUG? self ref !!!
        }
        type = symbolToType(def);
    }

    public void updateTypeToFunc() {
        def = getSymbolTable().getFuncSymbol(identifier);
        //System.out.println(getSymbolTable().toInfoString());
        if (def == null) {
            reportError("Semantic", "Can't resolve symbol \'"+ identifier +"\'.");
        }
        type = symbolToType(def);
    }

    public boolean isClassIdentifier() {
        ASTBaseNode f = getParent();
        while ((f != null) && !(f instanceof FuncDefinitionNode)) f = f.getParent();
        if (f == null) return false;
        FuncDefinitionNode fdn = (FuncDefinitionNode) f;
        if (!fdn.inClass()) return false;
        ClassDefinitionNode cdn = (ClassDefinitionNode) fdn.getParent();
        ClassSymbol cs = (ClassSymbol) getSymbolTable().getClassSymbol(cdn.getIdentifier());
        Symbol nw = cs.getSymbolTable().getSymbol(getIdentifier());
        return !(nw == null);
    }

    @Override
    public ArrayDeque<BasicBlock> renderNasm(Function f) throws Exception {
        ArrayDeque<BasicBlock> ret = new ArrayDeque<>();
        BasicBlock bb = new BasicBlock();
        if (f.nctx().contains(identifier)) {
            // local variable
            f.nctx().setNodeVid(this, f.nctx().getVid(identifier));
        } else {
            //System.err.println(identifier+" : "+String.valueOf(isClassIdentifier()));
            if (isClassIdentifier()){
                // add thisNode
                DotOpNode don = new DotOpNode();
                don.setIdentifier(getIdentifier());
                ThisNode tn = new ThisNode();
                don.addSon(tn);
                tn.type = new UserDefinedType(findFatherClassName());
                don.setSymbolTable(getSymbolTable());
                ret = don.renderNasm(f);
                f.nctx().setNodeVid(this, f.nctx().getVid(don));
            } else {
                // global variable
                int newVid = f.nctx().getVid();
                f.nctx().damage(newVid);
                bb.add(new MovLine(
                        new VirtualRegOperand(newVid),
                        new MemSymOperand(Constants.head + "_data_bss_" + identifier)
                ));
                f.nctx().setNodeVid(this, newVid);
            }
        }
        ret.add(bb);
        return ret;
    }

    @Override
    public void replaceIdentifier(String before, String after) {
        if (identifier.equals(before)) identifier = after;
        super.replaceIdentifier(before, after);
    }
}
