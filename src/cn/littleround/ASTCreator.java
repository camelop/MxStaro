package cn.littleround;

import cn.littleround.ASTnode.*;
import cn.littleround.antlr4_gen.MxStarBaseListener;
import cn.littleround.antlr4_gen.MxStarParser;
import org.antlr.v4.runtime.ParserRuleContext;

import java.util.ArrayList;
import java.util.Stack;

public class ASTCreator extends MxStarBaseListener {
    private MxStarParser parser;
    private Stack<ASTBaseNode> nodeStack = new Stack<>();
    private boolean isFailed = false;
    private ArrayList<String> errors = new ArrayList<>();

    private void reportError(ParserRuleContext ctx, String errorType, String message) {
        isFailed = true;
        errors.add("[line " +String.valueOf(ctx.getStart().getLine())+" "
                +String.valueOf(ctx.getStart().getCharPositionInLine())+"] "
                +errorType+" Error: "+message+"\n");
        // System.exit(-1);
    }

    public String getErrors() {
        StringBuilder sb = new StringBuilder();
        for (String i:errors) sb.append(i);
        return sb.toString();
    }

    public CompilationNode getRoot() {
        return (CompilationNode) nodeStack.peek();
    }

    public ASTCreator(MxStarParser parser) {
        this.parser = parser;
    }

    @Override
    public void exitPrimaryExpression(MxStarParser.PrimaryExpressionContext ctx) {
        super.exitPrimaryExpression(ctx);
        ExpressionNode en;
        if (ctx.Identifier() != null) {
            en = new IdentifierNode(ctx.Identifier().getText());
        } else if (ctx.Constant() != null) {
            if (ctx.Constant().getText().equals("true") || ctx.Constant().getText().equals("false")) {
                en = new ConstantNode(Boolean.valueOf(ctx.Constant().getText()));
            } else if (ctx.Constant().getText().equals("null")) {
                en = new ConstantNode();
            } else {
                en = new ConstantNode(Integer.valueOf(ctx.Constant().getText()));
            }
        } else if (ctx.StringLiteral() != null) {
            en = new StringLiteralNode(ctx.StringLiteral().getText());
        } else if (ctx.expression() != null) {
            en = (ExpressionNode) nodeStack.pop();
        } else /*'this'*/{
            switch (ctx.getText()) {
                case "this":
                    en = new ThisNode();
                    break;
                case "true":
                    en = new ConstantNode(true);
                    break;
                case "false":
                    en = new ConstantNode(false);
                    break;
                default:
                    /* "null" */

                    en = new ConstantNode();
                    break;
            }
        }
        en.setCtx(ctx);
        nodeStack.push(en);
    }

    @Override
    public void exitPostfixExpression(MxStarParser.PostfixExpressionContext ctx) {
        super.exitPostfixExpression(ctx);
        ExpressionNode en;
        if (ctx.primaryExpression() != null) {
            en = (ExpressionNode) nodeStack.pop();
        } else if (ctx.expression() != null) {
            ASTBaseNode en2 = nodeStack.pop();
            ASTBaseNode en1 = nodeStack.pop();
            en = new SubscriptOpNode();
            en.addSon(en1); en1.setParent(en);
            en.addSon(en2); en2.setParent(en);
        } else if (ctx.getChild(1).getText().equals("(")) {
            ASTBaseNode aeln;
            if (ctx.argumentExpressionList() != null) {
                aeln = nodeStack.pop();
            } else {
                aeln = new ArgumentListNode();
            }
            ASTBaseNode en1 = nodeStack.pop();
            en = new ParenthesisOpNode();
            en.addSon(en1); en1.setParent(en);
            en.addSon(aeln); aeln.setParent(en);
        } else if (ctx.Identifier() != null) {
            en = new DotOpNode();
            ASTBaseNode en1 = nodeStack.pop();
            ((DotOpNode) en).setIdentifier(ctx.Identifier().getText());
            en.addSon(en1); en1.setParent(en);
        } else if (ctx.getChild(1).getText().equals("++")) {
            en = new PostfixAddNode();
            ASTBaseNode en1 = nodeStack.pop();
            en.addSon(en1); en1.setParent(en);
        } else /* '--' */{
            en = new PostfixSubNode();
            ASTBaseNode en1 = nodeStack.pop();
            en.addSon(en1); en1.setParent(en);
        }
        en.setCtx(ctx);
        nodeStack.push(en);
    }

    @Override
    public void exitArgumentExpressionList(MxStarParser.ArgumentExpressionListContext ctx) {
        super.exitArgumentExpressionList(ctx);
        ArgumentListNode aln;
        ASTBaseNode en1 = nodeStack.pop();
        if (ctx.argumentExpressionList() != null) {
            aln = (ArgumentListNode) nodeStack.pop();
        } else {
            aln = new ArgumentListNode();
        }
        aln.addSon(en1); en1.setParent(aln);
        aln.setCtx(ctx);
        nodeStack.push(aln);
    }

    @Override
    public void exitUnaryExpression(MxStarParser.UnaryExpressionContext ctx) {
        super.exitUnaryExpression(ctx);
        ExpressionNode en;
        if (ctx.postfixExpression() != null) {
            en = (ExpressionNode) nodeStack.pop();
        } else if (ctx.getChild(0).getText().equals("++")) {
            en = new PrefixAddNode();
            ASTBaseNode en1 = nodeStack.pop();
            en.addSon(en1); en1.setParent(en);
        } else if (ctx.getChild(0).getText().equals("--")) {
            en = new PrefixSubNode();
            ASTBaseNode en1 = nodeStack.pop();
            en.addSon(en1); en1.setParent(en);
        } else /* 'other operator' */ {
            String operator = ctx.unaryOperator().getText();
            switch (operator) {
                case "&":
                    en = new BitwiseAndNode();
                    break;
                case "|":
                    en = new BitwiseOrNode();
                    break;
                case "+":
                    en = new UnaryPositiveNode();
                    break;
                case "-":
                    en = new UnaryNegativeNode();
                    break;
                case "~":
                    en = new BitwiseNotNode();
                    break;
                default:
                    /* '!' */

                    en = new LogicalNotNode();
                    break;
            }
            ASTBaseNode en1 = nodeStack.pop();
            en.addSon(en1); en1.setParent(en);
        }
        en.setCtx(ctx);
        nodeStack.push(en);
    }

    @Override
    public void exitCastExpression(MxStarParser.CastExpressionContext ctx) {
        super.exitCastExpression(ctx);
        ExpressionNode en;
        if (ctx.unaryExpression() != null) {
            en = (ExpressionNode) nodeStack.pop();
        } else /* 'DigitSequence' */ {
            en = new ConstantNode(Integer.valueOf(ctx.DigitSequence().getText()));
        }
        en.setCtx(ctx);
        nodeStack.push(en);
    }

    @Override
    public void exitMultiplicativeExpression(MxStarParser.MultiplicativeExpressionContext ctx) {
        super.exitMultiplicativeExpression(ctx);
        ExpressionNode en;
        if (ctx.getChildCount() == 1) {
            en = (ExpressionNode) nodeStack.pop();
        } else if (ctx.getChild(1).getText().equals("*")) {
            ASTBaseNode en2 = nodeStack.pop();
            ASTBaseNode en1 = nodeStack.pop();
            en = new MultiplyNode();
            en.addSon(en1); en1.setParent(en);
            en.addSon(en2); en2.setParent(en);
        } else if (ctx.getChild(1).getText().equals("/")) {
            ASTBaseNode en2 = nodeStack.pop();
            ASTBaseNode en1 = nodeStack.pop();
            en = new DivideNode();
            en.addSon(en1); en1.setParent(en);
            en.addSon(en2); en2.setParent(en);
        } else /* '%' */ {
            ASTBaseNode en2 = nodeStack.pop();
            ASTBaseNode en1 = nodeStack.pop();
            en = new ModuloNode();
            en.addSon(en1); en1.setParent(en);
            en.addSon(en2); en2.setParent(en);
        }
        en.setCtx(ctx);
        nodeStack.push(en);
    }

    @Override
    public void exitAdditiveExpression(MxStarParser.AdditiveExpressionContext ctx) {
        super.exitAdditiveExpression(ctx);
        ExpressionNode en;
        if (ctx.getChildCount() == 1) {
            en = (ExpressionNode) nodeStack.pop();
        } else if (ctx.getChild(1).getText().equals("+")) {
            ASTBaseNode en2 = nodeStack.pop();
            ASTBaseNode en1 = nodeStack.pop();
            en = new AddNode();
            en.addSon(en1); en1.setParent(en);
            en.addSon(en2); en2.setParent(en);
        } else /* '-' */ {
            ASTBaseNode en2 = nodeStack.pop();
            ASTBaseNode en1 = nodeStack.pop();
            en = new SubNode();
            en.addSon(en1); en1.setParent(en);
            en.addSon(en2); en2.setParent(en);
        }
        en.setCtx(ctx);
        nodeStack.push(en);
    }

    @Override
    public void exitShiftExpression(MxStarParser.ShiftExpressionContext ctx) {
        super.exitShiftExpression(ctx);
        ExpressionNode en;
        if (ctx.getChildCount() == 1) {
            en = (ExpressionNode) nodeStack.pop();
        } else if (ctx.getChild(1).getText().equals("<<")) {
            ASTBaseNode en2 = nodeStack.pop();
            ASTBaseNode en1 = nodeStack.pop();
            en = new ShiftLeftNode();
            en.addSon(en1); en1.setParent(en);
            en.addSon(en2); en2.setParent(en);
        } else /* '>>' */ {
            ASTBaseNode en2 = nodeStack.pop();
            ASTBaseNode en1 = nodeStack.pop();
            en = new ShiftRightNode();
            en.addSon(en1); en1.setParent(en);
            en.addSon(en2); en2.setParent(en);
        }
        en.setCtx(ctx);
        nodeStack.push(en);
    }

    @Override
    public void exitRelationalExpression(MxStarParser.RelationalExpressionContext ctx) {
        super.exitRelationalExpression(ctx);
        ExpressionNode en;
        if (ctx.getChildCount() == 1) {
            en = (ExpressionNode) nodeStack.pop();
        } else if (ctx.getChild(1).getText().equals("<")) {
            ASTBaseNode en2 = nodeStack.pop();
            ASTBaseNode en1 = nodeStack.pop();
            en = new LessThanNode();
            en.addSon(en1); en1.setParent(en);
            en.addSon(en2); en2.setParent(en);
        } else if (ctx.getChild(1).getText().equals("<=")) {
            ASTBaseNode en2 = nodeStack.pop();
            ASTBaseNode en1 = nodeStack.pop();
            en = new LessOrEqualThanNode();
            en.addSon(en1); en1.setParent(en);
            en.addSon(en2); en2.setParent(en);
        } else if (ctx.getChild(1).getText().equals(">")) {
            ASTBaseNode en2 = nodeStack.pop();
            ASTBaseNode en1 = nodeStack.pop();
            en = new GreaterThanNode();
            en.addSon(en1); en1.setParent(en);
            en.addSon(en2); en2.setParent(en);
        } else /* '>=' */ {
            ASTBaseNode en2 = nodeStack.pop();
            ASTBaseNode en1 = nodeStack.pop();
            en = new GreaterOrEqualThanNode();
            en.addSon(en1); en1.setParent(en);
            en.addSon(en2); en2.setParent(en);
        }
        en.setCtx(ctx);
        nodeStack.push(en);
    }

    @Override
    public void exitEqualityExpression(MxStarParser.EqualityExpressionContext ctx) {
        super.exitEqualityExpression(ctx);
        ExpressionNode en;
        if (ctx.getChildCount() == 1) {
            en = (ExpressionNode) nodeStack.pop();
        } else if (ctx.getChild(1).getText().equals("==")) {
            ASTBaseNode en2 = nodeStack.pop();
            ASTBaseNode en1 = nodeStack.pop();
            en = new EqualNode();
            en.addSon(en1); en1.setParent(en);
            en.addSon(en2); en2.setParent(en);
        } else /* '!=' */ {
            ASTBaseNode en2 = nodeStack.pop();
            ASTBaseNode en1 = nodeStack.pop();
            en = new InequalNode();
            en.addSon(en1); en1.setParent(en);
            en.addSon(en2); en2.setParent(en);
        }
        en.setCtx(ctx);
        nodeStack.push(en);
    }

    @Override
    public void exitAndExpression(MxStarParser.AndExpressionContext ctx) {
        super.exitAndExpression(ctx);
        ExpressionNode en;
        if (ctx.getChildCount() == 1) {
            en = (ExpressionNode) nodeStack.pop();
        } else /* '&' */ {
            ASTBaseNode en2 = nodeStack.pop();
            ASTBaseNode en1 = nodeStack.pop();
            en = new AndNode();
            en.addSon(en1); en1.setParent(en);
            en.addSon(en2); en2.setParent(en);
        }
        en.setCtx(ctx);
        nodeStack.push(en);
    }

    @Override
    public void exitExclusiveOrExpression(MxStarParser.ExclusiveOrExpressionContext ctx) {
        super.exitExclusiveOrExpression(ctx);
        ExpressionNode en;
        if (ctx.getChildCount() == 1) {
            en = (ExpressionNode) nodeStack.pop();
        } else /* '^' */ {
            ASTBaseNode en2 = nodeStack.pop();
            ASTBaseNode en1 = nodeStack.pop();
            en = new XorNode();
            en.addSon(en1); en1.setParent(en);
            en.addSon(en2); en2.setParent(en);
        }
        en.setCtx(ctx);
        nodeStack.push(en);
    }

    @Override
    public void exitInclusiveOrExpression(MxStarParser.InclusiveOrExpressionContext ctx) {
        super.exitInclusiveOrExpression(ctx);
        ExpressionNode en;
        if (ctx.getChildCount() == 1) {
            en = (ExpressionNode) nodeStack.pop();
        } else /* '|' */ {
            ASTBaseNode en2 = nodeStack.pop();
            ASTBaseNode en1 = nodeStack.pop();
            en = new OrNode();
            en.addSon(en1); en1.setParent(en);
            en.addSon(en2); en2.setParent(en);
        }
        en.setCtx(ctx);
        nodeStack.push(en);
    }

    @Override
    public void exitLogicalAndExpression(MxStarParser.LogicalAndExpressionContext ctx) {
        super.exitLogicalAndExpression(ctx);
        ExpressionNode en;
        if (ctx.getChildCount() == 1) {
            en = (ExpressionNode) nodeStack.pop();
        } else /* '&&' */ {
            ASTBaseNode en2 = nodeStack.pop();
            ASTBaseNode en1 = nodeStack.pop();
            en = new LogicalAndNode();
            en.addSon(en1); en1.setParent(en);
            en.addSon(en2); en2.setParent(en);
        }
        en.setCtx(ctx);
        nodeStack.push(en);
    }

    @Override
    public void exitLogicalOrExpression(MxStarParser.LogicalOrExpressionContext ctx) {
        super.exitLogicalOrExpression(ctx);
        ExpressionNode en;
        if (ctx.getChildCount() == 1) {
            en = (ExpressionNode) nodeStack.pop();
        } else /* '||' */ {
            ASTBaseNode en2 = nodeStack.pop();
            ASTBaseNode en1 = nodeStack.pop();
            en = new LogicalOrNode();
            en.addSon(en1); en1.setParent(en);
            en.addSon(en2); en2.setParent(en);
        }
        en.setCtx(ctx);
        nodeStack.push(en);
    }

    @Override
    public void exitExpression(MxStarParser.ExpressionContext ctx) {
        super.exitExpression(ctx);
        ExpressionNode en;
        if (ctx.newExpression() != null) {
            ASTBaseNode en2;
            if (ctx.newExpression().argumentExpressionList() != null) {
                en2 = nodeStack.pop();
            } else {
                en2 = new ArgumentTypeListNode();
            }
            ASTBaseNode en1 = nodeStack.pop();
            en = new NewNode();
            en.addSon(en1); en1.setParent(en);
            en.addSon(en2); en2.setParent(en);
        } else if (ctx.logicalOrExpression() != null) {
            en = (ExpressionNode) nodeStack.pop();
        } else if (ctx.unaryExpression() != null) {
            ASTBaseNode en2 = nodeStack.pop();
            ASTBaseNode en1 = nodeStack.pop();
            en = new AssignNode();
            en.addSon(en1); en1.setParent(en);
            en.addSon(en2); en2.setParent(en);
        } else /* 'DigitSequence' */ {
            en = new ConstantNode(Integer.valueOf(ctx.DigitSequence().getText()));
        }
        en.setCtx(ctx);
        nodeStack.push(en);
    }

    @Override
    public void exitDeclaration(MxStarParser.DeclarationContext ctx) {
        super.exitDeclaration(ctx);
        ASTBaseNode dn = new DeclarationNode();
        ASTBaseNode dln;
        if (ctx.initDeclaratorList() != null) {
            dln = nodeStack.pop();
        } else {
            dln = new DeclaratorListNode();
        }
        ASTBaseNode tn = nodeStack.pop();
        dn.addSon(tn); tn.setParent(dn);
        dn.addSon(dln); dln.setParent(dn);
        dn.setCtx(ctx);
        nodeStack.push(dn);
    }

    @Override
    public void exitDeclarationSpecifiers(MxStarParser.DeclarationSpecifiersContext ctx) {
        super.exitDeclarationSpecifiers(ctx);
        int cnt = ctx.getChildCount();
        TypeNode tn = new TypeNode();
        for (int i=0; i<cnt; ++i) {
            ASTBaseNode tan = nodeStack.pop();
            if (tan instanceof FuncAttributeNode) {
                tn.setInline(true);
            } else {
                tn.addSon(tan); tan.setParent(tn);
            }
        }
        tn.setCtx(ctx);
        nodeStack.push(tn);
    }

    @Override
    public void exitDeclarationSpecifier(MxStarParser.DeclarationSpecifierContext ctx) {
        super.exitDeclarationSpecifier(ctx);
        ASTBaseNode tan;
        if (ctx.typeSpecifier() != null) {
            tan = new TypeAttributeNode(ctx.typeSpecifier().getText());
        } else if (ctx.functionSpecifier() != null) {
            tan = new FuncAttributeNode(ctx.functionSpecifier().getText());
        } else /* '[]' */ {
            ASTBaseNode en = new EmptyExpressionNode(); // to support int[3][4][5]
            if (ctx.expression() != null) {
                en = nodeStack.pop();
            }
            tan = nodeStack.pop();
            ((TypeAttributeNode) tan).addPointerLevel();
            ((TypeAttributeNode) tan).addPointerExpression((ExpressionNode) en);
        }
        tan.setCtx(ctx);
        nodeStack.push(tan);
    }

    @Override
    public void exitInitDeclaratorList(MxStarParser.InitDeclaratorListContext ctx) {
        super.exitInitDeclaratorList(ctx);
        ASTBaseNode dln;
        ASTBaseNode dn = nodeStack.pop();
        if (ctx.initDeclaratorList() != null) {
            dln = nodeStack.pop();
        } else {
            dln = new DeclaratorListNode();
        }
        dln.addSon(dn); dn.setParent(dln);
        dln.setCtx(ctx);
        nodeStack.push(dln);
    }

    @Override
    public void exitInitDeclarator(MxStarParser.InitDeclaratorContext ctx) {
        super.exitInitDeclarator(ctx);
        ASTBaseNode idn = new InitDeclaratorNode();
        ASTBaseNode dn;
        ASTBaseNode en = null;
        if (ctx.expression() != null) {
            en = nodeStack.pop();
            ((InitDeclaratorNode) idn).setInitialized(true);
        } else {
            ((InitDeclaratorNode) idn).setInitialized(false);
        }
        dn = nodeStack.pop();
        idn.addSon(dn); dn.setParent(idn);
        if (en != null) {
            idn.addSon(en); en.setParent(idn);
        }
        idn.setCtx(ctx);
        nodeStack.push(idn);
    }

    @Override
    public void exitDeclarator(MxStarParser.DeclaratorContext ctx) {
        super.exitDeclarator(ctx);
        DeclaratorNode dn;
        if (ctx.Identifier() != null) {
            dn = new DeclaratorNode();
            dn.setIdentifier(ctx.Identifier().getText());
        } else if (ctx.getChild(0).getText().equals("(")) {
            dn = (DeclaratorNode) nodeStack.pop();
        } else /* parameterList */ {
            ASTBaseNode atln;
            if (ctx.parameterList() != null) {
                atln = nodeStack.pop();
            } else {
                atln = new ArgumentTypeListNode();
            }
            ASTBaseNode dn1 = nodeStack.pop();
            dn = new FuncDeclaratorNode();
            dn.addSon(dn1); dn1.setParent(dn);
            dn.addSon(atln); atln.setParent(dn);
        }
        dn.setCtx(ctx);
        nodeStack.push(dn);
    }

    @Override
    public void exitParameterList(MxStarParser.ParameterListContext ctx) {
        super.exitParameterList(ctx);
        ASTBaseNode atln;
        ASTBaseNode dn = nodeStack.pop();
        if (ctx.parameterList() != null) {
            atln = nodeStack.pop();
        } else {
            atln = new ArgumentTypeListNode();
        }
        atln.addSon(dn); dn.setParent(atln);
        atln.setCtx(ctx);
        nodeStack.push(atln);
    }

    @Override
    public void exitParameterDeclaration(MxStarParser.ParameterDeclarationContext ctx) {
        super.exitParameterDeclaration(ctx);
        ASTBaseNode adn = new ArgumentDeclarationNode();
        ASTBaseNode dn = nodeStack.pop();
        ASTBaseNode tn = nodeStack.pop();
        adn.addSon(tn); tn.setParent(adn);
        adn.addSon(dn); dn.setParent(adn);
        adn.setCtx(ctx);
        nodeStack.push(adn);
    }

    @Override
    public void exitCompoundStatement(MxStarParser.CompoundStatementContext ctx) {
        super.exitCompoundStatement(ctx);
        ASTBaseNode bn = new BlockNode();
        if (ctx.blockItemList() != null) {
            ASTBaseNode biln = nodeStack.pop();
            for (ASTBaseNode i:biln.getSons()) {
                bn.addSon(i); i.setParent(bn);
            }
        }
        bn.setCtx(ctx);
        nodeStack.push(bn);
    }

    @Override
    public void exitBlockItemList(MxStarParser.BlockItemListContext ctx) {
        super.exitBlockItemList(ctx);
        ASTBaseNode biln;
        ASTBaseNode bin = nodeStack.pop();
        if (ctx.blockItemList() != null) {
            biln = nodeStack.pop();
        } else {
            biln = new BlockItemListNode();
        }
        biln.addSon(bin); bin.setParent(biln);
        biln.setCtx(ctx);
        nodeStack.push(biln);
    }

    @Override
    public void exitExpressionStatement(MxStarParser.ExpressionStatementContext ctx) {
        super.exitExpressionStatement(ctx);
        StatementNode sn = new StatementNode();
        if (ctx.expression() != null) {
            ASTBaseNode en = nodeStack.pop();
            sn.addSon(en); en.setParent(sn);
        }
        sn.setCtx(ctx);
        nodeStack.push(sn);
    }

    @Override
    public void exitSelectionStatement(MxStarParser.SelectionStatementContext ctx) {
        super.exitSelectionStatement(ctx);
        IfNode sn = new IfNode();
        if (ctx.getChildCount() == 5) {
            ASTBaseNode sn1 = nodeStack.pop();
            ASTBaseNode en = nodeStack.pop();
            sn.addSon(en); en.setParent(sn);
            sn.addSon(sn1); sn1.setParent(sn);
            sn.setElseExist(false);
        } else /* 'else' */ {
            ASTBaseNode sn2 = nodeStack.pop();
            ASTBaseNode sn1 = nodeStack.pop();
            ASTBaseNode en = nodeStack.pop();
            sn.addSon(en); en.setParent(sn);
            sn.addSon(sn1); sn1.setParent(sn);
            sn.addSon(sn2); sn2.setParent(sn);
            sn.setElseExist(true);
        }
        sn.setCtx(ctx);
        nodeStack.push(sn);
    }

    @Override
    public void exitIterationStatement(MxStarParser.IterationStatementContext ctx) {
        super.exitIterationStatement(ctx);
        StatementNode sn;
        ASTBaseNode sn1 = nodeStack.pop();
        if (ctx.expression() != null) {
            sn = new WhileNode();
            ASTBaseNode en = nodeStack.pop();
            sn.addSon(en); en.setParent(sn);
            sn.addSon(sn1); sn1.setParent(sn);
        } else /* For */ {
            sn = new ForNode();
            ASTBaseNode fdn = nodeStack.pop();
            sn.addSon(fdn); fdn.setParent(sn);
            sn.addSon(sn1); sn1.setParent(sn);
        }
        sn.setCtx(ctx);
        nodeStack.push(sn);
    }

    @Override
    public void exitForCondition(MxStarParser.ForConditionContext ctx) {
        super.exitForCondition(ctx);
        ForConditionNode fcn = new ForConditionNode();
        int cnt = ctx.getChildCount();
        int mode = 0;
        for (int i=0; i<cnt; ++i) {
            if (ctx.getChild(i).getText().equals(";")) {
                ++mode;
            } else switch (mode) {
                case 0:
                    if (ctx.forDeclaration() != null) {
                        fcn.setDeclarationExist(true);
                    } else {
                        fcn.setE1Exist(true);
                    }
                    break;
                case 1:
                    fcn.setE2Exist(true);
                    break;
                case 2:
                    fcn.setE3Exist(true);
                    break;
            }
        }
        ASTBaseNode n1;
        ASTBaseNode n2;
        ASTBaseNode n3;
        if (fcn.isE3Exist()) n3 = nodeStack.pop(); else n3 = new ExpressionNode();
        if (fcn.isE2Exist()) n2 = nodeStack.pop(); else n2 = new ConstantNode(true);
        if (fcn.isDeclarationExist()) n1 = nodeStack.pop(); else {
            if (fcn.isE1Exist()) n1 = nodeStack.pop(); else {
                n1 = new ExpressionNode();
            }
        }
        fcn.addSon(n1); n1.setParent(fcn);
        fcn.addSon(n2); n2.setParent(fcn);
        fcn.addSon(n3); n3.setParent(fcn);
        fcn.setCtx(ctx);
        nodeStack.push(fcn);
    }

    @Override
    public void exitForDeclaration(MxStarParser.ForDeclarationContext ctx) {
        super.exitForDeclaration(ctx);
        // copy from exitDeclaration(...)
        ASTBaseNode dn = new DeclarationNode();
        ASTBaseNode dln;
        if (ctx.initDeclaratorList() != null) {
            dln = nodeStack.pop();
        } else {
            dln = new DeclaratorListNode();
        }
        ASTBaseNode tn = nodeStack.pop();
        dn.addSon(tn); tn.setParent(dn);
        dn.addSon(dln); dln.setParent(dn);
        dn.setCtx(ctx);
        nodeStack.push(dn);
    }

    @Override
    public void exitJumpStatement(MxStarParser.JumpStatementContext ctx) {
        super.exitJumpStatement(ctx);
        ASTBaseNode jn;
        switch (ctx.getChild(0).getText()) {
            case "continue":
                jn = new ContinueNode();
                break;
            case "break":
                jn = new BreakNode();
                break;
            default:
                /* return */

                jn = new ReturnNode();
                if (ctx.expression() != null) {
                    ASTBaseNode en = nodeStack.pop();
                    jn.addSon(en);
                    en.setParent(jn);
                }
                break;
        }
        jn.setCtx(ctx);
        nodeStack.push(jn);
    }

    @Override
    public void exitCompilationUnit(MxStarParser.CompilationUnitContext ctx) {
        super.exitCompilationUnit(ctx);
        ASTBaseNode cn = new CompilationNode();
        if (ctx.translationUnit() != null) {
            ASTBaseNode tn = nodeStack.pop();
            for (ASTBaseNode i:tn.getSons()) {
                cn.addSon(i); i.setParent(cn);
            }
        }
        cn.setCtx(ctx);
        nodeStack.push(cn);
    }

    @Override
    public void exitTranslationUnit(MxStarParser.TranslationUnitContext ctx) {
        super.exitTranslationUnit(ctx);
        ASTBaseNode tn;
        ASTBaseNode edn = null;
        if (!ctx.externalDeclaration().getChild(0).getText().equals(";")) {
            edn = nodeStack.pop();
        }
        if (ctx.translationUnit() != null) {
            tn = nodeStack.pop();
        } else {
            tn = new TranslationNode();
        }
        if (edn != null) {
            tn.addSon(edn); edn.setParent(tn);
        }
        tn.setCtx(ctx);
        nodeStack.push(tn);
    }

    @Override
    public void exitClassDefinition(MxStarParser.ClassDefinitionContext ctx) {
        super.exitClassDefinition(ctx);
        ClassDefinitionNode cdn = new ClassDefinitionNode();
        cdn.setIdentifier(ctx.Identifier().getText());
        if (ctx.classDeclarationList() != null) {
            ASTBaseNode cdln = nodeStack.pop();
            for (ASTBaseNode i : cdln.getSons()) {
                if (i instanceof FuncDefinitionNode)
                    ((FuncDefinitionNode) i).setFatherClass(ctx.Identifier().getText());
                cdn.addSon(i);
                i.setParent(cdn);
            }
        }
        cdn.setCtx(ctx);
        nodeStack.push(cdn);
    }

    @Override
    public void exitClassDeclarationList(MxStarParser.ClassDeclarationListContext ctx) {
        super.exitClassDeclarationList(ctx);
        ClassDeclarationListNode cdln;
        ASTBaseNode dn = nodeStack.pop();
        if (ctx.classDeclarationList() != null) {
            cdln = (ClassDeclarationListNode) nodeStack.pop();
        } else {
            cdln = new ClassDeclarationListNode();
        }
        cdln.addSon(dn); dn.setParent(cdln);
        cdln.setCtx(ctx);
        nodeStack.push(cdln);
    }

    @Override
    public void exitFunctionDefinition(MxStarParser.FunctionDefinitionContext ctx) {
        super.exitFunctionDefinition(ctx);
        FuncDefinitionNode fdn = new FuncDefinitionNode();
        ASTBaseNode csn = nodeStack.pop();
        ASTBaseNode dn = nodeStack.pop();
        ASTBaseNode dsn;
        if (ctx.declarationSpecifiers() != null) {
            dsn = nodeStack.pop();
        } else {
            dsn = new TypeNode();
        }
        fdn.addSon(dsn); dsn.setParent(fdn);
        fdn.addSon(dn); dn.setParent(fdn);
        fdn.addSon(csn); csn.setParent(fdn);
        fdn.setCtx(ctx);
        nodeStack.push(fdn);
    }

    @Override
    public void exitEveryRule(ParserRuleContext ctx) {
        super.enterEveryRule(ctx);
        if (ctx.exception != null) reportError(ctx, "Syntax", ctx.exception.getClass().getSimpleName());
    }

    public boolean isFailed() {
        return isFailed;
    }

    public void setFailed(boolean failed) {
        isFailed = failed;
    }
}
