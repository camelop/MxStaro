package cn.littleround.nasm.Instruction;

import cn.littleround.nasm.Operand.BaseOperand;

import java.util.ArrayList;

public class AddLine extends BinaryOpLine {
    public AddLine(BaseOperand op1, BaseOperand op2) {
        super(op1, op2);
    }

    @Override
    String getIns() {
        return "add";
    }

    @Override
    public ArrayList<Integer> getSrc() {
        return new ArrayList<>(){{
            add(toId(op1));
            add(toId(op2));
        }};
    }

    @Override
    public ArrayList<Integer> getDes() {
        return new ArrayList<>(){{
            add(toId(op1));
        }};
    }
}
