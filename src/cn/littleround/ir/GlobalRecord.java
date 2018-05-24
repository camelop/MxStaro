package cn.littleround.ir;

import cn.littleround.ASTnode.InitDeclaratorNode;
import cn.littleround.Constants;
import cn.littleround.nasm.Instruction.DbLine;
import cn.littleround.nasm.Instruction.ResbLine;
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
            ret.add(new DbLine(head+"_s"+String.valueOf(e.getValue()), e.getKey()));
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
