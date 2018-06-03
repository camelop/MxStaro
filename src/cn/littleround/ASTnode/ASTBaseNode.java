package cn.littleround.ASTnode;

import cn.littleround.Constants;
import cn.littleround.ir.Function;
import cn.littleround.nasm.BasicBlock;
import cn.littleround.nasm.Instruction.LabelLine;
import cn.littleround.nasm.Instruction.MovLine;
import cn.littleround.nasm.Operand.RegOperand;
import cn.littleround.nasm.Operand.VirtualRegOperand;
import cn.littleround.symbol.*;
import cn.littleround.type.BaseType;
import cn.littleround.type.FuncType;
import cn.littleround.type.KlassType;
import cn.littleround.type.VoidType;
import org.antlr.v4.runtime.ParserRuleContext;

import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;

public abstract class ASTBaseNode implements Cloneable{

    private ASTBaseNode parent = null;
    private ArrayList<ASTBaseNode> sons = new ArrayList<>();
    private ParserRuleContext ctx;

    public void setSymbolTable(SymbolTable st) {
        this.st = st;
        for (ASTBaseNode i: sons) {
            i.setSymbolTable(st);
        }
    }

    public String findFatherClassName(){
        ASTBaseNode f = getParent();
        while (f!=null && !(f instanceof ClassDefinitionNode)) f=f.getParent();
        if (f == null) return null;
        return ((ClassDefinitionNode)f).getIdentifier();
    }

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
        errors.add("[line " +String.valueOf(ctx.getStart().getLine()- Constants.libLength)+" "
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
        //sb.append(st.toInfoString());
        for (ASTBaseNode i:sons) sb.append(i.toTreeString(blank+step, step));
        return sb.toString();
    }

    // Passes below
    public void createSymbolTable() {
        for (ASTBaseNode i:sons) {
            if (i instanceof DeclarationNode) {
                for (Symbol s:((DeclarationNode) i).getSymbols()) {
                    if (!st.add(s)) reportError("Semantic", "Redefined symbol "+s.getName()+".");
                }
            }
            i.createSymbolTable();
            i.updateSymbolTable();
        }
    }

    public void updateSymbolTable() {
        ASTBaseNode f = getParent();
        while (f!=null) {
            getSymbolTable().merge(f.getSymbolTable());
            f = f.getParent();
        }
    }

    public SymbolTable getSymbolTable() {
        return st;
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

    public boolean isGlobal() {
        ASTBaseNode f = getParent();
        while ((f!=null) && !(f instanceof FuncDefinitionNode) && !(f instanceof ClassDefinitionNode) && !(f instanceof BlockNode))
            f = f.getParent();
        return f == null;
    }

    public boolean isSonOf(ASTBaseNode rhs) {
        ASTBaseNode f = this;
        while (f.getParent()!=null) {
            if (f == rhs) return true;
            f = f.getParent();
        }
        return false;
    }

    public ArrayDeque<BasicBlock> renderNasm(Function f) throws Exception {
        System.err.println("You really want to see ME? ( not overrided in "+this.getClass().getSimpleName()+") //"+ctx.getText());
        return new ArrayDeque<>();
    }

    public ArrayDeque<BasicBlock> renderAllSonNasm(Function f) throws Exception {
        // a default method for renderNasm
        ArrayDeque<BasicBlock> ret = new ArrayDeque<>();
        for (ASTBaseNode son:getSons()) {
            ArrayDeque<BasicBlock> nw = son.renderNasm(f);
            if (ret.size() == 0) ret = nw; else {
                BasicBlock.dequeCombine(ret, nw);
            }
        }
        return ret;
    }

    static public void saveCallerRegs(BasicBlock bb, Function f, String tail) {
        // save regs
        /*
        bb.add(new LabelLine(f.getLabel()+"_"+tail+"_save"));
        for (String r: Constants.callerRegs) {
            int vnow = f.nctx().getVid("_"+r+"_"+tail);
            f.nctx().uncache(vnow);
            bb.add(new MovLine(
                    new VirtualRegOperand(vnow),
                    new RegOperand(r)
            ));
        }
        */
    }

    static public void loadCallerRegs(BasicBlock bb, Function f, String tail) {
        // load regs
        /*
        bb.add(new LabelLine(f.getLabel()+"_"+tail+"_load"));
        for (String r: Constants.callerRegs) {
            int vnow = f.nctx().getVid("_"+r+"_"+tail);
            f.nctx().uncache(vnow);
            bb.add(new MovLine(
                    new RegOperand(r),
                    new VirtualRegOperand(vnow)
            ));
        }
        */
    }
    public boolean containCall() {
        for (ASTBaseNode i:sons) {
            if (i.containCall()) return true;
        }
        return false;
    }

    public void replaceConstant() {
        ArrayList<ASTBaseNode> newSons = new ArrayList<ASTBaseNode>();
        for (ASTBaseNode son : sons) {
            ConstantNode c = son.toConstant();
            if (c != null) {
                newSons.add(c);
            } else {
                newSons.add(son);
            }
        }
        sons = newSons;
    }


    // no use, broken
    public void inline(CompilationNode root) throws CloneNotSupportedException {
        HashMap<ASTBaseNode, ASTBaseNode> replace = new HashMap<ASTBaseNode, ASTBaseNode>();
        for (ASTBaseNode son : sons) {
            if (son instanceof ParenthesisOpNode && ((ParenthesisOpNode) son).op1() instanceof IdentifierNode) {
                //find associated function and check if inlinable(!containCall)
                //clone it and replace all arguments
                //TODO TODO
                ParenthesisOpNode pon = ((ParenthesisOpNode) son);
                FuncDefinitionNode f = root.findFunctionFDN(((IdentifierNode) pon.op1()).getIdentifier());
                if (!f.containCall() && !Constants.builtInList.contains(f.getIdentifier())) {
                    BlockNode bn = (BlockNode) f.block().clone();
                    ArrayList<String> before = new ArrayList<String>();
                    ArrayList<String> after = new ArrayList<String>();
                    System.err.println(f.toTreeString(2,4));
                    for (ASTBaseNode i: f.funcDeclarator().argTypeList().getSons()) {
                        ArgumentDeclarationNode adn = (ArgumentDeclarationNode) i;
                        before.add(adn.getIdentifer());
                    }
                    ArgumentListNode aln = (ArgumentListNode) pon.op2();
                    for (ASTBaseNode i: aln.getSons()) {
                        after.add(((IdentifierNode)i).getIdentifier());
                    }
                    assert before.size() == after.size();
                    for (int i=0; i<before.size(); ++i) {
                        bn.replaceIdentifier(before.get(i), after.get(i));
                    }
                    replace.put(son, bn);
                }
            }
        }
        if (!replace.isEmpty()) {
            ArrayList<ASTBaseNode> newSons = new ArrayList<ASTBaseNode>();
            for (ASTBaseNode son:sons) {
                if (replace.containsKey(son)) {
                    newSons.add(replace.get(son));
                } else {
                    newSons.add(son);
                }
            }
            sons = newSons;
        }
        for (ASTBaseNode son:sons) {
            son.inline(root);
        }
    }

    private ConstantNode toConstant() {
        return null;
    }

    @Override
    protected ASTBaseNode clone() throws CloneNotSupportedException {
        ASTBaseNode ret = (ASTBaseNode) super.clone();
        ret.sons = new ArrayList<ASTBaseNode>();
        for (ASTBaseNode i:sons) {
            ret.addSon(i.clone());
        }
        return ret;
    }

    public void replaceIdentifier(String before, String after) {
        for (ASTBaseNode i:sons) i.replaceIdentifier(before, after);
    }
}