package cn.littleround;


import cn.littleround.antlr4_gen.MxStarLexer;
import cn.littleround.antlr4_gen.MxStarParser;
import org.antlr.v4.runtime.ANTLRInputStream;
import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.tree.ParseTreeWalker;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

public class Main {

    public static void main(String[] args) {
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
        String sc = sb.toString();
        // System.out.print(sc);
        // load ANTLR frontend
        CharStream stream = new ANTLRInputStream(sc);
        MxStarLexer lexer = new MxStarLexer(stream);
        CommonTokenStream tokens = new CommonTokenStream(lexer);
        MxStarParser parser = new MxStarParser(tokens);
        MxStarParser.CompilationUnitContext tree = parser.compilationUnit();

        ASTCreator ASTCreator = new ASTCreator(parser);
        try {
            System.err.print("Building AST... ");
            ParseTreeWalker.DEFAULT.walk(ASTCreator, tree);
            System.err.println(ASTCreator.isFailed() ? "Failed" : "Success");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
