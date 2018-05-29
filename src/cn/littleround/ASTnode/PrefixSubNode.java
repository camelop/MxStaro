package cn.littleround.ASTnode;

import cn.littleround.ir.Function;
import cn.littleround.nasm.BasicBlock;

import java.util.ArrayDeque;

public class PrefixSubNode extends IntUnaryOpNode {
    @Override
    public void checkType() {
        super.checkType();
        if (!isLvalue(op1())) {
            reportError("Semantic", "-- to a r-value is illegal.");
        }
    }

    @Override
    public ArrayDeque<BasicBlock> renderNasm(Function f) throws Exception {
        ArrayDeque<BasicBlock> ret = super.renderNasm(f);
        //construct an assign node
        AssignNode assn = new AssignNode();
        assn.addSon(op1());
        SubNode subn = new SubNode();
        subn.addSon(op1());
        subn.addSon(new ConstantNode(1));
        assn.addSon(subn);
        BasicBlock.dequeCombine(ret, assn.renderNasm(f));
        // set vid
        f.nctx().setNodeVid(this, f.nctx().getVid(subn));
        return ret;
    }
}
