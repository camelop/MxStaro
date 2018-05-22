package cn.littleround.ir;

import cn.littleround.ASTnode.CompilationNode;

import java.util.ArrayList;

public class Program {
    /*
    call protocol
        for normal functions:
            [global]__[funcname]
        for functions in class:
            [global]_[classname]_[funcname]
     */
    private static final String global = "MxStar";
    private ArrayList<Function> funcs;
    private boolean valid = true;
    private CompilationNode astSource;

    public Program(CompilationNode cn) {
        astSource = cn;
    }

    public boolean isValid() {
        return valid;
    }

    public void setValid(boolean valid) {
        this.valid = valid;
    }

    public void convert() {
        //TODO
    }

    public void optimize() {
        //TODO
    }

    public String generateNasmCode() {
        //TODO
        return "Oops";
    }
}
