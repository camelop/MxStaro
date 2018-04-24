package cn.littleround.ASTnode;

import cn.littleround.symbol.*;
import cn.littleround.type.BaseType;
import cn.littleround.type.FuncType;
import cn.littleround.type.KlassType;
import cn.littleround.type.VoidType;
import org.antlr.v4.runtime.ParserRuleContext;

import java.util.ArrayList;

public abstract class ASTBaseNode {

    private ASTBaseNode parent = null;
    private ArrayList<ASTBaseNode> sons = new ArrayList<>();
    private ParserRuleContext ctx;
    private SymbolTable st = new SymbolTable();
    protected BaseType type;

    private static boolean isFailed = false;
    private static ArrayList<String> errors = new ArrayList<>();

    public static boolean isFailed() {
        return isFailed;
    }

    public static void setFailed(boolean isFailed) {
        ASTBaseNode.isFailed = isFailed;
    }

    protected void reportError(String errorType, String message) {
        isFailed = true;
        errors.add("[line " +String.valueOf(ctx.getStart().getLine()-38)+" "
                +String.valueOf(ctx.getStart().getCharPositionInLine())+"] "
                +errorType+" Error: "+message+"\n");
        // System.exit(-1);
    }

    public static String getErrors() {
        StringBuilder sb = new StringBuilder();
        for (String i:errors) sb.append(i);
        return sb.toString();
    }

    public void addSon(ASTBaseNode _son) {
        sons.add(_son);
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

    public ParserRuleContext getCtx() {
        return ctx;
    }

    public void setCtx(ParserRuleContext ctx) {
        this.ctx = ctx;
    }

    public String toTreeString(int blank, int step) {
        StringBuilder sb = new StringBuilder();
        for (int i=0; i<blank; ++i) sb.append(' ');
        sb.append("-");
        sb.append(this.getClass().getSimpleName());
        sb.append(" (");
        if (type != null) sb.append(type.toString());
        sb.append(")");
        if (ctx != null) sb.append("\t\t\t// "+ctx.getText());
        sb.append('\n');
        for (ASTBaseNode i:sons) sb.append(i.toTreeString(blank+step, step));
        return sb.toString();
    }

    public void createSymbolTable() {
        for (ASTBaseNode i:sons) {
            if (i instanceof DeclarationNode) {
                for (Symbol s:((DeclarationNode) i).getSymbols()) {
                    if (!st.add(s)) reportError("Semantic Error", "Redefined symbol "+s.getName()+".");
                }
            }
            i.createSymbolTable();
        }
    }

    public SymbolTable getSymbolTable() {
        return st;
    }

    public void updateSymbolTable() {
        if (getParent() != null) {
            st.merge(getParent().getSymbolTable());
        }
        for (ASTBaseNode i:sons) {
            i.updateSymbolTable();
        }
    }

    public void updateType() {
        for (ASTBaseNode i:sons) i.updateType();
        type = new VoidType();
    }

    public void checkType() {
        for (ASTBaseNode i:sons) i.checkType();
    }

    protected BaseType symbolToType(Symbol def) {
        BaseType ret = null;
        if (def instanceof VariableSymbol) ret = ((VariableSymbol) def).getType(); else {
            if (def instanceof FuncSymbol) ret = new FuncType((FuncSymbol) def); else {
                if (def instanceof ClassSymbol) {
                    ret = new KlassType((ClassSymbol) def);
                }
            }
        }
        return ret;
    }
}