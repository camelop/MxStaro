package cn.littleround.nasm.Instruction;

public class RetLine extends ControlFlowLine {
    public RetLine() {
    }

    public RetLine(String comment) {
        this.comment = comment;
    }

    @Override
    String getIns() {
        return "ret";
    }
}
