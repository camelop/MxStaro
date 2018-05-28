package cn.littleround.ASTnode;

import cn.littleround.ir.Function;
import cn.littleround.nasm.BasicBlock;
import cn.littleround.type.BoolType;

import java.util.ArrayDeque;

public class WhileNode extends LoopNode {
    @Override
    public void checkType() {
        super.checkType();
        if (!(getSons().get(0).type instanceof BoolType))
            reportError("Semantic","Non-boolean value inside while conditions.");
    }
    @Override
    public ArrayDeque<BasicBlock> renderNasm(Function f) throws Exception {
        ForNode temp = new ForNode();
        ForConditionNode fcn = new ForConditionNode();
        fcn.addSon(new ExpressionNode());
        fcn.addSon(getSons().get(0)); // while's son
        fcn.addSon(new ExpressionNode());
        temp.addSon(fcn);
        temp.addSon(getSons().get(1)); // while's son 2
        return temp.renderNasm(f);
    }
}
