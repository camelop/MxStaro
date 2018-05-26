package cn.littleround.ASTnode;

import cn.littleround.ir.Function;
import cn.littleround.nasm.BasicBlock;
import cn.littleround.symbol.ParamTypeNodeList;

import java.util.ArrayDeque;

public class ArgumentListNode extends ASTBaseNode {
    @Override
    public ArrayDeque<BasicBlock> renderNasm(Function f) throws Exception {
        return renderAllSonNasm(f);
    }
}
