package cn.littleround.nasm.Instruction;

import cn.littleround.nasm.Operand.BaseOperand;

public class JleLine extends JLine {
    public JleLine(BaseOperand op) {
        super(op);
    }

    @Override
    String getIns() {
        return "jle";
    }
}
