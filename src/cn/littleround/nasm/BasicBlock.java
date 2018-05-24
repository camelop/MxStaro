package cn.littleround.nasm;

import cn.littleround.nasm.Instruction.BaseLine;
import cn.littleround.nasm.Instruction.LabelLine;

import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Collection;

public class BasicBlock {
    private String label;

    public BasicBlock(String label) {
        this.label = label;
        lines = new ArrayDeque<>();
        lines.add(new LabelLine(label));
    }

    public ArrayDeque<BaseLine> getLines() {
        return lines;
    }

    public void add(BaseLine line) {
        lines.add(line);
    }

    public void addFirst(BaseLine line) {
        lines.addFirst(line);
    }

    public void add(Collection<? extends BaseLine> c) {
        lines.addAll(c);
    }

    public void addFirst(ArrayList<BaseLine> c) {
        for (int i=c.size()-1; i>=0; --i) {
            lines.addFirst(c.get(i));
        }
    }

    private ArrayDeque<BaseLine> lines;
    private ArrayList<BasicBlock> next = new ArrayList<>();
}
