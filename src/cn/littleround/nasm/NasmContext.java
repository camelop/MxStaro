package cn.littleround.nasm;

import cn.littleround.ASTnode.ASTBaseNode;
import cn.littleround.nasm.Operand.VirtualRegOperand;

import java.util.HashMap;
import java.util.HashSet;

public class NasmContext {
    private int vid = 0;
    private int retId = 0;
    private int addId = 0;
    private int inLoop = 0;
    private int inIf = 0;
    private HashMap<ASTBaseNode, Integer> nodeToVid = new HashMap<>();
    private HashMap<String, Integer> identifierToVid = new HashMap<>();
    private HashSet<Integer> damaged = new HashSet<>();

    public boolean contains(String identifier) {
        return identifierToVid.containsKey(identifier);
    }

    public int getVid(String identifier) {
        if (identifierToVid.containsKey(identifier)) return identifierToVid.get(identifier);
        identifierToVid.put(identifier, vid);
        vid++;
        return vid-1;
    }

    public void setNodeVid(ASTBaseNode node, int vid) {
        nodeToVid.put(node, vid);
    }

    public int getVid(ASTBaseNode node) throws Exception {
        if (!nodeToVid.containsKey(node)) {
            throw new Exception("Vid assign failed.");
        }
        return nodeToVid.get(node);
    }

    public String getRetCnt() {
        retId++;
        return "ret"+String.valueOf(retId-1);
    }

    public String getAddCnt() {
        addId++;
        return "add"+String.valueOf(addId-1);
    }

    public int getVid(String identifier, VirtualRegOperand vl, VirtualRegOperand vr) {
        if (damaged.contains(vl.getId()) || damaged.contains(vr.getId()) || inIf > 0 || inLoop > 0) {
            vid++;
            return vid-1;
        }
        if (identifierToVid.containsKey(identifier)) return identifierToVid.get(identifier);
        identifierToVid.put(identifier, vid);
        vid++;
        return vid-1;
    }

    public int getVid() {
        vid++;
        return vid-1;
    }

    public void damage(int vid) {
        damaged.add(vid);
    }
}
