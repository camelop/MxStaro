package cn.littleround.nasm.Operand;

import cn.littleround.Constants;
import cn.littleround.ir.Function;

public class VirtualRegOperand extends RegOperand {
    private int vid;

    public int getVid() {
        return vid;
    }

    public VirtualRegOperand(int vid) {
        super(-1);
        this.vid = vid;
    }

    @Override
    int getSize() {
        return Constants.sizeOfReg;
    }

    @Override
    public String toString() {
        return "v"+String.valueOf(vid);
    }

    public BaseOperand render(Function f) {
        return f.nctx().convertVid(vid);
    }
}
