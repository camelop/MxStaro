package cn.littleround.ASTnode;

import cn.littleround.ir.Function;
import cn.littleround.nasm.BasicBlock;

import java.util.ArrayDeque;

public class StatementNode extends ASTBaseNode{
    @Override
    // expression
    public ArrayDeque<BasicBlock> renderNasm(Function f) throws Exception {
        return renderAllSonNasm(f);
    }
}
