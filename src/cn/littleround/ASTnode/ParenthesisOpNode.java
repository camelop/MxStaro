package cn.littleround.ASTnode;

import cn.littleround.Constants;
import cn.littleround.ir.Function;
import cn.littleround.nasm.BasicBlock;
import cn.littleround.nasm.Instruction.*;
import cn.littleround.nasm.Operand.DecimalOperand;
import cn.littleround.nasm.Operand.MemRegOperand;
import cn.littleround.nasm.Operand.RegOperand;
import cn.littleround.nasm.Operand.VirtualRegOperand;
import cn.littleround.symbol.VariableSymbol;
import cn.littleround.type.FuncType;
import cn.littleround.type.TypeList;

import java.util.ArrayDeque;

public class ParenthesisOpNode extends BinaryOpNode {
    @Override
    public void updateType() {
        super.updateType();
        if (!(op1().type instanceof FuncType)) {
            if (op1() instanceof IdentifierNode) {
                ((IdentifierNode) op1()).updateTypeToFunc();
            }
            if (op1() instanceof DotOpNode) {
                // WTF, tired to solve
            }
        }
        if (!(op1().type instanceof FuncType)) {
            reportError("Semantic Error", "op1 should be Func type in parenthesis operation.");
        }

        TypeList tl = new TypeList();
        for (ASTBaseNode i:op2().getSons()) {
            tl.add(i.type);
        }
        type = ((FuncType) op1().type).getRetType(tl);
        if (type == null)
            reportError("Semantic", "Cannot find coresponding function form.");
    }

    private boolean isClassFuncCall() {
        return (op1() instanceof DotOpNode);
    }
    @Override
    public ArrayDeque<BasicBlock> renderNasm(Function f) throws Exception {
        String funcLabel;
        if (isClassFuncCall()) {
            DotOpNode don = (DotOpNode) op1();
            funcLabel = Constants.head+"_text_"+don.op1().type.toString()+"_"+don.getIdentifier();
        } else {
            IdentifierNode idn = (IdentifierNode) op1();
            funcLabel = Constants.head+"_text__"+idn.getIdentifier();
        }
        ArrayDeque<BasicBlock> ret = op2().renderNasm(f);
        BasicBlock bb = new BasicBlock(f.getLabel()+"_"+f.nctx().getCallCnt());
        // save regs
        saveCallerRegs(bb, f);
        // fill in args
        int cnt = 0;
        int nArgs = op2().getSons().size();
        boolean align = nArgs > 6 && nArgs % 2 == 1;
        int downArea = align ? (nArgs-5)*Constants.sizeOfReg : (nArgs-6)*Constants.sizeOfReg;
        for (ASTBaseNode node: op2().getSons()) {
            if (cnt < Constants.callConvRegsLen) {
                bb.add(new MovLine(
                        new RegOperand(Constants.callConvRegs[cnt]),
                        new VirtualRegOperand(f.nctx().getVid(node))
                ));
                ++cnt;
            } else {
                MemRegOperand mro = new MemRegOperand(new RegOperand("rsp"));
                mro.setOffset((cnt-5)*Constants.sizeOfReg-downArea-(align?Constants.sizeOfReg:0));
                bb.add(new MovLine(
                        mro,
                        new VirtualRegOperand(f.nctx().getVid(node))
                ));
                ++cnt;
            }
        }
        // check align
        if (align) {
            bb.add(new SubLine(new RegOperand("rsp"), new DecimalOperand(downArea)));
        }
        // call
        bb.add(new CallLine(funcLabel));
        // restore align-assigned space
        if (align) {
            bb.add(new AddLine(new RegOperand("rsp"), new DecimalOperand(downArea)));
        }
        // get returns, set nctx
        int vid = f.nctx().getVid();
        bb.add(new MovLine(
                new VirtualRegOperand(vid),
                new RegOperand("rax")
        ));
        f.nctx().setNodeVid(this, vid);
        // load regs
        loadCallerRegs(bb, f);
        // add bb
        if (ret.size() == 0) {
            ret.add(bb);
        } else {
            BasicBlock.dequeCombine(ret, bb);
        }
        return ret;
    }
}
