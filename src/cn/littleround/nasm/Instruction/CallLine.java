package cn.littleround.nasm.Instruction;

import cn.littleround.nasm.Operand.RegOperand;
import cn.littleround.nasm.Operand.SymbleOperand;

import java.util.ArrayList;

public class CallLine extends ControlFlowLine {

    public CallLine(String des) {
        op1 = new SymbleOperand(des);
    }

    @Override
    String getIns() {
        return "call";
    }

    @Override
    public ArrayList<Integer> getSrc() {
        return new ArrayList<>(){{
            add(toId(new RegOperand("rdi")));
            add(toId(new RegOperand("rsi")));
            add(toId(new RegOperand("rdx")));
            add(toId(new RegOperand("rcx")));
            add(toId(new RegOperand("r8")));
            add(toId(new RegOperand("r9")));
            add(toId(op1));
        }};
    }

    @Override
    public ArrayList<Integer> getDes() {
        return new ArrayList<>(){{
            add(toId(new RegOperand("rax")));
            add(toId(new RegOperand("rdi")));
            add(toId(new RegOperand("rsi")));
            add(toId(new RegOperand("rdx")));
            add(toId(new RegOperand("rcx")));
            add(toId(new RegOperand("r8")));
            add(toId(new RegOperand("r9")));
            add(toId(new RegOperand("r10")));
            add(toId(new RegOperand("r11")));
        }};
    }
}
