package cn.littleround.ASTnode;

import cn.littleround.ir.Function;
import cn.littleround.nasm.BasicBlock;

import java.util.ArrayDeque;

public class DeclaratorListNode extends ASTBaseNode {
    @Override
    public ArrayDeque<BasicBlock> renderNasm(Function f) throws Exception {
        return renderAllSonNasm(f);
    }
}
