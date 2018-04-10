package cn.littleround;


import cn.littleround.ASTnode.ASTBaseNode;
import cn.littleround.ASTnode.ConstantNode;
import cn.littleround.antlr4_gen.MxStarLexer;
import cn.littleround.antlr4_gen.MxStarParser;
import org.antlr.v4.runtime.ANTLRInputStream;
import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.tree.ParseTreeWalker;

import javax.sound.midi.SysexMessage;
import java.io.*;
import java.util.ArrayList;

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
        //System.exit(0);
        // check input args
        if (args.length != 1) {
            System.out.print("Wrong arg number.");
            return;
        }

        // read source code from loc: args[0]
        StringBuilder sb = new StringBuilder();
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
        String sc = sb.toString(); // System.out.print(sc);

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
            creator.setFailed(true);
        }
        if (creator.isFailed()) {
            System.out.println(creator.getErrors());
            System.exit(-1);
        }

        // run semantic check on AST
        ASTBaseNode root = creator.getRoot();
        output(args[0], root.toTreeString(0,4));
        try {
            root.checkClass();
            root.checkType();
        } catch (Exception e) {
            ASTBaseNode.setFailed(true);
        }
        if (ASTBaseNode.isFailed()) {
            System.out.println(ASTBaseNode.getErrors());
            System.exit(-1);
        }
    }
}
