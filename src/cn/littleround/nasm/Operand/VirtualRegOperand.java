package cn.littleround.nasm.Operand;

import cn.littleround.Constants;

public class VirtualRegOperand extends BaseOperand {
    private int id;

    public VirtualRegOperand(int id) {
        this.id = id;
    }

    @Override
    int getSize() {
        return Constants.sizeOfReg;
    }

    @Override
    public String toString() {
        return "v"+String.valueOf(id);
    }
}
