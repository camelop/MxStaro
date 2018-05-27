package cn.littleround.nasm.Instruction;

import cn.littleround.Constants;
import cn.littleround.nasm.Operand.BaseOperand;

import java.util.ArrayList;

public class PopLine extends BaseLine {
    public PopLine(BaseOperand op) {
        this.op1 = op;
    }

    @Override
    String getIns() {
        return "pop";
    }

    @Override
    public ArrayList<Integer> getSrc() {
        return new ArrayList<Integer>(){{
            add(Constants.memOperandId);
        }};
    }

    @Override
    public ArrayList<Integer> getDes() {
        return new ArrayList<Integer>(){{
            add(toId(op1));
        }};
    }
}
