package cn.littleround.nasm.Instruction;

import cn.littleround.Constants;
import cn.littleround.nasm.Operand.BaseOperand;
import cn.littleround.nasm.Operand.DecimalOperand;

import java.util.ArrayList;

public class CmpLine extends BinaryOpLine {
    public CmpLine(BaseOperand op1, BaseOperand op2) {
        super(op1, op2);
    }

    public CmpLine(BaseOperand op1) {
        super(op1, new DecimalOperand(0));
    }

    @Override
    String getIns() {
        return "cmp";
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
            add(Constants.flagId);
        }};
    }
}
