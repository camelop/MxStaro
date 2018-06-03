package cn.littleround.nasm.Instruction;

import cn.littleround.nasm.Operand.RegOperand;
import cn.littleround.nasm.Operand.SymbleOperand;

import java.util.ArrayList;

public class CallLine extends ControlFlowLine {

    private String makeValid(String s) {
        String ret = s.replace('[','L');
        ret = ret.replace(']','R');
        return ret;
    }

    public CallLine(String des) {
        des = makeValid(des);
        op1 = new SymbleOperand(des);
    }

    @Override
    String getIns() {
        return "call";
    }

    public String getLabel() {
        return op1.toString();
    }

}
