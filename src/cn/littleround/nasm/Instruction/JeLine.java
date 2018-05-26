package cn.littleround.nasm.Instruction;

import cn.littleround.nasm.Operand.BaseOperand;

public class JeLine extends JLine {
    public JeLine(BaseOperand op) {
        super(op);
    }

    @Override
    String getIns() {
        return "je";
    }
}
