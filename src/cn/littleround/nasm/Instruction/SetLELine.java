package cn.littleround.nasm.Instruction;

import cn.littleround.Constants;
import cn.littleround.nasm.Operand.BaseOperand;
import cn.littleround.nasm.Operand.RegOperand;

import java.util.ArrayList;

public class SetLELine extends SetLine {

    public SetLELine(RegOperand op) {
        super(op);
    }

    @Override
    String getIns() {
        return "setle";
    }

}
