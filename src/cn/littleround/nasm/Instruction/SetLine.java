package cn.littleround.nasm.Instruction;

import cn.littleround.Constants;
import cn.littleround.nasm.Operand.BaseOperand;
import cn.littleround.nasm.Operand.RegOperand;

import java.util.ArrayList;

public abstract class SetLine extends BaseLine {
    public SetLine(RegOperand op) {
        op.isBYTE = true;
        this.op1 = op;
    }

    @Override
    public ArrayList<Integer> getSrc() {
        return new ArrayList<Integer>(){{
            add(Constants.flagId);
        }};
    }

    @Override
    public ArrayList<Integer> getDes() {
        return new ArrayList<Integer>(){{
            add(toId(op1));
        }};
    }
}
