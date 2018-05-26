package cn.littleround.nasm.Instruction;

public class CommentLine extends BaseLine {
    public CommentLine(String c) {
        this.comment = c;
    }

    @Override
    String getIns() {
        return "";
    }

    @Override
    public String toString() {
        return ";"+comment+System.lineSeparator();
    }
}
