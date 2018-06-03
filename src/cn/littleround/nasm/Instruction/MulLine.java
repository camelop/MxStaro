package cn.littleround.nasm.Instruction;

import cn.littleround.nasm.Operand.BaseOperand;
import cn.littleround.nasm.Operand.DecimalOperand;

import java.util.ArrayList;

public class MulLine extends BinaryOpLine {
    public MulLine(BaseOperand op1, BaseOperand op2) {
        super(op1, op2);
    }

    @Override
    String getIns() {
        return "imul";
    }

    @Override
    public String toString() {
        if (op2 instanceof DecimalOperand && op2.toString().equals("8")) {
            return "              "+"sal     "+align(op1.toString(), 15)
                    +", 3              "+"; from imul";
        } if (op2 instanceof DecimalOperand && op2.toString().equals("4")) {
            return "              "+"sal     "+align(op1.toString(), 15)
                    +", 2              "+"; from imul";
        } if (op2 instanceof DecimalOperand && op2.toString().equals("2")) {
            return "              "+"sal     "+align(op1.toString(), 15)
                    +", 1              "+"; from imul";
        } if (op2 instanceof DecimalOperand && op2.toString().equals("16")) {
            return "              "+"sal     "+align(op1.toString(), 15)
                    +", 4              "+"; from imul";
        } else {
            String sep = "";
            StringBuilder sb = new StringBuilder();
            if (label != null) {
                if (label.length()<10) {
                    sb.append(align(label+":   ",14));
                } else {
                    sb.append(label);
                    sb.append(":"+System.lineSeparator());
                    sb.append("              ");//14
                }
            } else {
                sb.append("              ");//14
            }
            sb.append(sep);
            sb.append(align(getIns(), 8));
            sb.append(sep);
            if (op1 != null) sb.append(align(op1.toString(), 15));
            else sb.append("               ");//15
            if (op2 != null) {
                sb.append(", ");
                sb.append(align(op2.toString(),15));
            } else
                sb.append("                 ");//17
            sb.append(sep);
            if (comment != null) sb.append("; ");
            if (comment != null) sb.append(comment);
            //sb.append(";--_From"+getSrc().toString()+"  ;--_TO"+getDes().toString());
            sb.append(System.lineSeparator());

            return sb.toString();
        }
    }
}
