package cn.littleround.nasm.Instruction;

import cn.littleround.nasm.Operand.BaseOperand;

import java.util.ArrayList;

public class MovLine extends BinaryOpLine {

    public MovLine(BaseOperand op1, BaseOperand op2) {
        super(op1, op2);
    }


    public MovLine(BaseOperand op1, BaseOperand op2, String comment) {
        super(op1, op2);
        this.comment = comment;
    }

    @Override
    String getIns() {
        return "mov";
    }

    @Override
    public ArrayList<Integer> getSrc() {
        return new ArrayList<Integer>(){{
            add(toId(op2));
        }};
    }

    @Override
    public ArrayList<Integer> getDes() {
        return new ArrayList<Integer>(){{
            add(toId(op1));
        }};
    }
}
