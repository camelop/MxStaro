package cn.littleround.ASTnode;

import cn.littleround.Constants;
import cn.littleround.ir.Function;
import cn.littleround.nasm.BasicBlock;
import cn.littleround.nasm.Instruction.CallLine;
import cn.littleround.nasm.Instruction.MovLine;
import cn.littleround.nasm.Instruction.PopLine;
import cn.littleround.nasm.Instruction.PushLine;
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
        for (String r: Constants.callerRegs) {
            bb.add(new MovLine(
                    new VirtualRegOperand(f.nctx().getVid("_"+r)),
                    new RegOperand(r)
            ));
        }
        // fill in args
        int cnt = 0;
        for (ASTBaseNode node: op2().getSons()) {
            if (cnt < Constants.callConvRegsLen) {
                bb.add(new MovLine(
                        new RegOperand(Constants.callConvRegs[cnt]),
                        new VirtualRegOperand(f.nctx().getVid(node))
                ));
                ++cnt;
            } else {
                bb.add(new PushLine(
                        new VirtualRegOperand(f.nctx().getVid(node))
                ));
            }
        }
        // call
        bb.add(new CallLine(funcLabel));
        // get returns, set nctx
        int vid = f.nctx().getVid();
        bb.add(new MovLine(
                new VirtualRegOperand(vid),
                new RegOperand("rax")
        ));
        f.nctx().setNodeVid(this, vid);
        // load regs
        for (String r: Constants.callerRegs) {
            bb.add(new MovLine(
                    new RegOperand(r),
                    new VirtualRegOperand(f.nctx().getVid("_"+r))
            ));
        }
        // add bb
        if (ret.size() == 0) {
            ret.add(bb);
        } else {
            BasicBlock.dequeCombine(ret, bb);
        }
        return ret;
    }
}
