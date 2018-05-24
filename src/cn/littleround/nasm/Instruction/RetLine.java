package cn.littleround.nasm.Instruction;

public class RetLine extends ControlFlowLine {
    @Override
    String getIns() {
        return "ret";
    }
}
