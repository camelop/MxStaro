package cn.littleround.nasm.Instruction;

import cn.littleround.Constants;
import cn.littleround.nasm.Operand.RegOperand;

import java.util.ArrayList;

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
    @Override
    public ArrayList<Integer> getSrc() {
        return new ArrayList<Integer>(){{
            addAll(toId(new RegOperand("rdi")));
            addAll(toId(new RegOperand("rsi")));
            addAll(toId(new RegOperand("rdx")));
            addAll(toId(new RegOperand("rcx")));
            addAll(toId(new RegOperand("r8")));
            addAll(toId(new RegOperand("r9")));
            addAll(toId(op1));
            addAll(toId(op2));
            add(Constants.flagId);
            add(Constants.memOperandId);
        }};
    }

    @Override
    public ArrayList<Integer> getDes() {
        return new ArrayList<Integer>(){{
            addAll(toId(new RegOperand("rax")));
            addAll(toId(new RegOperand("rdi")));
            addAll(toId(new RegOperand("rsi")));
            addAll(toId(new RegOperand("rdx")));
            addAll(toId(new RegOperand("rcx")));
            addAll(toId(new RegOperand("r8")));
            addAll(toId(new RegOperand("r9")));
            addAll(toId(new RegOperand("r10")));
            addAll(toId(new RegOperand("r11")));
            add(Constants.flagId);
            add(Constants.memOperandId);
        }};
    }
}
