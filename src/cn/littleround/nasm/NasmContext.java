package cn.littleround.nasm;

import cn.littleround.ASTnode.ASTBaseNode;
import cn.littleround.Constants;
import cn.littleround.nasm.Operand.BaseOperand;
import cn.littleround.nasm.Operand.MemRegOperand;
import cn.littleround.nasm.Operand.VirtualRegOperand;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Stack;

public class NasmContext {
    private int vid = 0;
    private int retId = 0;
    private int addId = 0;
    private int callId = 0;
    private int forId = 0;
    private int ifId = 0;
    private String scopeHead = "";

    private int inLoop = 0;
    private int inIf = 0;
    private HashMap<ASTBaseNode, Integer> nodeToVid = new HashMap<>();

    public HashMap<String, Integer> getIdentifierToVid() {
        return identifierToVid;
    }

    private HashMap<String, Integer> identifierToVid = new HashMap<>();
    private HashSet<Integer> damaged = new HashSet<>();
    private HashMap<Integer, MemRegOperand> assignVR = new HashMap<>();

    private HashMap<ASTBaseNode, BaseOperand> findMem = new HashMap<>();
    public Stack<Integer> lastThis = new Stack<>();

    public void assign(int vid, MemRegOperand mro) {
        assignVR.put(vid, mro);
    }

    public MemRegOperand convertVid(int vid) {
        return assignVR.get(vid);
    }

    public boolean inside() {
        return (inLoop > 0 || inIf > 0);
    }

    public int countVid() {
        return vid;
    }

    public int getRspOffset() {
        if (vid%2 == 1) {
            return vid * Constants.sizeOfReg;
        } else {
            return (vid+1) * Constants.sizeOfReg;
        }
    }

    public void enterLoop() { ++inLoop; }
    public void leaveLoop() { --inLoop; }
    public void enterIf() { ++inIf; }
    public void leaveIf() { --inIf; }
    public void enterScope() {
        scopeHead = scopeHead + "@";
    }
    public void leaveScope() {
        scopeHead = scopeHead.substring(1);
    }

    private String find(String identifier) {
        String nw = scopeHead;
        while (nw.length() > 0) {
            if (identifierToVid.containsKey(nw+identifier)) return nw+identifier;
            nw = nw.substring(1);
        }
        if (identifierToVid.containsKey(identifier)) return identifier;
        return null;
    }

    public boolean contains(String identifier) {
        return (find(identifier) != null);
    }

    public int getVid(String id) {
        String identifier = find(id);
        if (identifier!=null && identifierToVid.containsKey(identifier))
            return identifierToVid.get(identifier);
        identifierToVid.put(id, vid);
        vid++;
        //System.err.println("Try to find \'"+identifier+"\', get "+String.valueOf(vid-1));
        //System.err.println("\t"+identifierToVid.toString());
        return vid-1;
    }

    public void setNodeVid(ASTBaseNode node, int vid) {
        nodeToVid.put(node, vid);
    }

    public void setMemRef(ASTBaseNode node, BaseOperand op) {
        findMem.put(node, op);
    }

    public BaseOperand findMemRef(ASTBaseNode node) {
        return findMem.get(node);
    }

    public int getVid(ASTBaseNode node) throws Exception {
        if (!nodeToVid.containsKey(node)) {
            throw new Exception("Vid assign failed. ("+node.getCtx().getText()+")");
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

    public String getCallCnt() {
        callId++;
        return "call"+String.valueOf(callId-1);
    }

    public String getForCnt() {
        forId++;
        return "for"+String.valueOf(forId-1);
    }

    public String getIfCnt() {
        ifId++;
        return "if"+String.valueOf(ifId-1);
    }

    public int getVid(String identifier, VirtualRegOperand vl, VirtualRegOperand vr) {
        if (damaged.contains(vl.getVid()) || damaged.contains(vr.getVid()) || inIf > 0 || inLoop > 0) {
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

    public int getNewVid(String identifier) {
        identifier = scopeHead+identifier;
        identifierToVid.put(identifier, vid);
        vid++;
        return vid-1;
    }
}
