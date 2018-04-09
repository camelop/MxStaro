package cn.littleround.ASTnode;

public class FuncAttributeNode extends ASTBaseNode {
    private String attr;

    public String getAttr() {
        return attr;
    }

    public void setAttr(String attr) {
        this.attr = attr;
    }

    public FuncAttributeNode(String attr) {
        this.attr = attr;
    }
}
