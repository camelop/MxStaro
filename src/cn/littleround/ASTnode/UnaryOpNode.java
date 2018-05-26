package cn.littleround.ASTnode;

import cn.littleround.ir.Function;
import cn.littleround.nasm.BasicBlock;

import java.util.ArrayDeque;

public class UnaryOpNode extends ExpressionNode {
    public ASTBaseNode op1() {
        return this.getSons().get(0);
    }

    @Override
    public ArrayDeque<BasicBlock> renderNasm(Function f) throws Exception {
        return op1().renderNasm(f);
    }
}
