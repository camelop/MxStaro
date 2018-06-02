package cn.littleround.ASTnode;

import cn.littleround.ir.Function;
import cn.littleround.nasm.BasicBlock;
import cn.littleround.nasm.Instruction.*;
import cn.littleround.nasm.Operand.SymbleOperand;
import cn.littleround.nasm.Operand.VirtualRegOperand;
import cn.littleround.type.StringType;

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
        VirtualRegOperand vRegE2 = new VirtualRegOperand(f.nctx().getVid(condition().e2()));
        vRegE2.isBYTE = true;
        BasicBlock bb1 = new BasicBlock(forLabel+"_init_check");
        bb1.add(new CmpLine(
                vRegE2
        ));
        bb1.add(new JeLine(
                new SymbleOperand(forLabel+"_end")
        ));
        BasicBlock.dequeCombine(ret, bb1);
        f.nctx().enterLoop();
        // run block
        ret.add(new BasicBlock(forLabel+"_start"));
        BasicBlock.dequeCombine(ret, statement().renderNasm(f));
        BasicBlock.dequeCombine(ret, new BasicBlock(forLabel+"_continue"));
        // do e3
        BasicBlock.dequeCombine(ret, condition().e3().renderNasm(f));
        // check and jump
        BasicBlock bb2 = new BasicBlock();
        if (condition().e2() instanceof CompareBinaryOpNode && !(((CompareBinaryOpNode) condition().e2()).op1().type instanceof StringType)) {
            CompareBinaryOpNode cbon = (CompareBinaryOpNode) condition().e2();
            BasicBlock.dequeCombine(ret, cbon.op1().renderNasm(f));
            BasicBlock.dequeCombine(ret, cbon.op2().renderNasm(f));
            VirtualRegOperand vll = new VirtualRegOperand(f.nctx().getVid(cbon.op1()));
            vll.isDWORD = true;
            VirtualRegOperand vrr = new VirtualRegOperand(f.nctx().getVid(cbon.op2()));
            vrr.isDWORD = true;
            bb2.add(new CmpLine(vll, vrr));
            if (cbon instanceof LessThanNode) {
                bb2.add(new JlLine(new SymbleOperand(forLabel + "_start")));
            } else if (cbon instanceof LessOrEqualThanNode) {
                bb2.add(new JleLine(new SymbleOperand(forLabel + "_start")));
            } else if (cbon instanceof GreaterThanNode) {
                bb2.add(new JgLine(new SymbleOperand(forLabel + "_start")));
            } else if (cbon instanceof GreaterOrEqualThanNode) {
                bb2.add(new JgeLine(new SymbleOperand(forLabel + "_start")));
            }
        } else {
            BasicBlock.dequeCombine(ret, condition().e2().renderNasm(f));
            vRegE2 = new VirtualRegOperand(f.nctx().getVid(condition().e2())); //again
            vRegE2.isBYTE = true;
            bb2.add(new CmpLine(
                    vRegE2
            ));
            bb2.add(new JneLine(
                    new SymbleOperand(forLabel+"_start")
            ));
        }
        BasicBlock.dequeCombine(ret, bb2);
        f.nctx().leaveLoop();
        // add end block
        BasicBlock bb3 = new BasicBlock(forLabel+"_end");
        BasicBlock.dequeCombine(ret, bb3);
        f.nctx().leaveScope();
        return ret;
    }
}
