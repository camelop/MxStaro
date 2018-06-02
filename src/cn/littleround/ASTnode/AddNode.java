package cn.littleround.ASTnode;

import cn.littleround.ir.Function;
import cn.littleround.nasm.BasicBlock;
import cn.littleround.nasm.Instruction.AddLine;
import cn.littleround.nasm.Instruction.CallLine;
import cn.littleround.nasm.Instruction.MovLine;
import cn.littleround.nasm.Operand.DecimalOperand;
import cn.littleround.nasm.Operand.RegOperand;
import cn.littleround.nasm.Operand.VirtualRegOperand;
import cn.littleround.type.IntType;
import cn.littleround.type.StringType;

import java.util.ArrayDeque;

public class AddNode extends BinaryOpNode {

    @Override
    public void updateType() {
        super.updateType();
        //System.out.println(op2().getSymbolTable().toInfoString());
        if (!(((op1().type instanceof IntType) && op2().type instanceof IntType)||((op1().type instanceof StringType)&&( op2().type instanceof StringType))))
            if (op1().type == null || op2().type == null) {
                reportError("Semantic", "Expect int or string value between \'+\', not null.");
            } else
                reportError("Semantic", "Expect int or string value between \'+\', not "+op1().type.toString()+" and "+op2().type.toString()+".");
        type = op1().type;
    }

    @Override
    public ArrayDeque<BasicBlock> renderNasm(Function f) throws Exception {
        if (op1().type instanceof IntType) {
            ArrayDeque<BasicBlock> ret = super.renderNasm(f);
            VirtualRegOperand vl = new VirtualRegOperand(f.nctx().getVid(op1()));
            VirtualRegOperand vr = new VirtualRegOperand(f.nctx().getVid(op2()));
            VirtualRegOperand vt = new VirtualRegOperand(f.nctx().getVid());
            BasicBlock bb = new BasicBlock();
            bb.add(new MovLine(vt, vl));
            bb.add(new AddLine(vt, vr));
            f.nctx().setNodeVid(this, vt.getVid());
            BasicBlock.dequeCombine(ret, bb);
            return ret;
        } else /*string type*/ {
            ArrayDeque<BasicBlock> ret = super.renderNasm(f);
            BasicBlock bb = new BasicBlock();
            String tail = f.nctx().getSaveRegCnt();
            saveCallerRegs(bb, f, tail);
            int vop1 = f.nctx().getVid(op1()); f.nctx().uncache(vop1);
            int vop2 = f.nctx().getVid(op2()); f.nctx().uncache(vop2);
            // calc length
            bb.add(new MovLine(
                    new RegOperand("rdi"),
                    new VirtualRegOperand(vop1)
            ));
            bb.add(new CallLine("strlen"));
            int vlen1 = f.nctx().getVid(); f.nctx().uncache(vlen1);
            bb.add(new MovLine(
                    new VirtualRegOperand(vlen1),
                    new RegOperand("rax")
            ));
            bb.add(new MovLine(
                    new RegOperand("rdi"),
                    new VirtualRegOperand(vop2)
            ));
            bb.add(new CallLine("strlen"));
            int vlen2 = f.nctx().getVid(); f.nctx().uncache(vlen2);
            bb.add(new MovLine(
                    new VirtualRegOperand(vlen2),
                    new RegOperand("rax")
            ));
            bb.add(new AddLine(
                    new VirtualRegOperand(vlen2),
                    new VirtualRegOperand(vlen1)
            ));
            bb.add(new AddLine(
                    new VirtualRegOperand(vlen2),
                    new DecimalOperand(1)
            ));
            // malloc
            bb.add(new MovLine(
                    new RegOperand("rdi"),
                    new VirtualRegOperand(vlen2)
            ));
            bb.add(new CallLine("malloc"));
            int vdes = f.nctx().getVid(); f.nctx().uncache(vdes);
            bb.add(new MovLine(
                    new VirtualRegOperand(vdes),
                    new RegOperand("rax")
            ));
            // do strcpy
            bb.add(new MovLine(
                    new RegOperand("rdi"),
                    new RegOperand("rax")
            ));
            bb.add(new MovLine(
                    new RegOperand("rsi"),
                    new VirtualRegOperand(vop1)
            ));
            bb.add(new CallLine("strcpy"));
            bb.add(new MovLine(
                    new RegOperand("rdi"),
                    new VirtualRegOperand(vdes)
            ));
            bb.add(new AddLine(
                    new RegOperand("rdi"),
                    new VirtualRegOperand(vlen1)
            ));
            bb.add(new MovLine(
                    new RegOperand("rsi"),
                    new VirtualRegOperand(vop2)
            ));
            bb.add(new CallLine("strcpy"));
            loadCallerRegs(bb, f, tail);
            f.nctx().setNodeVid(this, vdes);
            BasicBlock.dequeCombine(ret, bb);
            return ret;
        }
    }
}
