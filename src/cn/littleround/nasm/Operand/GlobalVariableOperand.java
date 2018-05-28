package cn.littleround.nasm.Operand;

import cn.littleround.Constants;

public class GlobalVariableOperand extends MemOperand {
    private String identifier;

    public GlobalVariableOperand(String identifier) {
        this.identifier = identifier;
    }

    @Override
    public String toString() {
        return Constants.head+"_data_bss_"+identifier;
    }
}
