package cn.littleround.nasm.Instruction;

import cn.littleround.nasm.Operand.BaseOperand;

public abstract class JLine extends ControlFlowLine {
    public JLine(BaseOperand op) {
        this.op1=op;
    }
}
