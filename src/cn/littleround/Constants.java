package cn.littleround;

import cn.littleround.nasm.Instruction.*;
import cn.littleround.nasm.Operand.DecimalOperand;
import cn.littleround.nasm.Operand.MemRegOperand;
import cn.littleround.nasm.Operand.RegOperand;
import cn.littleround.nasm.Operand.SymbleOperand;
import cn.littleround.type.*;

import java.util.ArrayList;
import java.util.HashMap;

public class Constants {
    public final static int True = 0xff;
    public final static int byteMask = 0x0000000f;
    public final static int sizeOfReg = 8;
    /*
    public final static int sizeOfInt = 4;
    public final static int sizeOfBoolean = 1;
    public final static int sizeOfPointer = 4;
    public final static int sizeOfString = 4; //?
    */
    public final static int sizeOfInt = 8;
    public final static int sizeOfBoolean = 8;
    public final static int sizeOfPointer = 8;
    public final static int sizeOfString = 8; //?
    public final static BoolType BOOL = new BoolType();
    public final static IntType INT = new IntType();
    public final static StringType STRING = new StringType();
    public final static VoidType VOID = new VoidType();
    public final static NullType NULL = new NullType();
    public final static String[] regDwordNames = new String[]{
            "eax", "ecx", "edx","ebx","esi","edi","esp","ebp",
            "r8d", "r9d", "r10d", "r11d", "r12d", "r13d", "r14d", "r15d"
    };
    public final static String[] regWordNames = new String[]{
            "ax","cx","dx","bx","si","di","sp","bp",
            "r8w", "r9w", "r10w", "r11w", "r12w","r13w","r14w","r15w"
    };
    public final static String[] regByteNames = new String[]{
            "al","cl","dl","bl","sil","dil","spl","bpl",
            "r8b", "r9b", "r10b", "r11b", "r12b","r13b","r14b","r15b"
    };
    public final static String[] callConvRegs = new String[]{"rdi", "rsi", "rdx", "rcx", "r8", "r9"};
    public final static String[] callerRegs = new String[]{"rax", "rbx", "rbp", "r10", "r11", "r12", "r13", "r14", "r15"};
    public final static int callConvRegsLen = 6;
    public final static String[] callConvReservRegs = new String[]{"rbp", "rbx", "r12", "r13", "r14", "r15"};
    public final static String[] funcDesRegs = new String[]{"rax", "rbp", "rbx", "r12", "r13", "r14", "r15"};
    public final static int defaultStringLimit = 512;
    public final static int callConvReservRegsLen = 6;
    public final static String head = "";// "MxStaro";
    public final static int typeToSize(String typename) {
        switch (typename) {
            case "int":
                return sizeOfInt;
            case "bool":
                return sizeOfBoolean;
            case "string":
                return sizeOfString;
            default:
                /*void*/
                return 0;
        }
    }
    public final static HashMap<String, ArrayList<BaseLine>> libFunc = new HashMap<String, ArrayList<BaseLine>>(){{
        put(head+"_text_built_in_string_length", new ArrayList<BaseLine>(){{
            add(new LabelLine(head+"_text_built_in_string_length"));
            add(new SubLine(new RegOperand("rsp"), new DecimalOperand(8)));
            add(new CallLine("strlen"));
            add(new AddLine(new RegOperand("rsp"), new DecimalOperand(8)));
            add(new RetLine());
        }});
        put(head+"_text_built_in_string_substring", new ArrayList<BaseLine>(){{
            add(new LabelLine(head+"_text_built_in_string_substring"));
            // save r13, rbx, r12
            add(new PushLine(new RegOperand("r13")));
            add(new PushLine(new RegOperand("rbx")));
            add(new PushLine(new RegOperand("r12")));
            // r12 = src, r13 = r, rbx = l, r13 = r-l+1
            add(new MovLine(new RegOperand("r12"), new RegOperand("rdi")));
            add(new MovLine(new RegOperand("r13"), new RegOperand("rdx")));
            add(new MovLine(new RegOperand("rbx"), new RegOperand("rsi")));
            add(new SubLine(new RegOperand("r13"), new RegOperand("rbx")));
            add(new AddLine(new RegOperand("r13"), new DecimalOperand(1)));
            // rdi = r-l, call malloc
            add(new MovLine(new RegOperand("rdi"), new RegOperand("r13")));
            add(new CallLine("malloc"));
            // rdi = rax (malloc ret), rsi = r12 + l, rdx = r13, r12 = rax
            add(new MovLine(new RegOperand("rdi"), new RegOperand("rax")));
            add(new MovLine(new RegOperand("rsi"), new RegOperand("r12")));
            add(new AddLine(new RegOperand("rsi"), new RegOperand("rbx")));
            add(new MovLine(new RegOperand("rdx"), new RegOperand("r13")));
            add(new MovLine(new RegOperand("r12"), new RegOperand("rax")));
            // call strncpy, rax is correct
            add(new CallLine("strncpy"));
            // add '\0': 0<-[r12 + r13]
            add(new AddLine(
                    new MemRegOperand(new RegOperand("r12"), new RegOperand("r13")),
                    new SymbleOperand("\' \'")));
            // load r13, rbx, r12
            add(new PopLine(new RegOperand("r12")));
            add(new PopLine(new RegOperand("rbx")));
            add(new PopLine(new RegOperand("r13")));
            add(new RetLine());
        }});
        put(head+"_text_built_in_string_parseInt", new ArrayList<BaseLine>(){{
            add(new LabelLine(head+"_text_built_in_string_parseInt"));
            // save
            add(new PushLine(new RegOperand("rbx")));
            // rbx = rdi(src), rdi = 8, call malloc(rax)
            add(new MovLine(new RegOperand("rbx"), new RegOperand("rdi")));
            add(new MovLine(new RegOperand("rdi"), new DecimalOperand(8)));
            add(new CallLine("malloc"));
            // rdi = rbx, rsi = rax, rdx = 10, call strtol(rax is correct)
            add(new MovLine(new RegOperand("rdi"), new RegOperand("rbx")));
            add(new MovLine(new RegOperand("rsi"), new RegOperand("rax")));
            add(new MovLine(new RegOperand("rdx"), new DecimalOperand(10)));
            add(new CallLine("strtol"));
            // load
            add(new PopLine(new RegOperand("rbx")));
            add(new RetLine());
        }});
        put(head+"_text_built_in_string_ord", new ArrayList<BaseLine>(){{
            add(new LabelLine(head+"_text_built_in_string_ord"));
            add(new MovLine(
                    new RegOperand("rax"),
                    new MemRegOperand(new RegOperand("rdi"), new RegOperand("rsi"))
            ));
            add(new RetLine());
        }});
        put(head+"_text_built_in_array_size", new ArrayList<BaseLine>(){{
            add(new LabelLine(head+"_text_built_in_array_size"));
            add(new MovLine(new RegOperand("rax"), new MemRegOperand(new RegOperand("rdi"))));
            add(new RetLine());
        }});
        put(head+"_text__printf", new ArrayList<BaseLine>(){{
            add(new LabelLine(head+"_text__printf"));
            add(new XorLine(new RegOperand("rax"))); //vararg?
            add(new SubLine(new RegOperand("rsp"), new DecimalOperand(8)));
            add(new CallLine("printf"));
            add(new AddLine(new RegOperand("rsp"), new DecimalOperand(8)));
            add(new RetLine());
        }});
        put(head+"_text__getString", new ArrayList<BaseLine>(){{
            add(new DbLine(head+"_text__getString_format", "%s", new DecimalOperand(0)));
            add(new LabelLine(head+"_text__getString"));
            // save
            add(new PushLine(new RegOperand("rbx")));
            // rdi=@limit, malloc
            add(new MovLine(new RegOperand("rdi"), new DecimalOperand(Constants.defaultStringLimit)));
            add(new CallLine("malloc"));
            // rbx=rax, rdi=@format, rsi=rax, rdx=0, call scanf
            add(new MovLine(new RegOperand("rbx"), new RegOperand("rax")));
            add(new MovLine(new RegOperand("rdi"), new SymbleOperand(head+"_text__getString_format")));
            add(new MovLine(new RegOperand("rsi"), new RegOperand("rax")));
            add(new XorLine(new RegOperand("rdx")));
            add(new CallLine("scanf"));
            // rax=rbx
            add(new MovLine(new RegOperand("rax"), new RegOperand("rbx")));
            // load
            add(new PopLine(new RegOperand("rbx")));
            add(new RetLine());
        }});
        put(head+"_text__getInt", new ArrayList<BaseLine>(){{
            add(new DbLine(head+"_text__getInt_format", "%lld", new DecimalOperand(0))); //?
            add(new LabelLine(head+"_text__getInt"));
            // save
            add(new PushLine(new RegOperand("rbx")));
            // rdi=@sizeOfInt, malloc
            add(new MovLine(new RegOperand("rdi"), new DecimalOperand(Constants.sizeOfReg)));
            add(new CallLine("malloc"));
            // rbx=rax, rdi=@format, rsi=rax, rdx=0, call scanf
            add(new MovLine(new RegOperand("rbx"), new RegOperand("rax")));
            add(new MovLine(new RegOperand("rdi"), new SymbleOperand(head+"_text__getInt_format")));
            add(new MovLine(new RegOperand("rsi"), new RegOperand("rax")));
            add(new XorLine(new RegOperand("rdx")));
            add(new CallLine("scanf"));
            // rax=rbx
            add(new MovLine(new RegOperand("rax"), new MemRegOperand(new RegOperand("rbx"))));
            // load
            add(new PopLine(new RegOperand("rbx")));
            add(new RetLine());
        }});
        put(head+"_text__toString", new ArrayList<BaseLine>(){{
            add(new DbLine(head+"_text__toString_format", "%d", new DecimalOperand(0)));
            add(new LabelLine(head+"_text__toString"));
            // save
            add(new SubLine(new RegOperand("rsp"), new DecimalOperand(8)));
            add(new PushLine(new RegOperand("r12")));
            add(new PushLine(new RegOperand("rbx")));
            // rbx=rdi, rdi=@limit, malloc
            add(new MovLine(new RegOperand("rbx"), new RegOperand("rdi")));
            add(new MovLine(new RegOperand("rdi"), new DecimalOperand(Constants.defaultStringLimit)));
            add(new CallLine("malloc"));
            // r12=rax, rdi=rax, rsi=@format, rdx=rbx, rcx=0, call sprintf
            add(new MovLine(new RegOperand("r12"), new RegOperand("rax")));
            add(new MovLine(new RegOperand("rdi"), new RegOperand("rax")));
            add(new MovLine(new RegOperand("rsi"), new SymbleOperand(head+"_text__toString_format")));
            add(new MovLine(new RegOperand("rdx"), new RegOperand("rbx")));
            add(new XorLine(new RegOperand("rcx")));
            add(new CallLine("sprintf"));
            // rax=r12
            add(new MovLine(new RegOperand("rax"), new RegOperand("r12")));
            // load
            add(new PopLine(new RegOperand("rbx")));
            add(new PopLine(new RegOperand("r12")));
            add(new AddLine(new RegOperand("rsp"), new DecimalOperand(8)));
            add(new RetLine());
        }});
    }};

    //0-15: regs, 16: flags, 17: mem, 18-...: vregs
    public final static int noId = -1;
    public final static int flagId = 16;
    public final static int memOperandId = 17;
    public final static int virtualRegOperandIdOffset=18;

    public final static int libLength = 16;
    // copied from lib.mx file
    public final static String lib =
            "class built_in_string {\n" +
                    "    int length() { return 0; }\n" +
                    "    string substring(int left, int right) { return \"\"; }\n" +
                    "    int parseInt() { return 0; }\n" +
                    "    int ord(int pos) { return 0; }\n" +
                    "}\n" +
                    "class built_in_array {\n" +
                    "    int size() { return 0; }\n" +
                    "}\n" +
                    "void printf(string f, string src) {}\n" +
                    "string getString() { return \"littleRound\"; }\n" +
                    "int getInt() { return 0; }\n" +
                    "string toString(int i) { return \"littleRound\"; }\n" +
                    "void print(string str) { printf(\"%s\",str); }\n" +
                    "void println(string str) { printf(\"%s\\n\",str); }\n" +
                    "void built_in_data_init() {}\n";
}
