package cn.littleround.ASTnode;

import cn.littleround.ir.Function;
import cn.littleround.nasm.BasicBlock;
import cn.littleround.nasm.Instruction.MovLine;
import cn.littleround.nasm.Instruction.NegLine;
import cn.littleround.nasm.Operand.VirtualRegOperand;

import java.util.ArrayDeque;

public class UnaryNegativeNode extends IntUnaryOpNode {
    @Override
    public ArrayDeque<BasicBlock> renderNasm(Function f) throws Exception {
        ArrayDeque<BasicBlock> ret = super.renderNasm(f);
        BasicBlock bb = new BasicBlock();
        int vdes = f.nctx().getVid();
        bb.add(new MovLine(
                new VirtualRegOperand(vdes),
                new VirtualRegOperand(f.nctx().getVid(op1()))
        ));
        bb.add(new NegLine(new VirtualRegOperand(vdes)));
        BasicBlock.dequeCombine(ret, bb);
        f.nctx().setNodeVid(this, vdes);
        return ret;
    }
}
