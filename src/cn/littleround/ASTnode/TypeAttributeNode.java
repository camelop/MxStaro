package cn.littleround.ASTnode;

import cn.littleround.Constants;
import cn.littleround.ir.Function;
import cn.littleround.nasm.BasicBlock;
import cn.littleround.nasm.Instruction.MovLine;
import cn.littleround.nasm.Operand.DecimalOperand;
import cn.littleround.nasm.Operand.VirtualRegOperand;
import cn.littleround.symbol.ClassSymbol;
import cn.littleround.type.*;

import java.lang.reflect.Type;
import java.util.ArrayDeque;
import java.util.ArrayList;

public class TypeAttributeNode extends ASTBaseNode {
    private String identifier;
    private int pointerLevel = 0;

    public ArrayList<ExpressionNode> getPointerExpressionList() {
        return pointerExpressionList;
    }

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
        return this.identifier.equals(tan.identifier) && this.pointerLevel == tan.pointerLevel;
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
        if (pl > 0 && ret instanceof VoidType)
            reportError("Semantic", "Void array is invalid.");
        while (pl > 0) {
            --pl;
            ret = new PointerType(ret);
        }
        return ret;
    }

    public void addPointerExpression(ExpressionNode e) {
        if (pointerExpressionList.size() > 0) {
            if (e != null && pointerExpressionList.get(pointerExpressionList.size()-1) == null)
                reportError("Semantic", "Invalid pointer retExpression.");
        }
        pointerExpressionList.add(e);
        addSon(e);
        e.setParent(this);
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

    public int getWidth() {
        if (pointerLevel >= 1) {
            return Constants.sizeOfReg;
        } else {
            //System.err.println("get type->"+getType().toString());
            int size = ((ClassSymbol) getSymbolTable().getClassSymbol(identifier)).size();
            //System.err.println("get size->"+String.valueOf(size));
            return size;
        }
    }

    @Override
    public ArrayDeque<BasicBlock> renderNasm(Function f) throws Exception {
        if (pointerLevel == 0 || pointerExpressionList.get(0) instanceof EmptyExpressionNode) {
            ArrayDeque<BasicBlock> ret = new ArrayDeque<>();
            BasicBlock bb = new BasicBlock();
            int vid = f.nctx().getVid();
            bb.add(new MovLine(
                    new VirtualRegOperand(vid),
                    new DecimalOperand(1)
            ));
            f.nctx().setNodeVid(this, vid);
            ret.add(bb);
            return ret;
        } else {
            // only get rid of the first one
            ExpressionNode en = pointerExpressionList.get(0);
            ArrayDeque<BasicBlock> ret = en.renderNasm(f);
            f.nctx().setNodeVid(this, f.nctx().getVid(en));
            return ret;
        }
    }
}
