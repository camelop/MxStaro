package cn.littleround.ASTnode;

import cn.littleround.ir.Function;
import cn.littleround.nasm.BasicBlock;
import cn.littleround.nasm.Instruction.IncLine;
import cn.littleround.nasm.Instruction.MovLine;
import cn.littleround.nasm.Operand.VirtualRegOperand;

import java.util.ArrayDeque;

public class PostfixAddNode extends IntUnaryOpNode {
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
        int vid = f.nctx().getVid();
        bb.add(new MovLine(
                new VirtualRegOperand(vid),
                new VirtualRegOperand(f.nctx().getVid(op1()))
        ));
        BasicBlock.dequeCombine(ret, bb);
        f.nctx().setNodeVid(this, vid);
        //construct an assign node
        AssignNode assn = new AssignNode();
        assn.addSon(op1());
        AddNode addn = new AddNode();
        addn.addSon(op1());
        addn.addSon(new ConstantNode(1));
        assn.addSon(addn);
        BasicBlock.dequeCombine(ret, assn.renderNasm(f));
        return ret;
    }
}
