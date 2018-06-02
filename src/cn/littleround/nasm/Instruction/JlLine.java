package cn.littleround.nasm.Instruction;

import cn.littleround.nasm.Operand.BaseOperand;

public class JlLine extends JLine {
    public JlLine(BaseOperand op) {
        super(op);
    }

    @Override
    String getIns() {
        return "jl";
    }
}
