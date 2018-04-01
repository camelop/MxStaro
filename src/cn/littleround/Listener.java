package cn.littleround;

import cn.littleround.antlr4_gen.MxStarBaseListener;
import cn.littleround.antlr4_gen.MxStarParser;
import org.antlr.v4.runtime.ParserRuleContext;

public class Listener extends MxStarBaseListener {
    @Override
    public void enterDeclaration(MxStarParser.DeclarationContext ctx) {
        super.enterDeclaration(ctx);
        System.out.println("Declaration: "+ctx.getText());
    }

    @Override
    public void enterDeclarationSpecifiers(MxStarParser.DeclarationSpecifiersContext ctx) {
        super.enterDeclarationSpecifiers(ctx);
        System.out.println("Specifiers: "+ctx.getText());
    }

    @Override
    public void exitExpression(MxStarParser.ExpressionContext ctx) {
        super.exitExpression(ctx);
        System.out.println("expression: "+ctx.getText());
    }
}
