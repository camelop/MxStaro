package cn.littleround.nasm.Instruction;

import cn.littleround.nasm.Operand.BaseOperand;

import java.util.ArrayList;

public abstract class UnaryOpLine extends BaseLine {
    public UnaryOpLine(BaseOperand op) {
        this.op1 = op;
    }

    @Override
    public ArrayList<Integer> getSrc() {
        return new ArrayList<Integer>(){{
            addAll(toId(op1));
        }};
    }

    @Override
    public ArrayList<Integer> getDes() {
        return new ArrayList<Integer>(){{
            addAll(toId(op1));
        }};
    }
}
