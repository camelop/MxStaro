package cn.littleround.ASTnode;

import cn.littleround.ir.Function;
import cn.littleround.nasm.BasicBlock;

import java.util.ArrayDeque;

public class BlockNode extends StatementNode {
    public void addAssignNode(ExpressionNode lvalue, ExpressionNode rvalue) {
        AssignNode an = new AssignNode();
        an.addSon(lvalue);
        an.addSon(rvalue);

        StatementNode sn = new StatementNode();
        sn.addSon(an);

        addSon(sn);
    }

    @Override
    public ArrayDeque<BasicBlock> renderNasm(Function f) throws Exception {
        // TODO, below just test :D
        ArrayDeque<BasicBlock> ad = new ArrayDeque<>();
        ad.add(new BasicBlock("GZOTPA"));
        f.nctx().setNodeVid(this, 321);
        return ad;
    }
}
