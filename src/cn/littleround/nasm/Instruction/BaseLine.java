package cn.littleround.nasm.Instruction;

import cn.littleround.Constants;
import cn.littleround.ir.Function;
import cn.littleround.nasm.NasmContext;
import cn.littleround.nasm.Operand.*;
import org.abego.treelayout.internal.util.java.lang.string.StringUtil;

import java.util.ArrayList;

public abstract class BaseLine implements Cloneable{
    public String getLabel() {
        return label;
    }

    protected String label;
    abstract String getIns();

    public boolean hasLabel() {
        if (label == null) return false;
        if (label.equals("")) return  false;
        return true;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    protected String comment;
    public BaseOperand op1 = null;
    public BaseOperand op2 = null;

    public boolean isVirtual() {
        if (op1 instanceof VirtualRegOperand) return true;
        if (op2 instanceof VirtualRegOperand) return true;
        return false;
    }

    private String align(String src, int length) {
        String ret = src;
        while (ret.length() < length) {
            ret = ret+" ";
        }
        return ret;
    }

    @Override
    public String toString() {
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
        sb.append(System.lineSeparator());

        return sb.toString();
    }

    static public ArrayList<Integer> toId(BaseOperand op) {
        if (op instanceof ImmOperand) return new ArrayList<Integer>();
        if (op instanceof MemOperand) {
            ArrayList<Integer> ret = new ArrayList<Integer>(){{add(Constants.memOperandId);}};
            if (op instanceof MemRegOperand) {
                if (((MemRegOperand) op).op1 != null) ret.addAll(toId(((MemRegOperand) op).op1));
                if (((MemRegOperand) op).op2 != null) ret.addAll(toId(((MemRegOperand) op).op2));
            }
            return ret;
        }
        if (op instanceof VirtualRegOperand) return new ArrayList<Integer>(){{add(((VirtualRegOperand) op).getVid()+Constants.virtualRegOperandIdOffset);}};
        if (op instanceof RegOperand) return new ArrayList<Integer>(){{add(((RegOperand) op).getId());}};
        System.err.println("Oops? -> "+op.getClass().getSimpleName());
        return null;
    }
    public ArrayList<Integer> getSrc() {
        return new ArrayList<>();
    }
    public ArrayList<Integer> getDes() {
        return new ArrayList<>();
    }

    @Override
    public BaseLine clone() {
        try {
            return (BaseLine) super.clone();
        } catch (CloneNotSupportedException e) {
            e.printStackTrace();
            return null;
        }
    }

    public ArrayList<BaseLine> render(Function f) {
        ArrayList<BaseLine> ret = new ArrayList<>();
        NasmContext nasmCtx = f.nctx();
        // move in
        if (op1 instanceof VirtualRegOperand) {
            ret.add(new MovLine(
                    new RegOperand("r10"),
                    nasmCtx.convertVid(((VirtualRegOperand) op1).getVid()),
                    "load->v"+String.valueOf(((VirtualRegOperand) op1).getVid())
            ));
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
