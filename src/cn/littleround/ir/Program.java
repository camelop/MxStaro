package cn.littleround.ir;

import cn.littleround.ASTnode.*;
import cn.littleround.Constants;
import cn.littleround.nasm.Directives;
import cn.littleround.nasm.Section;

import java.util.ArrayList;

public class Program {

    public String getHead() {
        return head;
    }

    /*
            call protocol
                for normal functions:
                    [head]_text__[funcname]
                for functions in class:
                    [head]_text_[classname]_[funcname]
                for global data:
                    [head]_data
            Special attention!:
                in [head]_text__main, function should call "[head]_data_init" first
             */
    private final String head = Constants.head;
    private ArrayList<Function> funcs = new ArrayList<>();
    private boolean valid = true;

    public GlobalRecord getGlobalRecord() {
        return gr;
    }

    private GlobalRecord gr = new GlobalRecord(head+"_data");
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

    private void convertIR() throws Exception {
        BlockNode initAssignNode = null;
        // addVariable function nodes into funcs, count global variables
        for (ASTBaseNode i:astSource.getSons()) {
            if (i instanceof ClassDefinitionNode) {
                ClassDefinitionNode cdn = (ClassDefinitionNode) i;
                for (FuncDefinitionNode j:cdn.getInnerFuncs()) {
                    funcs.add(new ClassFunction(head+"_text_"+cdn.getIdentifier()+"_"+j.getIdentifier(), j, this));
                }
            } else if (i instanceof FuncDefinitionNode) {
                FuncDefinitionNode fdn = (FuncDefinitionNode) i;
                if (fdn.getIdentifier().equals("built_in_data_init")) {
                    initAssignNode = fdn.block();
                    funcs.add(new NormalFunction(head+"_datainit", fdn, this));
                } else {
                    funcs.add(new NormalFunction(head+"_text__"+fdn.getIdentifier(),fdn, this));
                }
            } else if (i instanceof DeclarationNode) {
                DeclarationNode dn = (DeclarationNode) i;
                // global variables
                for (ASTBaseNode j:dn.initDeclaratorList().getSons()) {
                    InitDeclaratorNode idn = (InitDeclaratorNode) j;
                    gr.addVariable(idn.getIdentifier(), idn);
                    if (idn.isInitialized()) {
                        assert initAssignNode != null;
                        initAssignNode.addAssignNode(
                                new IdentifierNode(idn.declarator().getIdentifier()),
                                idn.initValue());
                    }
                }
            }
        }
        for (Function f:funcs) f.convertNasm();
    }

    private void regAlloc(){
        for (Function f:funcs) f.regAlloc();
    }

    public void convert() throws Exception {
        //TODO
        convertIR();
        regAlloc();
    }

    public void optimize() {
        //TODO
    }

    public String generateNasmCode() {
        Directives d = new Directives();
        Section funcSection = new Section(funcs);
        Section dataSection = gr.getDataSection();
        Section bssSection = gr.getBssSection();
        String sep = System.lineSeparator();
        return d.toString()
                +sep
                +dataSection.toString()
                +sep
                +bssSection.toString()
                +sep
                +funcSection.toString();
    }
}
