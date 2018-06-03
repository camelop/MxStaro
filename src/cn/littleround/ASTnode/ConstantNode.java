package cn.littleround.ASTnode;

import cn.littleround.Constants;
import cn.littleround.ir.Function;
import cn.littleround.nasm.BasicBlock;
import cn.littleround.nasm.Instruction.MovLine;
import cn.littleround.nasm.Operand.ConstantOperand;
import cn.littleround.nasm.Operand.VirtualRegOperand;
import cn.littleround.type.PointerType;

import java.util.ArrayDeque;

public class ConstantNode extends ExpressionNode {
    private int constant;
    private boolean isBool = false;
    private boolean isNull = false;

    public int getConstant() {
        return constant;
    }

    public void setConstant(int constant) {
        this.constant = constant;
    }

    public ConstantNode(int constant) {
        this.constant = constant;
    }

    public ConstantNode(boolean constant) {
        this.isBool = true;
        this.constant = constant ? Constants.True : 0;
    }

    public ConstantNode() {
        this.isNull = true;
        this.constant = 0;
    }

    public boolean isBool() {
        return isBool;
    }

    public void setBool(boolean bool) {
        isBool = bool;
    }

    @Override
    public boolean equals(Object obj) {
        if (!(obj instanceof ConstantNode)) return false;
        ConstantNode rhs = (ConstantNode) obj;
        return this.isNull == rhs.isNull && this.isBool == rhs.isBool && this.constant == rhs.constant;
    }

    @Override
    public void updateType() {
        super.updateType();
        if (isNull) type = Constants.NULL; else
            if (isBool) type = Constants.BOOL; else type = Constants.INT;
    }

    @Override
    public ArrayDeque<BasicBlock> renderNasm(Function f) throws Exception {
        ArrayDeque<BasicBlock> ret = new ArrayDeque<>();
        BasicBlock bb = new BasicBlock();
        int vid = f.nctx().getVid();
        bb.add(new MovLine(
                new VirtualRegOperand(vid),
                new ConstantOperand(constant)
        ));
        f.nctx().setNodeVid(this, vid);
        ret.add(bb);
        return ret;
    }

    @Override
    public ConstantNode toConstant() {
        return this;
    }
}
