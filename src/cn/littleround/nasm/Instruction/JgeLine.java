package cn.littleround.nasm.Instruction;

import cn.littleround.nasm.Operand.BaseOperand;

public class JgeLine extends JLine {
    public JgeLine(BaseOperand op) {
        super(op);
    }

    @Override
    String getIns() {
        return "jge";
    }
}
