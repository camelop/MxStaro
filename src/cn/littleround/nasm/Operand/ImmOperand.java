package cn.littleround.nasm.Operand;

import cn.littleround.Constants;

public class ImmOperand extends BaseOperand {
    @Override
    int getSize() {
        return Constants.sizeOfReg;
    }

}
