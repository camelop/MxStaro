package cn.littleround.nasm.Instruction;

import cn.littleround.Constants;
import cn.littleround.nasm.Operand.BaseOperand;
import cn.littleround.nasm.Operand.RegOperand;

import java.util.ArrayList;

public class SetBELine extends SetLine {

    public SetBELine(RegOperand op) {
        super(op);
    }

    @Override
    String getIns() {
        return "setbe";
    }

}
