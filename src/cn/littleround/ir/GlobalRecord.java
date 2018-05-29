package cn.littleround.ir;

import cn.littleround.ASTnode.InitDeclaratorNode;
import cn.littleround.Constants;
import cn.littleround.nasm.Instruction.DbLine;
import cn.littleround.nasm.Instruction.LabelLine;
import cn.littleround.nasm.Instruction.ResbLine;
import cn.littleround.nasm.Operand.ConstantOperand;
import cn.littleround.nasm.Section;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class GlobalRecord extends Record {
    private int offset = 0;
    private int stringId = 0;
    private ArrayList<String> labelList = new ArrayList<>();
    private HashMap<String, Integer> labelToOffset = new HashMap<>();
    private HashMap<String, InitDeclaratorNode> labelToAST = new HashMap<>();
    private String head;
    private HashMap<String, Integer> stringToSId = new HashMap<>();

    public GlobalRecord(String head) {
        this.head = head;
    }

    public int addString(String content) {
        if (stringToSId.containsKey(content)) return stringToSId.get(content);
        stringToSId.put(content, stringId);
        stringId++;
        return stringId-1;
    }

    public int findString(String content) {
        return stringToSId.get(content);
    }

    public int addVariable(String label, InitDeclaratorNode dn) {
        labelList.add(label);
        labelToOffset.put(label, offset);
        labelToAST.put(label, dn);
        offset += Constants.sizeOfReg;
        return offset - Constants.sizeOfReg;
    }
    public boolean contains(String tag) {
        return labelToOffset.containsKey(tag);
    }
    public int getOffset(String tag) {
        return labelToOffset.get(tag);
    }

    public Section getDataSection() {
        Section ret = new Section(".data");
        for (HashMap.Entry<String, Integer> e: stringToSId.entrySet()) {
            String label = head+"_s"+String.valueOf(e.getValue());
            ret.add(new LabelLine(label));
            String contentSrc = e.getKey();
            StringBuilder sb = new StringBuilder();
            char[] content = contentSrc.toCharArray();
            int l = contentSrc.length();
            for (int i = 0; i < l; ++i) {
                sb.append(content[i]);
                /* I don't know about `/n`...
                if (content[i] == '\\') {
                    if (i == l - 1) {
                        System.err.println("WTF");
                        System.exit(-1);
                    } else {
                        ret.add(new DbLine(sb.toString()));
                        sb = new StringBuilder();
                        ++i;
                        switch (content[i]) {
                            case 'n':{
                                ret.add(new DbLine(10));
                            }
                        }
                    }
                } else if (content[i]=='\''){
                    sb.append("\\");
                    sb.append(content[i]);
                } else {
                    sb.append(content[i]);
                }
                */
            }
            if (sb.toString().length() > 0) {
                ret.add(new DbLine(sb.toString()));
            }
            ret.add(new DbLine(0));
        }
        return ret;
    }

    public Section getBssSection() {
        Section ret = new Section(".bss");
        for (String label: labelList) {
            ret.add(new ResbLine(head+"_bss_"+label, Constants.sizeOfReg));
        }
        return ret;
    }

    /* TODO:
        generate code ATTENTION! remember to handle init values (in InitDeclaratorNode)
        when encounter string init value, first scan all InitDeclaratorNode and store all String Constants.
    */
}
