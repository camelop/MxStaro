package cn.littleround.nasm.Instruction;

import cn.littleround.nasm.Operand.BaseOperand;

import java.util.ArrayList;

public abstract class BinaryOpLine extends BaseLine {
    public BinaryOpLine(BaseOperand op1, BaseOperand op2) {
        this.op1 = op1;
        this.op2 = op2;
    }
    public BinaryOpLine(BaseOperand op1) {
        this.op1 = op1;
    }

    @Override
    public ArrayList<Integer> getSrc() {
        return new ArrayList<Integer>(){{
            add(toId(op1));
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
