package cn.littleround.ASTnode;

import cn.littleround.ir.Function;
import cn.littleround.nasm.BasicBlock;
import cn.littleround.nasm.Instruction.AddLine;
import cn.littleround.nasm.Instruction.MovLine;
import cn.littleround.nasm.Instruction.SubLine;
import cn.littleround.nasm.Operand.DecimalOperand;
import cn.littleround.nasm.Operand.VirtualRegOperand;

import java.util.ArrayDeque;

public class SubNode extends IntBinaryOpNode {
    @Override
    public ArrayDeque<BasicBlock> renderNasm(Function f) throws Exception {
        if (op2() instanceof ConstantNode) {
            // lhs is const
            ArrayDeque<BasicBlock> ret = op1().renderNasm(f);
            VirtualRegOperand vt = new VirtualRegOperand(f.nctx().getVid());
            BasicBlock bb = new BasicBlock();
            bb.add(new MovLine(
                    vt, new VirtualRegOperand(f.nctx().getVid(op1()))
            ));
            bb.add(new SubLine(
                    vt, new DecimalOperand(((ConstantNode) op2()).getConstant())
            ));
            f.nctx().setNodeVid(this, vt.getVid());
            BasicBlock.dequeCombine(ret, bb);
            return ret;
        } else  {
            ArrayDeque<BasicBlock> ret = super.renderNasm(f);
            VirtualRegOperand vl = new VirtualRegOperand(f.nctx().getVid(op1()));
            VirtualRegOperand vr = new VirtualRegOperand(f.nctx().getVid(op2()));
            VirtualRegOperand vt = new VirtualRegOperand(f.nctx().getVid());
            BasicBlock bb = new BasicBlock();
            bb.add(new MovLine(vt, vl));
            bb.add(new SubLine(vt, vr));
            f.nctx().setNodeVid(this, vt.getVid());
            BasicBlock.dequeCombine(ret, bb);
            return ret;
        }
    }
}
