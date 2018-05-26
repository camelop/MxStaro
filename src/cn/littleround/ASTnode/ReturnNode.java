package cn.littleround.ASTnode;

import cn.littleround.Constants;
import cn.littleround.ir.Function;
import cn.littleround.nasm.BasicBlock;
import cn.littleround.nasm.Instruction.MovLine;
import cn.littleround.nasm.Instruction.RetLine;
import cn.littleround.nasm.Operand.RegOperand;
import cn.littleround.nasm.Operand.VirtualRegOperand;
import cn.littleround.symbol.FuncFormSymbol;
import cn.littleround.symbol.FuncSymbol;
import cn.littleround.type.BaseType;
import cn.littleround.type.VoidType;

import java.util.ArrayDeque;

public class ReturnNode extends JumpNode {
    public ExpressionNode retValue() {
        if (getSons().size() == 0) return null;
        return (ExpressionNode) getSons().get(0);
    }
    private BaseType findFatherRetType() {
        ASTBaseNode f = getParent();
        while ((f != null) && !(f instanceof FuncDefinitionNode)) {
            f = f.getParent();
        }
        if (f == null) {
            reportError("Semantic","return not in a function.");
            return Constants.VOID;
        }
        if (((FuncDefinitionNode) f).specifier().attribute() == null) {
            // then it must be a constructor, no need to check;
            return null;
        }
        return ((FuncFormSymbol) ((FuncDefinitionNode) f).getSymbol()).getRetType();
    }
    @Override
    public void checkType() {
        super.checkType();
        BaseType retType = findFatherRetType();
        if (retType == null) {
            if (getSons().size() > 0) {
                reportError("Semantic", "There shall be no return value in constructor.");
            }
            return;
        }
        if (retType instanceof VoidType) {
            if (getSons().size() > 0)
                reportError("Semantic", "\'"+getSons().get(0).getCtx().getText()+"\' unexpected after return in void function.");
        } else {
            if (getSons().size() == 0) {
                reportError("Semantic", "Return value missing.");
            } else if (getSons().size() > 1){
                reportError("Semantic", "Multi value unexpected while return.");
            } else {
                if (!retType.equals(getSons().get(0).type))
                    reportError("Semantic", "\'"+getSons().get(0).type.toString()+"\' should be replaced by a \'"+retType.toString()+"\' after return.");
            }
        }
    }

    @Override
    public ArrayDeque<BasicBlock> renderNasm(Function f) throws Exception {
        ArrayDeque<BasicBlock> ret = new ArrayDeque<>();
        if (retValue() != null) {
            ret = retValue().renderNasm(f);
        }
        BasicBlock bb = new BasicBlock(f.getLabel()+"_"+f.nctx().getRetCnt());
        if (retValue() != null)
            bb.add(new MovLine(
                        new RegOperand("rax"),
                        new VirtualRegOperand(f.nctx().getVid(retValue())))
            );
        for (int i=0; i<Constants.callConvReservRegsLen; ++i) {
            bb.add(new MovLine(
                    new RegOperand(Constants.callConvReservRegs[i]),
                    new VirtualRegOperand(f.nctx().getVid("_"+Constants.callConvReservRegs[i]))
            ));
        }
        bb.add(new RetLine());
        if (ret.size() == 0) {
            ret.add(bb);
        } else {
            BasicBlock.dequeCombine(ret, bb);
        }
        return ret;
    }
}
