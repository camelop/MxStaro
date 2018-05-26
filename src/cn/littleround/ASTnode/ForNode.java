package cn.littleround.ASTnode;

import cn.littleround.ir.Function;
import cn.littleround.nasm.BasicBlock;
import cn.littleround.nasm.Instruction.CmpLine;
import cn.littleround.nasm.Instruction.JeLine;
import cn.littleround.nasm.Instruction.JneLine;
import cn.littleround.nasm.Instruction.MovLine;
import cn.littleround.nasm.Operand.SymbleOperand;
import cn.littleround.nasm.Operand.VirtualRegOperand;

import java.util.ArrayDeque;

public class ForNode extends LoopNode {
    public ForConditionNode condition() { return (ForConditionNode) getSons().get(0); }
    public StatementNode statement() {
        return (StatementNode) getSons().get(1);
    }
    @Override
    public ArrayDeque<BasicBlock> renderNasm(Function f) throws Exception {
        String forLabel = f.getLabel()+"_"+f.nctx().getForCnt();
        ArrayDeque<BasicBlock> ret = new ArrayDeque<>();
        f.nctx().enterScope();
        ret.add(new BasicBlock(forLabel+"_init"));
        if (condition().isE1Exist()) {
            BasicBlock.dequeCombine(ret, condition().e1().renderNasm(f));
        }
        // first check
        BasicBlock.dequeCombine(ret, condition().e2().renderNasm(f));
        BasicBlock bb1 = new BasicBlock(forLabel+"_init_check");
        bb1.add(new CmpLine(
                new VirtualRegOperand(f.nctx().getVid(condition().e2()))
        ));
        bb1.add(new JeLine(
                new SymbleOperand(forLabel+"_end")
        ));
        BasicBlock.dequeCombine(ret, bb1);
        f.nctx().enterLoop();
        // run block
        ret.add(new BasicBlock(forLabel+"_start"));
        BasicBlock.dequeCombine(ret, statement().renderNasm(f));
        // do e3
        BasicBlock.dequeCombine(ret, condition().e3().renderNasm(f));
        // check and jump
        BasicBlock bb2 = new BasicBlock();
        BasicBlock.dequeCombine(ret, condition().e2().renderNasm(f));
        bb2.add(new CmpLine(
                new VirtualRegOperand(f.nctx().getVid(condition().e2()))
        ));
        bb2.add(new JneLine(
                new SymbleOperand(forLabel+"_start")
        ));
        BasicBlock.dequeCombine(ret, bb2);
        f.nctx().leaveLoop();
        // add end block
        BasicBlock bb3 = new BasicBlock(forLabel+"_end");
        BasicBlock.dequeCombine(ret, bb3);
        f.nctx().leaveScope();
        return ret;
    }
}
