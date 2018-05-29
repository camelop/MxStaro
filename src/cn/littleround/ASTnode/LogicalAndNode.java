package cn.littleround.ASTnode;

import cn.littleround.Constants;
import cn.littleround.ir.Function;
import cn.littleround.nasm.BasicBlock;
import cn.littleround.nasm.Instruction.CmpLine;
import cn.littleround.nasm.Instruction.JeLine;
import cn.littleround.nasm.Instruction.MovLine;
import cn.littleround.nasm.Operand.DecimalOperand;
import cn.littleround.nasm.Operand.SymbleOperand;
import cn.littleround.nasm.Operand.VirtualRegOperand;

import java.util.ArrayDeque;

public class LogicalAndNode extends BoolBinaryOpNode {
    @Override
    public ArrayDeque<BasicBlock> renderNasm(Function f) throws Exception {
        ArrayDeque<BasicBlock> ret = new ArrayDeque<>();
        String label = f.nctx().getAndCnt();
        BasicBlock bb_init = new BasicBlock(label+"_lvalue");
        VirtualRegOperand vdes = new VirtualRegOperand(f.nctx().getVid());
        bb_init.add(new MovLine(
                vdes,
                new DecimalOperand(0)
        ));
        // render left
        ret.add(bb_init);
        BasicBlock.dequeCombine(ret, op1().renderNasm(f));
        BasicBlock lbb = new BasicBlock();
        lbb.add(new CmpLine(
                new VirtualRegOperand(f.nctx().getVid(op1())),
                new DecimalOperand(0)
        ));
        lbb.add(new JeLine(
                new SymbleOperand(label+"_end")
        ));
        BasicBlock.dequeCombine(ret, lbb);
        BasicBlock.dequeCombine(ret, new BasicBlock(label+"_rvalue"));
        BasicBlock.dequeCombine(ret, op2().renderNasm(f));
        BasicBlock rbb = new BasicBlock();
        rbb.add(new CmpLine(
                new VirtualRegOperand(f.nctx().getVid(op2())),
                new DecimalOperand(0)
        ));
        rbb.add(new JeLine(
                new SymbleOperand(label+"_end")
        ));
        rbb.add(new MovLine(
                vdes,
                new DecimalOperand(Constants.True)
        ));
        BasicBlock.dequeCombine(ret, rbb);
        BasicBlock.dequeCombine(ret, new BasicBlock(label+"_end"));
        f.nctx().setNodeVid(this, vdes.getVid());
        return ret;
    }
}
