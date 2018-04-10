package cn.littleround.ASTnode;

import org.antlr.v4.runtime.ParserRuleContext;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public abstract class ASTBaseNode {

    private ASTBaseNode parent = null;
    private ArrayList<ASTBaseNode> sons = new ArrayList<>();
    private ParserRuleContext ctx;

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
        errors.add("[line " +String.valueOf(ctx.getStart().getLine())+" "
                +String.valueOf(ctx.getStart().getCharPositionInLine())+"] "
                +errorType+" Error: "+message+"\n");
        // System.exit(-1);
    }

    public static String getErrors() {
        StringBuffer sb = new StringBuffer();
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

    public void reduce() {
        for (ASTBaseNode i:sons) i.reduce();
    }

    public void checkClass() {
        for (ASTBaseNode i:sons) i.checkClass();
    }

    public void checkType() {
        for (ASTBaseNode i:sons) i.checkType();
    }

    public String toTreeString(int blank, int step) {
        StringBuffer sb = new StringBuffer();
        for (int i=0; i<blank; ++i) sb.append(' ');
        sb.append("-");
        sb.append(this.getClass().getSimpleName());
        if (ctx != null) sb.append("\t\t\t// "+ctx.getText());
        sb.append('\n');
        for (ASTBaseNode i:sons) sb.append(i.toTreeString(blank+step, step));
        return sb.toString();
    }
}