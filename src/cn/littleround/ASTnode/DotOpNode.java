package cn.littleround.ASTnode;

import cn.littleround.Constants;
import cn.littleround.ir.Function;
import cn.littleround.nasm.BasicBlock;
import cn.littleround.nasm.Instruction.AddLine;
import cn.littleround.nasm.Instruction.MovLine;
import cn.littleround.nasm.Operand.DecimalOperand;
import cn.littleround.nasm.Operand.MemRegOperand;
import cn.littleround.nasm.Operand.MemSymOperand;
import cn.littleround.nasm.Operand.VirtualRegOperand;
import cn.littleround.symbol.ClassSymbol;
import cn.littleround.symbol.Symbol;
import cn.littleround.type.PointerType;
import cn.littleround.type.StringType;
import cn.littleround.type.UserDefinedType;

import java.util.ArrayDeque;


public class DotOpNode extends UnaryOpNode {
    private String identifier;

    public String getIdentifier() {
        return identifier;
    }

    public void setIdentifier(String identifier) {
        this.identifier = identifier;
    }

    @Override
    public void updateType() {
        super.updateType();
        if (!(op1().type instanceof UserDefinedType) &&
                !(op1().type instanceof StringType) &&
                !(op1().type instanceof PointerType))
            reportError("Semantic Error", "Dot operator after traditional types is not allowed.");
        if (op1().type instanceof UserDefinedType) {
            ClassSymbol cs = (ClassSymbol) getSymbolTable().getClassSymbol(op1().type.toString());
            Symbol s = cs.getSymbol(identifier);
            type = symbolToType(s);
        } else if (op1().type instanceof StringType) {
            ClassSymbol cs = (ClassSymbol) getSymbolTable().getClassSymbol("built_in_string");
            Symbol s = cs.getSymbol(identifier);
            type = symbolToType(s);
        } else /* pointer Type */ {
            ClassSymbol cs = (ClassSymbol) getSymbolTable().getClassSymbol("built_in_array");
            Symbol s = cs.getSymbol(identifier);
            type = symbolToType(s);
        }
    }

    private boolean isFunc() {
        return (getParent() instanceof ParenthesisOpNode);
    }

    @Override
    public ArrayDeque<BasicBlock> renderNasm(Function f) throws Exception {
        ArrayDeque<BasicBlock> ret = super.renderNasm(f);
        BasicBlock bb = new BasicBlock();
        if (isFunc()) return ret;
        // if not func -> calc offset and store value in setMemRef
        int offset = ((ClassSymbol) getSymbolTable().getClassSymbol(op1().type.toString())).getOffset(identifier);
        int vid = f.nctx().getVid(op1());
        int vdes = f.nctx().getVid();
        bb.add(new MovLine(
                new VirtualRegOperand(vdes),
                new VirtualRegOperand(vid)
        ));
        bb.add(new AddLine(
                new VirtualRegOperand(vdes),
                new DecimalOperand(offset)
        ));
        MemRegOperand des = new MemRegOperand(new VirtualRegOperand(vdes));
        f.nctx().setMemRef(this, des);
        int vValue = f.nctx().getVid();
        bb.add(new MovLine(
                new VirtualRegOperand(vValue),
                des
        ));
        f.nctx().setNodeVid(this, vValue);
        BasicBlock.dequeCombine(ret, bb);
        return ret;
    }
}
