package cn.littleround.nasm.Instruction;

import cn.littleround.nasm.Operand.RegOperand;

import java.util.ArrayList;

public class CqoLine extends BaseLine {
    @Override
    String getIns() {
        return "cqo";
    }

    @Override
    public ArrayList<Integer> getSrc() {
        return new ArrayList<Integer>(){{
            addAll(toId(new RegOperand("rax")));
        }};
    }

    @Override
    public ArrayList<Integer> getDes() {
        return new ArrayList<Integer>(){{
            addAll(toId(new RegOperand("rax")));
            addAll(toId(new RegOperand("rdx")));
        }};
    }
}
