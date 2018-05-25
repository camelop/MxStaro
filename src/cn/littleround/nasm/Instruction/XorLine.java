package cn.littleround.nasm.Instruction;

import cn.littleround.nasm.Operand.BaseOperand;

public class XorLine extends BinaryOpLine {
    public XorLine(BaseOperand op1, BaseOperand op2) {
        super(op1, op2);
    }

    public XorLine(BaseOperand op1) {
        super(op1, op1);
    }

    @Override
    String getIns() {
        return "xor";
    }
}
