package cn.littleround.ASTnode;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public abstract class ASTBaseNode {

    private ASTBaseNode parent = null;
    private ArrayList<ASTBaseNode> sons = new ArrayList<>();

    public void addSon(ASTBaseNode _son) {
        sons.add(_son);
    }

    public void setSons(ArrayList<ASTBaseNode> _sons) {
        sons = _sons;
    }

    public void setParent(ASTBaseNode _parent) {
        parent = _parent;
    }

    public ArrayList<ASTBaseNode> getSons() {
        return sons;
    }

    public ASTBaseNode getParent() {
        return parent;
    }
}