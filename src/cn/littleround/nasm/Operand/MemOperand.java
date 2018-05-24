package cn.littleround.nasm.Operand;

import cn.littleround.Constants;

public class MemOperand extends BaseOperand {
    @Override
    int getSize() {
        return Constants.sizeOfPointer;
    }
}
