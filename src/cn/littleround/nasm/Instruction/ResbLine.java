package cn.littleround.nasm.Instruction;

import cn.littleround.nasm.Operand.DecimalOperand;

public class ResbLine extends BaseLine {
    public ResbLine(String label, int size) {
        this.label = label;
        op1 = new DecimalOperand(size);
    }

    @Override
    String getIns() {
        return "resb";
    }
}
