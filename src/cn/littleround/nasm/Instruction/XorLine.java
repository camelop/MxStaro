package cn.littleround.nasm.Instruction;

import cn.littleround.nasm.Operand.BaseOperand;

import java.util.ArrayList;

public class XorLine extends BinaryOpLine {
    public XorLine(BaseOperand op1, BaseOperand op2) {
        super(op1, op2);
    }

    public XorLine(BaseOperand op1) {
        super(op1, op1);
    }

    @Override
    String getIns() {
        return "xor";
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
