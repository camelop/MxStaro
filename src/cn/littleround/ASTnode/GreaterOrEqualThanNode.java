package cn.littleround.ASTnode;

import cn.littleround.Constants;
import cn.littleround.ir.Function;
import cn.littleround.nasm.BasicBlock;
import cn.littleround.nasm.Instruction.*;
import cn.littleround.nasm.Operand.DecimalOperand;
import cn.littleround.nasm.Operand.RegOperand;
import cn.littleround.nasm.Operand.VirtualRegOperand;
import cn.littleround.type.IntType;

import java.util.ArrayDeque;

public class GreaterOrEqualThanNode extends CompareBinaryOpNode {
    @Override
    public ArrayDeque<BasicBlock> renderNasm(Function f) throws Exception {
        if (op1().type instanceof IntType) {
            ArrayDeque<BasicBlock> ret = super.renderNasm(f);
            int vid = f.nctx().getVid();
            BasicBlock bb = new BasicBlock();
            //bb.add(new XorLine(new VirtualRegOperand(vid))); // xor change flags!!!
            bb.add(new SetGELine(new VirtualRegOperand(vid)));
            bb.add(new AndLine(new VirtualRegOperand(vid), new DecimalOperand(Constants.byteMask)));
            f.nctx().setNodeVid(this ,vid);
            BasicBlock.dequeCombine(ret, bb);
            return ret;
        } else {
            ArrayDeque<BasicBlock> ret = super.renderNasm(f);
            int vdes = f.nctx().getVid();
            BasicBlock bb = new BasicBlock();
            //bb.add(new XorLine(new VirtualRegOperand(vid))); // xor change flags!!!
            String tail = f.nctx().getSaveRegCnt();
            saveCallerRegs(bb,f,tail);
            f.nctx().uncache(f.nctx().getVid(op1()));
            f.nctx().uncache(f.nctx().getVid(op2()));
            f.nctx().uncache(vdes);
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
            bb.add(new SetGELine(new VirtualRegOperand(vdes)));
            bb.add(new AndLine(new VirtualRegOperand(vdes), new DecimalOperand(Constants.byteMask)));
            loadCallerRegs(bb,f,tail);
            f.nctx().setNodeVid(this ,vdes);
            BasicBlock.dequeCombine(ret, bb);
            return ret;
        }
    }
}
