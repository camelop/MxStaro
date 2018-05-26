package cn.littleround.ASTnode;

import cn.littleround.ir.Function;
import cn.littleround.nasm.BasicBlock;
import cn.littleround.nasm.Instruction.MovLine;
import cn.littleround.nasm.Operand.VirtualRegOperand;
import cn.littleround.symbol.Symbol;
import cn.littleround.type.BaseType;
import cn.littleround.type.VoidType;

import java.util.ArrayDeque;

public class InitDeclaratorNode extends ASTBaseNode {
    private boolean isInitialized;

    private BaseType fatherType() {
        return ((DeclarationNode) getParent().getParent()).specifier().getType();
    }

    public boolean isInitialized() {
        return isInitialized;
    }

    public void setInitialized(boolean initialized) {
        isInitialized = initialized;
    }

    public DeclaratorNode declarator() {
        return (DeclaratorNode) getSons().get(0);
    }

    public ExpressionNode initValue() {
        if (!isInitialized) return null;
        return (ExpressionNode) getSons().get(1);
    }

    public String getIdentifier() {
        return declarator().getIdentifier();
    }

    @Override
    public void checkType() {
        super.checkType();
        if (isInitialized) {
            if (!fatherType().equals(getSons().get(1).type))
                reportError("Semantic", "Declaration init value should be type: "+fatherType().toString()+".");
        }
    }

    @Override
    public ArrayDeque<BasicBlock> renderNasm(Function f) throws Exception {
        ArrayDeque<BasicBlock> ret = new ArrayDeque<>();
        if (isInitialized) ret = initValue().renderNasm(f);
        int vid = f.nctx().getNewVid(declarator().getIdentifier());
        BasicBlock bb = new BasicBlock();
        if (isInitialized) {
            bb.add(new MovLine(
                    new VirtualRegOperand(vid),
                    new VirtualRegOperand(f.nctx().getVid(initValue())),
                    "init->"+getIdentifier()
            ));
        }
        BasicBlock.dequeCombine(ret, bb);
        return ret;
    }
}
