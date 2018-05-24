package cn.littleround.nasm.Instruction;

public class LabelLine extends BaseLine {
    public LabelLine(String label) {
        this.label = label;
    }

    @Override
    String getIns() {
        return "";
    }

    @Override
    public String toString() {
        if (label == null) return "";
        return label+":"+System.lineSeparator();
    }
}
