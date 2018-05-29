package cn.littleround.ASTnode;

import cn.littleround.Constants;
import cn.littleround.ir.Function;
import cn.littleround.nasm.BasicBlock;
import cn.littleround.nasm.Instruction.*;
import cn.littleround.nasm.Operand.DecimalOperand;
import cn.littleround.nasm.Operand.RegOperand;
import cn.littleround.nasm.Operand.VirtualRegOperand;
import cn.littleround.type.IntType;
import cn.littleround.type.PointerType;
import cn.littleround.type.StringType;

import java.util.ArrayDeque;

public class InequalNode extends BinaryOpNode {
    @Override
    public void updateType() {
        super.updateType();
        if (!op1().type.equals(op2().type)) {
            reportError("Semantic Error",
                    "Compare between different types( "+op1().type.toString()+" =? "+op2().type.toString()+" ).");
        }
        type = Constants.BOOL;
    }
    @Override
    public ArrayDeque<BasicBlock> renderNasm(Function f) throws Exception {
        if (!(op1().type instanceof StringType)) {
            ArrayDeque<BasicBlock> ret = super.renderNasm(f);
            int vid = f.nctx().getVid();
            BasicBlock bb = new BasicBlock();
            bb.add(new CmpLine(
                    new VirtualRegOperand(f.nctx().getVid(op1())),
                    new VirtualRegOperand(f.nctx().getVid(op2()))
            ));
            //bb.add(new XorLine(new VirtualRegOperand(vid))); // xor change flags!!!
            bb.add(new SetNELine(new VirtualRegOperand(vid)));
            bb.add(new AndLine(new VirtualRegOperand(vid), new DecimalOperand(Constants.byteMask)));
            f.nctx().setNodeVid(this ,vid);
            BasicBlock.dequeCombine(ret, bb);
            return ret;
        } else {
            ArrayDeque<BasicBlock> ret = super.renderNasm(f);
            int vdes = f.nctx().getVid();
            BasicBlock bb = new BasicBlock();
            bb.add(new CmpLine(
                    new VirtualRegOperand(f.nctx().getVid(op1())),
                    new VirtualRegOperand(f.nctx().getVid(op2()))
            ));
            //bb.add(new XorLine(new VirtualRegOperand(vid))); // xor change flags!!!
            saveCallerRegs(bb,f);
            bb.add(new MovLine(
                    new RegOperand("rdi"),
                    new VirtualRegOperand(f.nctx().getVid(op1()))
            ));
            bb.add(new MovLine(
                    new RegOperand("rsi"),
                    new VirtualRegOperand(f.nctx().getVid(op2()))
            ));
            bb.add(new CallLine("strcmp"));
            bb.add(new CmpLine(
                    new RegOperand("rax"),
                    new DecimalOperand(0)
            ));
            bb.add(new SetNELine(new VirtualRegOperand(vdes)));
            bb.add(new AndLine(new VirtualRegOperand(vdes), new DecimalOperand(Constants.byteMask)));
            loadCallerRegs(bb,f);
            f.nctx().setNodeVid(this ,vdes);
            BasicBlock.dequeCombine(ret, bb);
            return ret;
        }
    }
}
