package cn.littleround.ASTnode;

import cn.littleround.ir.Function;
import cn.littleround.nasm.BasicBlock;
import cn.littleround.nasm.Instruction.CmpLine;
import cn.littleround.nasm.Instruction.JeLine;
import cn.littleround.nasm.Instruction.JmpLine;
import cn.littleround.nasm.Instruction.JneLine;
import cn.littleround.nasm.Operand.SymbleOperand;
import cn.littleround.nasm.Operand.VirtualRegOperand;
import cn.littleround.type.BoolType;

import java.util.ArrayDeque;

public class IfNode extends StatementNode {
    private boolean elseExist;

    public boolean isElseExist() {
        return elseExist;
    }

    public void setElseExist(boolean elseExist) {
        this.elseExist = elseExist;
    }

    public ExpressionNode condition() {
        return (ExpressionNode) getSons().get(0);
    }

    @Override
    public void checkType() {
        super.checkType();
        if (!(condition().type instanceof BoolType))
            reportError("Semantic", "Non-Boolean value used in if-statement.");
    }
    @Override
    public ArrayDeque<BasicBlock> renderNasm(Function f) throws Exception {
        String ifLabel = f.getLabel()+"_"+f.nctx().getIfCnt();
        ArrayDeque<BasicBlock> ret = new ArrayDeque<>();
        f.nctx().enterScope();
        ret.add(new BasicBlock(ifLabel+"_init"));
        // first check
        BasicBlock.dequeCombine(ret, condition().renderNasm(f));
        VirtualRegOperand vCond = new VirtualRegOperand(f.nctx().getVid(condition()));
        vCond.isBYTE = true;
        BasicBlock bb1 = new BasicBlock(ifLabel+"_check");
        bb1.add(new CmpLine(
                vCond
        ));
        bb1.add(new JeLine(
                new SymbleOperand(ifLabel+"_else")
        ));
        BasicBlock.dequeCombine(ret, bb1);
        f.nctx().enterIf();
        // run block
        ret.add(new BasicBlock(ifLabel+"_start"));
        BasicBlock.dequeCombine(ret, getSons().get(1).renderNasm(f));
        // jump to end
        BasicBlock bb2 = new BasicBlock();
        bb2.add(new JmpLine(
                new SymbleOperand(ifLabel+"_end")
        ));
        BasicBlock.dequeCombine(ret, bb2);
        // add else
        BasicBlock.dequeCombine(ret, new BasicBlock(ifLabel+"_else"));
        if (isElseExist())
            BasicBlock.dequeCombine(ret, getSons().get(2).renderNasm(f));
        // add end block
        f.nctx().leaveIf();
        BasicBlock bb4 = new BasicBlock(ifLabel+"_end");
        BasicBlock.dequeCombine(ret, bb4);
        f.nctx().leaveScope();
        return ret;
    }
}
