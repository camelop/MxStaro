package cn.littleround.nasm;

import cn.littleround.nasm.Instruction.BaseLine;
import cn.littleround.nasm.Instruction.ControlFlowLine;
import cn.littleround.nasm.Instruction.EmptyLine;
import cn.littleround.nasm.Instruction.LabelLine;

import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Collection;

public class BasicBlock {
    private String label;


    private ArrayDeque<BaseLine> lines;
    static final ArrayList<BasicBlock> defaultNext = new ArrayList<>();
    public ArrayList<BasicBlock> next = defaultNext;

    public BasicBlock(BasicBlock bb) {
        label = bb.label;
        lines = new ArrayDeque<BaseLine>();
        next = bb.next;
    }

    public static void dequeCombine(ArrayDeque<BasicBlock> lhs, ArrayDeque<BasicBlock> rhs) {
        if (rhs.size() > 0) {
            if (lhs.getLast().endsWithJmp()) {
                lhs.addAll(rhs);
            } else {
                lhs.getLast().add(rhs.getFirst());
                boolean first = true;
                for (BasicBlock bb: rhs) {
                    if (first) first = false;
                    else lhs.add(bb);
                }
            }
        }
    }
    public static void dequeCombine(ArrayDeque<BasicBlock> lhs, BasicBlock bb) {
        if (lhs.size() == 0) {
            lhs.add(bb);
            return;
        }
        ArrayDeque<BasicBlock> rhs = new ArrayDeque<>();
        rhs.add(bb);
        dequeCombine(lhs, rhs);
    }
    public static void dequeCombine(ArrayDeque<BasicBlock> lhs, BaseLine line) {
        BasicBlock bb = new BasicBlock();
        bb.add(line);
        dequeCombine(lhs, bb);
    }

    public boolean endsWithJmp() {
        return lines.getLast() instanceof ControlFlowLine;
    }

    public ControlFlowLine lastJump() {
        if (endsWithJmp()) return (ControlFlowLine) lines.getLast();
        return null;
    }

    public BasicBlock(String label) {
        this.label = label;
        lines = new ArrayDeque<>();
        lines.add(new LabelLine(label));
    }

    public BasicBlock() {
        this.label = null;
        lines = new ArrayDeque<>();
        lines.add(new EmptyLine());
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

    public void add(BasicBlock bb) {
        next = bb.next;
        label = label+"|"+bb.label;
        lines.addAll(bb.lines);
    }

    public void addFirst(ArrayList<BaseLine> c) {
        for (int i=c.size()-1; i>=0; --i) {
            lines.addFirst(c.get(i));
        }
    }

    public void setLines(ArrayDeque<BaseLine> lines) {
        this.lines = lines;
    }
}
