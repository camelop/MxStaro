package cn.littleround.nasm.Instruction;

import cn.littleround.nasm.Operand.BaseOperand;

public class JmpLine extends JLine {
    public JmpLine(BaseOperand op) {
        super(op);
    }

    @Override
    String getIns() {
        return "jmp";
    }
}
