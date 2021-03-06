package cn.littleround.nasm.Instruction;

import cn.littleround.nasm.Operand.BaseOperand;
import cn.littleround.nasm.Operand.RegOperand;

import java.util.ArrayList;

public class DivLine extends UnaryOpLine {
    public DivLine(BaseOperand op) {
        super(op);
        ((RegOperand) op).isDWORD = true;
    }

    @Override
    String getIns() {
        return "idiv";
    }

    @Override
    public ArrayList<Integer> getSrc() {
        return new ArrayList<Integer>(){{
            addAll(toId(new RegOperand("rax")));
            addAll(toId(op1));
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
