package cn.littleround.ASTnode;

import cn.littleround.Constants;
import cn.littleround.ir.Function;
import cn.littleround.nasm.BasicBlock;
import cn.littleround.nasm.Instruction.MovLine;
import cn.littleround.nasm.Operand.MemRegOperand;
import cn.littleround.nasm.Operand.MemSymOperand;
import cn.littleround.nasm.Operand.VirtualRegOperand;

import java.util.ArrayDeque;

public class AssignNode extends BinaryOpNode {
    @Override
    public void updateType() {
        super.updateType();
        if (!op1().type.equals(op2().type)) {
            reportError("Semantic",
                    "Assign between different types( "+op1().type.toString()+" =? "+op2().type.toString()+" ).");
        }
    }

    @Override
    public void checkType() {
        super.checkType();
        // left
        if (!isLvalue(op1())) {
            reportError("Semantic", "Assign to a r-value is illegal.");
        }
    }

    @Override
    public ArrayDeque<BasicBlock> renderNasm(Function f) throws Exception {
        // wrong, shouldn't call, "return super.renderNasm(f);"
        // because we can REDEFINE some identifiers
        ArrayDeque<BasicBlock> ret = op2().renderNasm(f);
        VirtualRegOperand vsrc = new VirtualRegOperand(f.nctx().getVid(op2()));
        BasicBlock bb = new BasicBlock();
        if (op1() instanceof IdentifierNode) {
            if (f.nctx().contains(((IdentifierNode) op1()).getIdentifier())) {
                // local variable
                if (f.nctx().inside()) {
                    bb.add(new MovLine(
                            new VirtualRegOperand(f.nctx().getVid(((IdentifierNode) op1()).getIdentifier())),
                            vsrc,
                            "assign->"+((IdentifierNode) op1()).getIdentifier()
                    ));
                } else {
                    int newVid = f.nctx().getNewVid(((IdentifierNode) op1()).getIdentifier());
                    bb.add(new MovLine(
                            new VirtualRegOperand(newVid),
                            vsrc,
                            "assign->"+((IdentifierNode) op1()).getIdentifier()
                    ));
                }
            } else {
                // global
                bb.add(new MovLine(
                        new MemSymOperand(Constants.head+"_data_bss_"+((IdentifierNode) op1()).getIdentifier()),
                        vsrc
                ));
            }
        } else if (op1() instanceof SubscriptOpNode || op1() instanceof DotOpNode) {
            BasicBlock.dequeCombine(ret, op1().renderNasm(f));
            bb.add(new MovLine(
                    f.nctx().findMemRef(op1()),
                    vsrc,
                    "assign->"+op1().getCtx().getText()
            ));
        }
        BasicBlock.dequeCombine(ret, bb);
        return ret;
        // TODO othercase?
    }
}
