package cn.littleround;


import cn.littleround.ASTnode.ASTBaseNode;
import cn.littleround.antlr4_gen.MxStarLexer;
import cn.littleround.antlr4_gen.MxStarParser;
import org.antlr.v4.runtime.ANTLRInputStream;
import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.tree.ParseTreeWalker;

import java.io.*;
import java.net.URL;

public class Main {

    private static void output(String loc, String message) {
        try {
            Writer out = new FileWriter(loc+".ast");
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
        //String lib_loc = Thread.currentThread().getContextClassLoader().getResource("").getPath()+"cn/littleround/mxlib/lib.mx";
        if (args.length > 1) {
            System.out.print("Wrong arg number.");
            return;
        } else {
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
        }
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
            root.updateSymbolTable();
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
        output(args[0], root.getSymbolTable().toInfoString());
        if (args.length > 0) output(args[0], root.toTreeString(0,4));
        System.err.println();
        System.err.println("AST:");
        System.err.println(root.toTreeString(0,4));
    }
}
