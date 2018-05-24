package cn.littleround.ASTnode;

import cn.littleround.ir.Function;
import cn.littleround.nasm.BasicBlock;

import java.util.ArrayDeque;

public class BinaryOpNode extends ExpressionNode {

    public ASTBaseNode op1() {
        return this.getSons().get(0);
    }

    public ASTBaseNode op2() {
        return this.getSons().get(1);
    }

    @Override
    public ArrayDeque<BasicBlock> renderNasm(Function f) throws Exception {
        ArrayDeque<BasicBlock> ret = op1().renderNasm(f);
        ArrayDeque<BasicBlock> op2_ad = op2().renderNasm(f);
        if (ret.size() == 0) {
            ret = op2_ad;
        } else {
            BasicBlock.dequeCombine(ret, op2_ad);
        }
        return ret;
    }
}
