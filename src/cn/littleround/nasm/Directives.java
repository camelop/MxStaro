package cn.littleround.nasm;

import cn.littleround.nasm.Instruction.BaseLine;
import cn.littleround.nasm.Instruction.ExternLine;
import cn.littleround.nasm.Instruction.GlobalLine;

import java.util.ArrayList;

public class Directives {
    // Directives is a list of lines (global xxx, etc.)
    private ArrayList<BaseLine> lines;
    public Directives() {
        lines = new ArrayList<>();
        lines.add(new GlobalLine());
        lines.add(new ExternLine("puts"));
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        for (BaseLine line: lines){
            sb.append(line.toString());
        }
        return sb.toString();
    }
}
