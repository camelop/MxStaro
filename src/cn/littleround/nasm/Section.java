package cn.littleround.nasm;

import cn.littleround.ir.Function;
import cn.littleround.nasm.Instruction.BaseLine;
import cn.littleround.nasm.Instruction.EmptyLine;
import cn.littleround.nasm.Instruction.SectionLine;
import cn.littleround.nasm.Operand.SymbleOperand;

import java.util.ArrayList;

public class Section {
    private String title;
    private ArrayList<BaseLine> lines = new ArrayList<>();

    public Section(ArrayList<Function> funcs) {
        title = ".text";
        lines = new ArrayList<>();
        for (Function f: funcs) {
            lines.addAll(f.lines);
            lines.add(new EmptyLine());
        }
    }

    public Section(String title) {
        this.title = title;
    }

    public void add(BaseLine line) {
        lines.add(line);
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append((new SectionLine(title)).toString());
        for (BaseLine line:lines) {
            sb.append(line.toString());
        }
        return sb.toString();
    }


}
