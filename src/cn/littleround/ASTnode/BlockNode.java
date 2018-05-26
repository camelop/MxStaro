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
        f.nctx().enterScope();
        ArrayDeque<BasicBlock> ret = renderAllSonNasm(f);
        f.nctx().leaveScope();
        return ret;
    }
}
