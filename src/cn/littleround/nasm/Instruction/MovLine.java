package cn.littleround.nasm.Instruction;

import cn.littleround.ir.Function;
import cn.littleround.nasm.NasmContext;
import cn.littleround.nasm.Operand.BaseOperand;
import cn.littleround.nasm.Operand.MemRegOperand;
import cn.littleround.nasm.Operand.RegOperand;
import cn.littleround.nasm.Operand.VirtualRegOperand;

import java.util.ArrayList;

public class MovLine extends BinaryOpLine {

    public MovLine(BaseOperand op1, BaseOperand op2) {
        super(op1, op2);
    }


    public MovLine(BaseOperand op1, BaseOperand op2, String comment) {
        super(op1, op2);
        this.comment = comment;
    }

    @Override
    String getIns() {
        return "mov";
    }

    @Override
    public ArrayList<Integer> getSrc() {
        return new ArrayList<Integer>(){{
            addAll(toId(op2));
        }};
    }

    @Override
    public ArrayList<Integer> getDes() {
        return new ArrayList<Integer>(){{
            addAll(toId(op1));
        }};
    }

    @Override
    public ArrayList<BaseLine> render(Function f) {
        ArrayList<BaseLine> ret = new ArrayList<>();
        NasmContext nasmCtx = f.nctx();
        // move in
        if (op1 instanceof VirtualRegOperand) {
            /*
            ret.add(new MovLine(
                    new RegOperand("r10"),
                    nasmCtx.convertVid(((VirtualRegOperand) op1).getVid()),
                    "load->v"+String.valueOf(((VirtualRegOperand) op1).getVid())
            ));
            */
        } else if (op1 instanceof MemRegOperand && ((MemRegOperand) op1).isVirtual()) {
            ret.add(new MovLine(
                    new RegOperand("r10"),
                    nasmCtx.convertVid(((VirtualRegOperand)((MemRegOperand) op1).op1).getVid()),
                    "translate->"+op1.toString()
            ));
        }
        if (op2 instanceof VirtualRegOperand) {
            ret.add(new MovLine(
                    new RegOperand("r11"),
                    nasmCtx.convertVid(((VirtualRegOperand) op2).getVid()),
                    "load->v"+String.valueOf(((VirtualRegOperand) op2).getVid())
            ));
        } else if (op2 instanceof MemRegOperand && ((MemRegOperand) op2).isVirtual()) {
            ret.add(new MovLine(
                    new RegOperand("r11"),
                    nasmCtx.convertVid(((VirtualRegOperand)((MemRegOperand) op2).op1).getVid()),
                    "translate->"+op2.toString()
            ));
        }
        // convert
        BaseLine newLine = clone();
        if (op1 instanceof VirtualRegOperand) {
            newLine.op1 = new RegOperand("r10");
            RegOperand.transferRegLength((RegOperand) newLine.op1, (RegOperand) op1);
        } else if (op1 instanceof MemRegOperand && ((MemRegOperand) op1).isVirtual()) {
            newLine.op1 = new MemRegOperand(new RegOperand("r10"));
            RegOperand.transferRegLength(((MemRegOperand)newLine.op1).op1, ((MemRegOperand)op1).op1);
        }
        if (op2 instanceof VirtualRegOperand) {
            newLine.op2 = new RegOperand("r11");
            RegOperand.transferRegLength((RegOperand) newLine.op2, (RegOperand) op2);
        } else if (op2 instanceof MemRegOperand && ((MemRegOperand) op2).isVirtual()) {
            newLine.op2 = new MemRegOperand(new RegOperand("r11"));
            RegOperand.transferRegLength(((MemRegOperand)newLine.op2).op1, ((MemRegOperand)op2).op1);
        }
        ret.add(newLine);
        // move out
        if (op1 instanceof VirtualRegOperand) {
            ret.add(new MovLine(
                    nasmCtx.convertVid(((VirtualRegOperand) op1).getVid()),
                    new RegOperand("r10"),
                    "save->v"+String.valueOf(((VirtualRegOperand) op1).getVid())
            ));
        }
        return ret;
    }
}
