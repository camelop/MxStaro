package cn.littleround.ASTnode;

import cn.littleround.Constants;
import cn.littleround.ir.Function;
import cn.littleround.nasm.BasicBlock;
import cn.littleround.nasm.Instruction.MovLine;
import cn.littleround.nasm.Operand.GlobalVariableOperand;
import cn.littleround.nasm.Operand.SymbleOperand;
import cn.littleround.nasm.Operand.VirtualRegOperand;

import java.util.ArrayDeque;

public class StringLiteralNode extends ExpressionNode {
    private String string;

    public String getString() {
        return string;
    }

    public void setString(String string) {
        this.string = string;
    }

    public StringLiteralNode(String string) {
        this.string = string.substring(1, string.length()-1);
    }

    @Override
    public void updateType() {
        super.updateType();
        type = Constants.STRING;
    }

    @Override
    public ArrayDeque<BasicBlock> renderNasm(Function f) throws Exception {
        ArrayDeque<BasicBlock> ret = new ArrayDeque<>();
        BasicBlock bb = new BasicBlock();
        int sid = f.getGlobalRecord().addString(string);
        int vid = f.nctx().getVid("@s"+String.valueOf(sid));
        bb.add(new MovLine(
                new VirtualRegOperand(vid),
                new SymbleOperand(Constants.head+"_data_s"+String.valueOf(sid))
        ));
        f.nctx().setNodeVid(this, vid);
        ret.add(bb);
        return ret;
    }
}
