package cn.littleround.ASTnode;

import cn.littleround.Constants;
import cn.littleround.ir.Function;
import cn.littleround.nasm.BasicBlock;
import cn.littleround.nasm.Instruction.BaseLine;
import cn.littleround.nasm.Instruction.MovLine;
import cn.littleround.nasm.Instruction.PopLine;
import cn.littleround.nasm.Instruction.RetLine;
import cn.littleround.nasm.Operand.RegOperand;
import cn.littleround.nasm.Operand.VirtualRegOperand;
import cn.littleround.symbol.FuncFormSymbol;
import cn.littleround.symbol.Symbol;
import cn.littleround.symbol.VariableSymbol;

import java.util.ArrayDeque;
import java.util.ArrayList;

public class FuncDefinitionNode extends DeclarationNode {

    public FuncDeclaratorNode funcDeclarator() { return (FuncDeclaratorNode) getSons().get(1);}

    public ArgumentTypeListNode args() {
        return (ArgumentTypeListNode) funcDeclarator().getSons().get(1);
    }

    public DeclaratorNode declarator() {
        return (DeclaratorNode) funcDeclarator().getSons().get(0);
    }

    public BlockNode block() { return (BlockNode) getSons().get(2);}

    public String getIdentifier() {
        return declarator().getIdentifier();
    }

    public Symbol getSymbol() {
        FuncFormSymbol ffs = new FuncFormSymbol();
        ffs.setRetType(specifier());
        ffs.setName(getIdentifier());
        for (Symbol i:args().getSymbols()) {
            VariableSymbol vs = (VariableSymbol) i;
            ffs.addParam(vs.getTypeNode());
        }
        ffs.setSrc(this);
        return ffs;
    }

    @Override
    public ArrayList<Symbol> getSymbols() {
        ArrayList<Symbol> sl = new ArrayList<>();
        sl.add(getSymbol());
        return sl;
    }

    @Override
    public void createSymbolTable() {
        for (Symbol s:args().getSymbols()) {
            //System.out.println(s.getName());
            if (!getSymbolTable().add(s))
                reportError("Semantic Error", "Redefined symbol "+s.getName()+".");
        }
        //System.out.println("Table\n"+getSymbolTable().toInfoString());
        specifier().createSymbolTable(); specifier().updateSymbolTable();
        funcDeclarator().createSymbolTable(); funcDeclarator().updateSymbolTable();
        for (ASTBaseNode i:block().getSons()) {
            if (i instanceof DeclarationNode) {
                for (Symbol s:((DeclarationNode) i).getSymbols()) {
                    if (!getSymbolTable().add(s)) reportError("Semantic Error", "Redefined symbol "+s.getName()+".");
                }
            }
            i.createSymbolTable();
            i.updateSymbolTable();
        }
    }

    @Override
    public void checkType() {
        for (ASTBaseNode i:getSons()) i.checkType();
        if (specifier().attribute() == null) {
            // check if it is constructor
            ASTBaseNode f = getParent();
            while ((f!=null)&&!(f instanceof ClassDefinitionNode)) f = f.getParent();
            if (f == null)
                reportError("Semantic", "Where is the function specifiers?");
            else if (!((ClassDefinitionNode) f).getIdentifier().equals(declarator().getIdentifier())) {
                reportError("Semantic", "Constructor should be named \'"+
                        ((ClassDefinitionNode) f).getIdentifier()+
                        "\', not \'"+
                        declarator().getIdentifier()+"\'.");
            }
        }
    }

    @Override
    public ArrayDeque<BasicBlock> renderNasm(Function f) throws Exception {
        // pre (ATTENTION! Do NOT change render order!!!)
        ArrayList<BaseLine> pre = new ArrayList<>();
        for (int i=0; i < args().getSons().size(); ++i) {
            ArgumentDeclarationNode adn = (ArgumentDeclarationNode) args().getSons().get(i);
            if (i<Constants.callConvRegsLen) {
                pre.add(new MovLine(
                            new VirtualRegOperand(f.nctx().getVid(adn.getIdentifer())),
                            new RegOperand(Constants.callConvRegs[i])
                        ));
            } else {
                pre.add(new PopLine(
                            new VirtualRegOperand(f.nctx().getVid(adn.getIdentifer()))
                        ));
            }
        }
        for (int i=0; i<Constants.callConvReservRegsLen; ++i) {
            pre.add(new MovLine(
                        new VirtualRegOperand(f.nctx().getVid("_"+Constants.callConvReservRegs[i])),
                        new RegOperand(Constants.callConvReservRegs[i])
                    ));
        }
        // mid
        ArrayDeque<BasicBlock> mid = block().renderNasm(f);
        // combine pre
        if (mid.size() > 0) {
            mid.getFirst().addFirst(pre);
        } else {
            mid = new ArrayDeque<>();
            BasicBlock bb = new BasicBlock();
            bb.add(pre);
            mid.add(bb);
        }
        // post (if return void not explicit)
        BasicBlock post = new BasicBlock(f.getLabel()+"_inexplicit_return_void");
        for (int i=0; i<Constants.callConvReservRegsLen; ++i) {
            post.add(new MovLine(
                        new RegOperand(Constants.callConvReservRegs[i]),
                        new VirtualRegOperand(f.nctx().getVid("_"+Constants.callConvReservRegs[i]))
                ));
        }
        post.add(new RetLine());
        // combine post
        BasicBlock.dequeCombine(mid, post);
        return mid;
    }
}
