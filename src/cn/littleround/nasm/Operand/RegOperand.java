package cn.littleround.nasm.Operand;

import cn.littleround.Constants;

import java.util.HashMap;

public class RegOperand extends BaseOperand {
    private int id;
    protected boolean isDWORD = false;
    protected boolean isWORD = false;

    public void setBYTE(boolean BYTE) {
        isBYTE = BYTE;
    }

    protected boolean isBYTE = false;
    private static HashMap<String, Integer> toId = new HashMap<>(){{
        put("r0", 0); put("rax", 0);
        put("r1", 1); put("rcx", 1);
        put("r2", 2); put("rdx", 2);
        put("r3", 3); put("rbx", 3);
        put("r4", 4); put("rsp", 4);
        put("r5", 5); put("rbp", 5);
        put("r6", 6); put("rsi", 6);
        put("r7", 7); put("rdi", 7);
        put("r8", 8);
        put("r9", 9);
        put("r10", 10);
        put("r11", 11);
        put("r12", 12);
        put("r13", 13);
        put("r14", 14);
        put("r15", 15);
    }};
    private static HashMap<Integer, String> toName = new HashMap<>(){{
        put(0, "rax");
        put(1, "rcx");
        put(2, "rdx");
        put(3, "rbx");
        put(4, "rsp");
        put(5, "rbp");
        put(6, "rsi");
        put(7, "rdi");
        put(8, "r8");
        put(9, "r9");
        put(10, "r10");
        put(11, "r11");
        put(12, "r12");
        put(13, "r13");
        put(14, "r14");
        put(15, "r15");
    }};
    public RegOperand(int id) {
        this.id = id;
    }
    public RegOperand(String s) {
        this.id = toId.get(s.toLowerCase());
    }

    @Override
    int getSize() {
        return Constants.sizeOfReg;
    }

    @Override
    public String toString() {
        if (isDWORD) return "r"+String.valueOf(id)+"d";
        if (isWORD) return "r"+String.valueOf(id)+"w";
        if (isBYTE) return "r"+String.valueOf(id)+"b";
        return toName.get(id);
    }
}
