package cn.littleround.nasm.Instruction;

import cn.littleround.nasm.Operand.BaseOperand;

public class JneLine extends JLine {
    public JneLine(BaseOperand op) {
        super(op);
    }

    @Override
    String getIns() {
        return "jne";
    }
}
