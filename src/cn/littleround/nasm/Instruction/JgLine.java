package cn.littleround.nasm.Instruction;

import cn.littleround.nasm.Operand.BaseOperand;

public class JgLine extends JLine {
    public JgLine(BaseOperand op) {
        super(op);
    }

    @Override
    String getIns() {
        return "jg";
    }
}
