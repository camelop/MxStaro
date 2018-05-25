package cn.littleround.ASTnode;

import cn.littleround.ir.Function;
import cn.littleround.nasm.BasicBlock;
import cn.littleround.nasm.Instruction.AddLine;
import cn.littleround.nasm.Instruction.MovLine;
import cn.littleround.nasm.Operand.VirtualRegOperand;
import cn.littleround.type.IntType;
import cn.littleround.type.StringType;

import java.util.ArrayDeque;

public class AddNode extends BinaryOpNode {
    //TODO addVariable string

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
        ArrayDeque<BasicBlock> ret = super.renderNasm(f);
        VirtualRegOperand vl = new VirtualRegOperand(f.nctx().getVid(op1()));
        VirtualRegOperand vr = new VirtualRegOperand(f.nctx().getVid(op2()));
        VirtualRegOperand vt = new VirtualRegOperand(f.nctx().getVid(vl.toString()+"+"+vr.toString(), vl, vr));
        BasicBlock bb = new BasicBlock();
        bb.add(new MovLine(vt, vl));
        bb.add(new AddLine(vt, vr));
        f.nctx().setNodeVid(this, vt.getVid());
        BasicBlock.dequeCombine(ret, bb);
        return ret;
    }
}
