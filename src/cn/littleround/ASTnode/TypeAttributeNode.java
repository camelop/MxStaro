package cn.littleround.ASTnode;

import cn.littleround.Constants;
import cn.littleround.type.BaseType;
import cn.littleround.type.PointerType;
import cn.littleround.type.UserDefinedType;

import java.lang.reflect.Type;
import java.util.ArrayList;

public class TypeAttributeNode extends ASTBaseNode {
    private String identifier;
    private int pointerLevel = 0;
    private ArrayList<ExpressionNode> pointerExpressionList = new ArrayList<>();
    public String getIdentifier() {
        return identifier;
    }

    public void setIdentifier(String identifier) {
        this.identifier = identifier;
    }

    public TypeAttributeNode(String identifier) {
        this.identifier = identifier;
    }

    public int getPointerLevel() {
        return pointerLevel;
    }

    public void addPointerLevel() {
        ++this.pointerLevel;
    }

    @Override
    public boolean equals(Object obj) {
        if (!(obj instanceof ASTBaseNode)) return false;
        TypeAttributeNode tan = (TypeAttributeNode) obj;
        return this.identifier == tan.identifier && this.pointerLevel == tan.pointerLevel;
    }

    public BaseType getType() {
        BaseType ret;
        switch (identifier) {
            case "int":
                ret = Constants.INT;
                break;
            case "string":
                ret = Constants.STRING;
                break;
            case "bool":
                ret = Constants.BOOL;
                break;
            case "void":
                ret = Constants.VOID;
                break;
            default:
                ret = new UserDefinedType(identifier);
                break;
        }
        int pl = pointerLevel;
        while (pl > 0) {
            --pl;
            ret = new PointerType(ret);
        }
        return ret;
    }

    public void addPointerExpression(ExpressionNode e) {
        if (pointerExpressionList.size() > 0) {
            if (e != null && pointerExpressionList.get(pointerExpressionList.size()-1) == null)
                reportError("Semantic", "Invalid pointer expression.");
        }
        pointerExpressionList.add(e);
    }

    @Override
    public void checkType() {
        super.checkType();
        BaseType t = getType();
        if (t instanceof UserDefinedType) {
            if (getSymbolTable().getClassSymbol(t.toString()) == null)
                reportError("Semantic", "Invalid type specifier.");
        }
    }
}
