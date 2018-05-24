package cn.littleround.nasm;

import cn.littleround.ASTnode.ASTBaseNode;

import java.util.HashMap;

public class NasmContext {
    private int vid = 0;
    private HashMap<ASTBaseNode, Integer> nodeToVid = new HashMap<>();
    private HashMap<String, Integer> identifierToVid = new HashMap<>();

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
}
