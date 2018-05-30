package cn.littleround.nasm.Instruction;

import cn.littleround.nasm.Operand.BaseOperand;

import java.util.ArrayList;

public class MulLine extends BinaryOpLine {
    public MulLine(BaseOperand op1, BaseOperand op2) {
        super(op1, op2);
    }

    @Override
    String getIns() {
        return "imul";
    }

}
