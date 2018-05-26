package cn.littleround.nasm.Instruction;

import cn.littleround.nasm.Operand.BaseOperand;
import cn.littleround.nasm.Operand.DecimalOperand;

public class IncLine extends AddLine {
    public IncLine(BaseOperand op1) {
        super(op1, new DecimalOperand(1));
    }
}
