package cn.littleround.nasm.Instruction;

import cn.littleround.Constants;
import cn.littleround.ir.Function;
import cn.littleround.nasm.BasicBlock;
import cn.littleround.nasm.Operand.BaseOperand;
import cn.littleround.nasm.Operand.DecimalOperand;
import cn.littleround.nasm.Operand.SymbleOperand;
import cn.littleround.nasm.Operand.VirtualRegOperand;

import java.util.ArrayDeque;
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

  
}
