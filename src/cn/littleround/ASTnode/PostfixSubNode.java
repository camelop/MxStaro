package cn.littleround.ASTnode;

import cn.littleround.ir.Function;
import cn.littleround.nasm.BasicBlock;

import java.util.ArrayDeque;

public class PostfixSubNode extends IntUnaryOpNode {
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
        int vid = f.nctx().getVid(op1());
        f.nctx().setNodeVid(this, vid);
        //construct an assign node
        AssignNode assn = new AssignNode();
        assn.addSon(op1());
        SubNode subn = new SubNode();
        subn.addSon(op1());
        subn.addSon(new ConstantNode(1));
        assn.addSon(subn);
        BasicBlock.dequeCombine(ret, assn.renderNasm(f));
        return ret;
    }
}
