package cn.littleround.nasm.Instruction;

import cn.littleround.nasm.Operand.RegOperand;
import cn.littleround.nasm.Operand.SymbleOperand;

import java.util.ArrayList;

public class CallLine extends ControlFlowLine {

    private String makeValid(String s) {
        String ret = s.replace('[','L');
        ret = ret.replace(']','R');
        return ret;
    }

    public CallLine(String des) {
        des = makeValid(des);
        op1 = new SymbleOperand(des);
    }

    @Override
    String getIns() {
        return "call";
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
        }};
    }
}
