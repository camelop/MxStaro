package cn.littleround;

import cn.littleround.ASTnode.*;
import cn.littleround.antlr4_gen.MxStarBaseListener;
import cn.littleround.antlr4_gen.MxStarParser;

import java.util.Stack;

public class ASTCreator extends MxStarBaseListener {
    public boolean isFailed = false;
    private MxStarParser parser;
    private Stack<ASTBaseNode> nodeStack = new Stack<>();

    private void reportError(int line, String message) {
        isFailed = true;
        System.out.println(Integer.toString(line)+" Semantic Error :"+message);
        System.exit(-1);
    }

    private void print(String message) {
        System.out.println(message);
    }

    public CompilationNode getRoot() {
        return (CompilationNode) nodeStack.peek();
    }

    public ASTCreator(MxStarParser _parser) {
        parser = _parser;
    }

    @Override
    public void exitPrimaryExpression(MxStarParser.PrimaryExpressionContext ctx) {
        super.exitPrimaryExpression(ctx);
        ExpressionNode en = null;
        if (ctx.Identifier() != null) {
            en = new IdentifierNode(ctx.Identifier().getText());
        } else if (ctx.Constant() != null) {
            en = new ConstantNode(Integer.valueOf(ctx.Constant().getText()));
        } else if (ctx.StringLiteral() != null) {
            en = new StringLiteralNode(ctx.Constant().getText());
        } else if (ctx.expression() != null) {
            en = (ExpressionNode) nodeStack.pop();
        } else /*'this'*/{
            en = new ThisNode();
        }
        nodeStack.push(en);
    }

    @Override
    public void exitPostfixExpression(MxStarParser.PostfixExpressionContext ctx) {
        super.exitPostfixExpression(ctx);
        ExpressionNode en = null;
        if (ctx.primaryExpression() != null) {
            en = (ExpressionNode) nodeStack.pop();
        } else if (ctx.expression() != null) {
            ASTBaseNode en2 = nodeStack.pop();
            ASTBaseNode en1 = nodeStack.pop();
            en = new SubscriptOpNode();
            en.addSon(en1);
            en.addSon(en2);
        } else if (ctx.getChild(1).getText().equals("(")) {
            ASTBaseNode aeln = null;
            if (ctx.argumentExpressionList() != null) {
                aeln = nodeStack.pop();
            } else {
                aeln = new ArgumentListNode();
            }
            ASTBaseNode en1 = nodeStack.pop();
            en = new ParenthesisOpNode();
            en.addSon(en1);
            en.addSon(aeln);
        } else if (ctx.Identifier() != null) {
            //TODO
        }
        nodeStack.push(en);
    }

    @Override
    public void exitArgumentExpressionList(MxStarParser.ArgumentExpressionListContext ctx) {
        super.exitArgumentExpressionList(ctx);
    }

    @Override
    public void exitUnaryExpression(MxStarParser.UnaryExpressionContext ctx) {
        super.exitUnaryExpression(ctx);
    }

    @Override
    public void exitUnaryOperator(MxStarParser.UnaryOperatorContext ctx) {
        super.exitUnaryOperator(ctx);
    }

    @Override
    public void exitCastExpression(MxStarParser.CastExpressionContext ctx) {
        super.exitCastExpression(ctx);
    }

    @Override
    public void exitMultiplicativeExpression(MxStarParser.MultiplicativeExpressionContext ctx) {
        super.exitMultiplicativeExpression(ctx);
    }

    @Override
    public void exitAdditiveExpression(MxStarParser.AdditiveExpressionContext ctx) {
        super.exitAdditiveExpression(ctx);
    }

    @Override
    public void exitShiftExpression(MxStarParser.ShiftExpressionContext ctx) {
        super.exitShiftExpression(ctx);
    }

    @Override
    public void exitRelationalExpression(MxStarParser.RelationalExpressionContext ctx) {
        super.exitRelationalExpression(ctx);
    }

    @Override
    public void exitEqualityExpression(MxStarParser.EqualityExpressionContext ctx) {
        super.exitEqualityExpression(ctx);
    }

    @Override
    public void exitAndExpression(MxStarParser.AndExpressionContext ctx) {
        super.exitAndExpression(ctx);
    }

    @Override
    public void exitExclusiveOrExpression(MxStarParser.ExclusiveOrExpressionContext ctx) {
        super.exitExclusiveOrExpression(ctx);
    }

    @Override
    public void exitInclusiveOrExpression(MxStarParser.InclusiveOrExpressionContext ctx) {
        super.exitInclusiveOrExpression(ctx);
    }

    @Override
    public void exitLogicalAndExpression(MxStarParser.LogicalAndExpressionContext ctx) {
        super.exitLogicalAndExpression(ctx);
    }

    @Override
    public void exitLogicalOrExpression(MxStarParser.LogicalOrExpressionContext ctx) {
        super.exitLogicalOrExpression(ctx);
    }

    @Override
    public void exitExpression(MxStarParser.ExpressionContext ctx) {
        super.exitExpression(ctx);
    }

    @Override
    public void exitDeclaration(MxStarParser.DeclarationContext ctx) {
        super.exitDeclaration(ctx);
    }

    @Override
    public void exitDeclarationSpecifiers(MxStarParser.DeclarationSpecifiersContext ctx) {
        super.exitDeclarationSpecifiers(ctx);
    }

    @Override
    public void exitDeclarationSpecifier(MxStarParser.DeclarationSpecifierContext ctx) {
        super.exitDeclarationSpecifier(ctx);
    }

    @Override
    public void exitInitDeclaratorList(MxStarParser.InitDeclaratorListContext ctx) {
        super.exitInitDeclaratorList(ctx);
    }

    @Override
    public void exitInitDeclarator(MxStarParser.InitDeclaratorContext ctx) {
        super.exitInitDeclarator(ctx);
    }

    @Override
    public void exitTypeSpecifier(MxStarParser.TypeSpecifierContext ctx) {
        super.exitTypeSpecifier(ctx);
    }

    @Override
    public void exitFunctionSpecifier(MxStarParser.FunctionSpecifierContext ctx) {
        super.exitFunctionSpecifier(ctx);
    }

    @Override
    public void exitDeclarator(MxStarParser.DeclaratorContext ctx) {
        super.exitDeclarator(ctx);
    }

    @Override
    public void exitNestedParenthesesBlock(MxStarParser.NestedParenthesesBlockContext ctx) {
        super.exitNestedParenthesesBlock(ctx);
    }

    @Override
    public void exitParameterList(MxStarParser.ParameterListContext ctx) {
        super.exitParameterList(ctx);
    }

    @Override
    public void exitParameterDeclaration(MxStarParser.ParameterDeclarationContext ctx) {
        super.exitParameterDeclaration(ctx);
    }

    @Override
    public void exitIdentifierList(MxStarParser.IdentifierListContext ctx) {
        super.exitIdentifierList(ctx);
    }

    @Override
    public void exitTypedefName(MxStarParser.TypedefNameContext ctx) {
        super.exitTypedefName(ctx);
    }

    @Override
    public void exitStatement(MxStarParser.StatementContext ctx) {
        super.exitStatement(ctx);
    }

    @Override
    public void exitCompoundStatement(MxStarParser.CompoundStatementContext ctx) {
        super.exitCompoundStatement(ctx);
    }

    @Override
    public void exitBlockItemList(MxStarParser.BlockItemListContext ctx) {
        super.exitBlockItemList(ctx);
    }

    @Override
    public void exitBlockItem(MxStarParser.BlockItemContext ctx) {
        super.exitBlockItem(ctx);
    }

    @Override
    public void exitExpressionStatement(MxStarParser.ExpressionStatementContext ctx) {
        super.exitExpressionStatement(ctx);
    }

    @Override
    public void exitSelectionStatement(MxStarParser.SelectionStatementContext ctx) {
        super.exitSelectionStatement(ctx);
    }

    @Override
    public void exitIterationStatement(MxStarParser.IterationStatementContext ctx) {
        super.exitIterationStatement(ctx);
    }

    @Override
    public void exitForCondition(MxStarParser.ForConditionContext ctx) {
        super.exitForCondition(ctx);
    }

    @Override
    public void exitForDeclaration(MxStarParser.ForDeclarationContext ctx) {
        super.exitForDeclaration(ctx);
    }

    @Override
    public void exitForExpression(MxStarParser.ForExpressionContext ctx) {
        super.exitForExpression(ctx);
    }

    @Override
    public void exitJumpStatement(MxStarParser.JumpStatementContext ctx) {
        super.exitJumpStatement(ctx);
    }

    @Override
    public void exitCompilationUnit(MxStarParser.CompilationUnitContext ctx) {
        super.exitCompilationUnit(ctx);
    }

    @Override
    public void exitTranslationUnit(MxStarParser.TranslationUnitContext ctx) {
        super.exitTranslationUnit(ctx);
    }

    @Override
    public void exitExternalDeclaration(MxStarParser.ExternalDeclarationContext ctx) {
        super.exitExternalDeclaration(ctx);
    }

    @Override
    public void exitClassDefinition(MxStarParser.ClassDefinitionContext ctx) {
        super.exitClassDefinition(ctx);
    }

    @Override
    public void exitClassDeclarationList(MxStarParser.ClassDeclarationListContext ctx) {
        super.exitClassDeclarationList(ctx);
    }

    @Override
    public void exitClassDeclaration(MxStarParser.ClassDeclarationContext ctx) {
        super.exitClassDeclaration(ctx);
    }

    @Override
    public void exitFunctionDefinition(MxStarParser.FunctionDefinitionContext ctx) {
        super.exitFunctionDefinition(ctx);
    }

    @Override
    public void exitDeclarationList(MxStarParser.DeclarationListContext ctx) {
        super.exitDeclarationList(ctx);
    }

    @Override
    public void exitNewExpression(MxStarParser.NewExpressionContext ctx) {
        super.exitNewExpression(ctx);
    }
}
