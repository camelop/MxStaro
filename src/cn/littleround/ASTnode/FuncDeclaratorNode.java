package cn.littleround.ASTnode;

public class FuncDeclaratorNode extends DeclaratorNode {
    public ArgumentTypeListNode argTypeList() {
        return (ArgumentTypeListNode) getSons().get(1);
    }
}
