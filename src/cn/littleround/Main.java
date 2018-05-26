package cn.littleround;


import cn.littleround.ASTnode.ASTBaseNode;
import cn.littleround.ASTnode.CompilationNode;
import cn.littleround.antlr4_gen.MxStarLexer;
import cn.littleround.antlr4_gen.MxStarParser;
import cn.littleround.ir.Program;
import org.antlr.v4.runtime.ANTLRInputStream;
import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.tree.ParseTreeWalker;

import java.io.*;
import java.util.HashSet;

public class Main {

    private static void output(String loc, String message) {
        try {
            Writer out = new FileWriter(loc);
            out.write(message);
            out.close();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    public static void main(String[] args) {
//        System.exit(0);
        // check input args
        String sc;
        HashSet<String> argSet = new HashSet<>();
        //String lib_loc = Thread.currentThread().getContextClassLoader().getResource("").getPath()+"cn/littleround/mxlib/lib.mx";
        if (args.length > 1) {
            for (int i = 0; i < args.length; ++i) {
                argSet.add(args[i]);
            }
        }
        StringBuilder sb = new StringBuilder();
            /*
            try {
                BufferedReader in = new BufferedReader(
                        new FileReader(lib_loc)
                );
                String line = in.readLine();
                while (line != null) {
                    sb.append(line).append('\n');
                    line = in.readLine();
                }
                in.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
            */
        sb.append(Constants.lib);
        if (args.length == 0) {
            // read source code from stdin
            try {
                BufferedReader in = new BufferedReader(
                        new InputStreamReader(System.in)
                );
                String line = in.readLine();
                while (line != null) {
                    sb.append(line).append('\n');
                    line = in.readLine();
                }
                in.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else {
            // read source code from loc: args[0]
            try {
                BufferedReader in = new BufferedReader(
                        new FileReader(args[0])
                );
                String line = in.readLine();
                while (line != null) {
                    sb.append(line).append('\n');
                    line = in.readLine();
                }
                in.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        sc = sb.toString();
        //System.out.println(sc);

        // load ANTLR4 frontend
        CharStream stream = new ANTLRInputStream(sc);
        MxStarLexer lexer = new MxStarLexer(stream);
        CommonTokenStream tokens = new CommonTokenStream(lexer);
        MxStarParser parser = new MxStarParser(tokens);
        // parse
        MxStarParser.CompilationUnitContext tree = parser.compilationUnit();

        // build AST
        ASTCreator creator = new ASTCreator(parser);
        try {
            ParseTreeWalker.DEFAULT.walk(creator, tree);
        } catch (Exception e) {
            e.printStackTrace();
            creator.setFailed(true);
        }
        if (creator.isFailed()) {
            System.err.println(creator.getErrors());
            System.exit(-1);
        }

        // run semantic check on AST
        ASTBaseNode root = creator.getRoot();
        try {
            root.createSymbolTable();
            root.updateType();
            root.checkType();
        } catch (Exception e) {
            e.printStackTrace();
            ASTBaseNode.setFailed(true);
        }
        if (ASTBaseNode.isFailed()) {
            System.err.println(ASTBaseNode.getErrors());
            System.exit(-1);
        }
        if (argSet.contains("-AST")) {
            output(args[0]+".ast", root.toTreeString(0,4));
            //System.err.println();
            //System.err.println("AST:");
            //System.err.println(root.toTreeString(0, 4));
        }

        // construct IR and generate Code
        String nasmCode = "Code generation failed.";
        Program pg = new Program((CompilationNode) root);
        try {
            pg.convert();
            pg.optimize();
            nasmCode = pg.generateNasmCode();
        } catch (Exception e) {
            e.printStackTrace();
            pg.setValid(false);
        }
        if (!pg.isValid()) {
            System.exit(-1);
        };

        // output
        if (!argSet.contains("-out")) System.out.println(nasmCode);
            else output(args[0]+".asm", nasmCode);
    }
}
