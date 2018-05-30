package cn.littleround.ASTnode;

import cn.littleround.Constants;
import cn.littleround.ir.Function;
import cn.littleround.nasm.BasicBlock;
import cn.littleround.nasm.Instruction.*;
import cn.littleround.nasm.Operand.*;
import cn.littleround.type.VoidType;

import java.util.ArrayDeque;

public class NewNode extends BinaryOpNode {
    @Override
    public void updateType() {
        super.updateType();
        type = ((TypeNode) op1()).getType();
        if (type instanceof VoidType)
            reportError("Semantic", "New void is unacceptable.");
    }

    @Override
    public ArrayDeque<BasicBlock> renderNasm(Function f) throws Exception {
        // prepare size
        ArrayDeque<BasicBlock> ret = op1().renderNasm(f);
        BasicBlock bb = new BasicBlock();
        // calculate size
        int vid = f.nctx().getVid();
        bb.add(new MovLine(new VirtualRegOperand(vid), new VirtualRegOperand(f.nctx().getVid(op1()))));
        int width = ((TypeNode) op1()).attribute().getWidth();
        bb.add(new MulLine(new VirtualRegOperand(vid), new DecimalOperand(width)));
        bb.add(new AddLine(new VirtualRegOperand(vid), new DecimalOperand(Constants.sizeOfReg)));
        // call malloc
        saveCallerRegs(bb, f);
        bb.add(new MovLine(
                new RegOperand("rdi"),
                new VirtualRegOperand(vid)
        ));
        bb.add(new CallLine("malloc"));
        int vdes = f.nctx().getVid();
        bb.add(new MovLine(
                new VirtualRegOperand(vdes),
                new RegOperand("rax")
        ));
        bb.add(new MovLine(
                new MemRegOperand(new RegOperand("rax")),
                new VirtualRegOperand(f.nctx().getVid(op1()))
        ));
        // check if need to construct
        TypeAttributeNode tan = ((TypeNode) op1()).attribute();
        if (tan.getPointerLevel() == 0) {
            bb.add(new MovLine(
                    new RegOperand("rdi"),
                    new VirtualRegOperand(vdes)
            ));
            bb.add(new CallLine(Constants.head+"_text_"+tan.getIdentifier()+"_"+tan.getIdentifier()));
        }
        loadCallerRegs(bb, f);
        // set return new value
        f.nctx().setNodeVid(this, vdes);
        BasicBlock.dequeCombine(ret, bb);
        // suger
        if (tan.getPointerExpressionList().size() > 1 && !(tan.getPointerExpressionList().get(1) instanceof EmptyExpressionNode)) {
            //TODO: construct safe loops
            /*
             *vdes is the base loc
             *int[][][][] a = new int[5][5][5][];
             *                    ----1--2--3-4--
             *only loop %1 and %2
             *new (int[]).width * %3
            **/
            // calc (int[]).width
            BasicBlock lbb = new BasicBlock();
            int vcnt = f.nctx().getVid();
            int vloc = f.nctx().getVid();
            // init cnt, loc
            lbb.add(new MovLine(
                    new VirtualRegOperand(vcnt),
                    new VirtualRegOperand(f.nctx().getVid(op1()))
            ));
            lbb.add(new MovLine(
                    new VirtualRegOperand(vloc),
                    new VirtualRegOperand(vdes)
            ));
            lbb.add(new AddLine(
                    new VirtualRegOperand(vloc),
                    new DecimalOperand(Constants.sizeOfReg)
            ));
            // begin loop
            String label = f.getLabel()+"_"+f.nctx().getNewCnt();
            lbb.add(new LabelLine(label+"_expand_start"));
            BasicBlock.dequeCombine(ret, lbb);
            // render content inside
            NewNode nn = new NewNode();
            TypeAttributeNode newTan = new TypeAttributeNode(tan.getIdentifier());
            for (int i=1; i<tan.getSons().size(); ++i) { // notice: from 1!
                newTan.addPointerExpression((ExpressionNode)(tan.getSons().get(i)));
                newTan.addPointerLevel(); // not elegant code before...
            }
            TypeNode newTn = new TypeNode(); newTn.addSon(newTan);
            nn.addSon(newTn); nn.addSon(getSons().get(1));
            BasicBlock.dequeCombine(ret, nn.renderNasm(f));
            // mov new malloc, add loc, dec cnt, check > 0
            BasicBlock rbb = new BasicBlock();
            rbb.add(new MovLine(
                    new MemRegOperand(new VirtualRegOperand(vloc)),
                    new VirtualRegOperand(f.nctx().getVid(nn))
            ));
            rbb.add(new AddLine(
                    new VirtualRegOperand(vloc),
                    new DecimalOperand(newTan.getWidth())
            ));
            rbb.add(new SubLine(
                    new VirtualRegOperand(vcnt),
                    new DecimalOperand(1)
            ));
            rbb.add(new CmpLine(
                    new VirtualRegOperand(vcnt),
                    new DecimalOperand(0)
            ));
            rbb.add(new JneLine(new SymbleOperand(label+"_expand_start")));
            rbb.add(new LabelLine(label+"_expand_end"));
            BasicBlock.dequeCombine(ret, rbb);
        }
        return ret;
    }
}
