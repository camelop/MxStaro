package cn.littleround.nasm.Instruction;

import cn.littleround.Constants;
import cn.littleround.nasm.Operand.BaseOperand;

import java.util.ArrayList;

public class PushLine extends BaseLine {
    public PushLine(BaseOperand op) {
        op1 = op;
    }

    @Override
    String getIns() {
        return "push";
    }

    @Override
    public ArrayList<Integer> getSrc() {
        return new ArrayList<Integer>(){{
            add(toId(op1));
        }};
    }

    @Override
    public ArrayList<Integer> getDes() {
        return new ArrayList<Integer>(){{
            add(Constants.memOperandId);
        }};
    }
}
