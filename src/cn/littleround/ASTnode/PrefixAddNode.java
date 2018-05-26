package cn.littleround.ASTnode;

import cn.littleround.ir.Function;
import cn.littleround.nasm.BasicBlock;
import cn.littleround.nasm.Instruction.AddLine;
import cn.littleround.nasm.Instruction.IncLine;
import cn.littleround.nasm.Instruction.MovLine;
import cn.littleround.nasm.Operand.VirtualRegOperand;

import java.util.ArrayDeque;

public class PrefixAddNode extends IntUnaryOpNode {
    @Override
    public void checkType() {
        super.checkType();
        if (!isLvalue(op1())) {
            reportError("Semantic", "++ to a r-value is illegal.");
        }
    }

    @Override
    public ArrayDeque<BasicBlock> renderNasm(Function f) throws Exception {
        ArrayDeque<BasicBlock> ret = super.renderNasm(f);
        BasicBlock bb = new BasicBlock();
        bb.add(new IncLine(new VirtualRegOperand(f.nctx().getVid(op1()))));
        f.nctx().setNodeVid(this, f.nctx().getVid(op1()));
        BasicBlock.dequeCombine(ret, bb);
        return ret;
    }
}
