// Generated from C:/Users/lxy98/IdeaProjects/MxStaro\MxStar.g4 by ANTLR 4.7
package cn.littleround;
import org.antlr.v4.runtime.tree.ParseTreeListener;

/**
 * This interface defines a complete listener for a parse tree produced by
 * {@link MxStarParser}.
 */
public interface MxStarListener extends ParseTreeListener {
	/**
	 * Enter a parse tree produced by {@link MxStarParser#primaryExpression}.
	 * @param ctx the parse tree
	 */
	void enterPrimaryExpression(MxStarParser.PrimaryExpressionContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxStarParser#primaryExpression}.
	 * @param ctx the parse tree
	 */
	void exitPrimaryExpression(MxStarParser.PrimaryExpressionContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxStarParser#postfixExpression}.
	 * @param ctx the parse tree
	 */
	void enterPostfixExpression(MxStarParser.PostfixExpressionContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxStarParser#postfixExpression}.
	 * @param ctx the parse tree
	 */
	void exitPostfixExpression(MxStarParser.PostfixExpressionContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxStarParser#argumentExpressionList}.
	 * @param ctx the parse tree
	 */
	void enterArgumentExpressionList(MxStarParser.ArgumentExpressionListContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxStarParser#argumentExpressionList}.
	 * @param ctx the parse tree
	 */
	void exitArgumentExpressionList(MxStarParser.ArgumentExpressionListContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxStarParser#unaryExpression}.
	 * @param ctx the parse tree
	 */
	void enterUnaryExpression(MxStarParser.UnaryExpressionContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxStarParser#unaryExpression}.
	 * @param ctx the parse tree
	 */
	void exitUnaryExpression(MxStarParser.UnaryExpressionContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxStarParser#unaryOperator}.
	 * @param ctx the parse tree
	 */
	void enterUnaryOperator(MxStarParser.UnaryOperatorContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxStarParser#unaryOperator}.
	 * @param ctx the parse tree
	 */
	void exitUnaryOperator(MxStarParser.UnaryOperatorContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxStarParser#castExpression}.
	 * @param ctx the parse tree
	 */
	void enterCastExpression(MxStarParser.CastExpressionContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxStarParser#castExpression}.
	 * @param ctx the parse tree
	 */
	void exitCastExpression(MxStarParser.CastExpressionContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxStarParser#multiplicativeExpression}.
	 * @param ctx the parse tree
	 */
	void enterMultiplicativeExpression(MxStarParser.MultiplicativeExpressionContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxStarParser#multiplicativeExpression}.
	 * @param ctx the parse tree
	 */
	void exitMultiplicativeExpression(MxStarParser.MultiplicativeExpressionContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxStarParser#additiveExpression}.
	 * @param ctx the parse tree
	 */
	void enterAdditiveExpression(MxStarParser.AdditiveExpressionContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxStarParser#additiveExpression}.
	 * @param ctx the parse tree
	 */
	void exitAdditiveExpression(MxStarParser.AdditiveExpressionContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxStarParser#shiftExpression}.
	 * @param ctx the parse tree
	 */
	void enterShiftExpression(MxStarParser.ShiftExpressionContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxStarParser#shiftExpression}.
	 * @param ctx the parse tree
	 */
	void exitShiftExpression(MxStarParser.ShiftExpressionContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxStarParser#relationalExpression}.
	 * @param ctx the parse tree
	 */
	void enterRelationalExpression(MxStarParser.RelationalExpressionContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxStarParser#relationalExpression}.
	 * @param ctx the parse tree
	 */
	void exitRelationalExpression(MxStarParser.RelationalExpressionContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxStarParser#equalityExpression}.
	 * @param ctx the parse tree
	 */
	void enterEqualityExpression(MxStarParser.EqualityExpressionContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxStarParser#equalityExpression}.
	 * @param ctx the parse tree
	 */
	void exitEqualityExpression(MxStarParser.EqualityExpressionContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxStarParser#andExpression}.
	 * @param ctx the parse tree
	 */
	void enterAndExpression(MxStarParser.AndExpressionContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxStarParser#andExpression}.
	 * @param ctx the parse tree
	 */
	void exitAndExpression(MxStarParser.AndExpressionContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxStarParser#exclusiveOrExpression}.
	 * @param ctx the parse tree
	 */
	void enterExclusiveOrExpression(MxStarParser.ExclusiveOrExpressionContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxStarParser#exclusiveOrExpression}.
	 * @param ctx the parse tree
	 */
	void exitExclusiveOrExpression(MxStarParser.ExclusiveOrExpressionContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxStarParser#inclusiveOrExpression}.
	 * @param ctx the parse tree
	 */
	void enterInclusiveOrExpression(MxStarParser.InclusiveOrExpressionContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxStarParser#inclusiveOrExpression}.
	 * @param ctx the parse tree
	 */
	void exitInclusiveOrExpression(MxStarParser.InclusiveOrExpressionContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxStarParser#logicalAndExpression}.
	 * @param ctx the parse tree
	 */
	void enterLogicalAndExpression(MxStarParser.LogicalAndExpressionContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxStarParser#logicalAndExpression}.
	 * @param ctx the parse tree
	 */
	void exitLogicalAndExpression(MxStarParser.LogicalAndExpressionContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxStarParser#logicalOrExpression}.
	 * @param ctx the parse tree
	 */
	void enterLogicalOrExpression(MxStarParser.LogicalOrExpressionContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxStarParser#logicalOrExpression}.
	 * @param ctx the parse tree
	 */
	void exitLogicalOrExpression(MxStarParser.LogicalOrExpressionContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxStarParser#expression}.
	 * @param ctx the parse tree
	 */
	void enterExpression(MxStarParser.ExpressionContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxStarParser#expression}.
	 * @param ctx the parse tree
	 */
	void exitExpression(MxStarParser.ExpressionContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxStarParser#declaration}.
	 * @param ctx the parse tree
	 */
	void enterDeclaration(MxStarParser.DeclarationContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxStarParser#declaration}.
	 * @param ctx the parse tree
	 */
	void exitDeclaration(MxStarParser.DeclarationContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxStarParser#declarationSpecifiers}.
	 * @param ctx the parse tree
	 */
	void enterDeclarationSpecifiers(MxStarParser.DeclarationSpecifiersContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxStarParser#declarationSpecifiers}.
	 * @param ctx the parse tree
	 */
	void exitDeclarationSpecifiers(MxStarParser.DeclarationSpecifiersContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxStarParser#declarationSpecifier}.
	 * @param ctx the parse tree
	 */
	void enterDeclarationSpecifier(MxStarParser.DeclarationSpecifierContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxStarParser#declarationSpecifier}.
	 * @param ctx the parse tree
	 */
	void exitDeclarationSpecifier(MxStarParser.DeclarationSpecifierContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxStarParser#initDeclaratorList}.
	 * @param ctx the parse tree
	 */
	void enterInitDeclaratorList(MxStarParser.InitDeclaratorListContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxStarParser#initDeclaratorList}.
	 * @param ctx the parse tree
	 */
	void exitInitDeclaratorList(MxStarParser.InitDeclaratorListContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxStarParser#initDeclarator}.
	 * @param ctx the parse tree
	 */
	void enterInitDeclarator(MxStarParser.InitDeclaratorContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxStarParser#initDeclarator}.
	 * @param ctx the parse tree
	 */
	void exitInitDeclarator(MxStarParser.InitDeclaratorContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxStarParser#typeSpecifier}.
	 * @param ctx the parse tree
	 */
	void enterTypeSpecifier(MxStarParser.TypeSpecifierContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxStarParser#typeSpecifier}.
	 * @param ctx the parse tree
	 */
	void exitTypeSpecifier(MxStarParser.TypeSpecifierContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxStarParser#functionSpecifier}.
	 * @param ctx the parse tree
	 */
	void enterFunctionSpecifier(MxStarParser.FunctionSpecifierContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxStarParser#functionSpecifier}.
	 * @param ctx the parse tree
	 */
	void exitFunctionSpecifier(MxStarParser.FunctionSpecifierContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxStarParser#declarator}.
	 * @param ctx the parse tree
	 */
	void enterDeclarator(MxStarParser.DeclaratorContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxStarParser#declarator}.
	 * @param ctx the parse tree
	 */
	void exitDeclarator(MxStarParser.DeclaratorContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxStarParser#nestedParenthesesBlock}.
	 * @param ctx the parse tree
	 */
	void enterNestedParenthesesBlock(MxStarParser.NestedParenthesesBlockContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxStarParser#nestedParenthesesBlock}.
	 * @param ctx the parse tree
	 */
	void exitNestedParenthesesBlock(MxStarParser.NestedParenthesesBlockContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxStarParser#parameterList}.
	 * @param ctx the parse tree
	 */
	void enterParameterList(MxStarParser.ParameterListContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxStarParser#parameterList}.
	 * @param ctx the parse tree
	 */
	void exitParameterList(MxStarParser.ParameterListContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxStarParser#parameterDeclaration}.
	 * @param ctx the parse tree
	 */
	void enterParameterDeclaration(MxStarParser.ParameterDeclarationContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxStarParser#parameterDeclaration}.
	 * @param ctx the parse tree
	 */
	void exitParameterDeclaration(MxStarParser.ParameterDeclarationContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxStarParser#identifierList}.
	 * @param ctx the parse tree
	 */
	void enterIdentifierList(MxStarParser.IdentifierListContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxStarParser#identifierList}.
	 * @param ctx the parse tree
	 */
	void exitIdentifierList(MxStarParser.IdentifierListContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxStarParser#typedefName}.
	 * @param ctx the parse tree
	 */
	void enterTypedefName(MxStarParser.TypedefNameContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxStarParser#typedefName}.
	 * @param ctx the parse tree
	 */
	void exitTypedefName(MxStarParser.TypedefNameContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxStarParser#statement}.
	 * @param ctx the parse tree
	 */
	void enterStatement(MxStarParser.StatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxStarParser#statement}.
	 * @param ctx the parse tree
	 */
	void exitStatement(MxStarParser.StatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxStarParser#compoundStatement}.
	 * @param ctx the parse tree
	 */
	void enterCompoundStatement(MxStarParser.CompoundStatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxStarParser#compoundStatement}.
	 * @param ctx the parse tree
	 */
	void exitCompoundStatement(MxStarParser.CompoundStatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxStarParser#blockItemList}.
	 * @param ctx the parse tree
	 */
	void enterBlockItemList(MxStarParser.BlockItemListContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxStarParser#blockItemList}.
	 * @param ctx the parse tree
	 */
	void exitBlockItemList(MxStarParser.BlockItemListContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxStarParser#blockItem}.
	 * @param ctx the parse tree
	 */
	void enterBlockItem(MxStarParser.BlockItemContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxStarParser#blockItem}.
	 * @param ctx the parse tree
	 */
	void exitBlockItem(MxStarParser.BlockItemContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxStarParser#expressionStatement}.
	 * @param ctx the parse tree
	 */
	void enterExpressionStatement(MxStarParser.ExpressionStatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxStarParser#expressionStatement}.
	 * @param ctx the parse tree
	 */
	void exitExpressionStatement(MxStarParser.ExpressionStatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxStarParser#selectionStatement}.
	 * @param ctx the parse tree
	 */
	void enterSelectionStatement(MxStarParser.SelectionStatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxStarParser#selectionStatement}.
	 * @param ctx the parse tree
	 */
	void exitSelectionStatement(MxStarParser.SelectionStatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxStarParser#iterationStatement}.
	 * @param ctx the parse tree
	 */
	void enterIterationStatement(MxStarParser.IterationStatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxStarParser#iterationStatement}.
	 * @param ctx the parse tree
	 */
	void exitIterationStatement(MxStarParser.IterationStatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxStarParser#forCondition}.
	 * @param ctx the parse tree
	 */
	void enterForCondition(MxStarParser.ForConditionContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxStarParser#forCondition}.
	 * @param ctx the parse tree
	 */
	void exitForCondition(MxStarParser.ForConditionContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxStarParser#forDeclaration}.
	 * @param ctx the parse tree
	 */
	void enterForDeclaration(MxStarParser.ForDeclarationContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxStarParser#forDeclaration}.
	 * @param ctx the parse tree
	 */
	void exitForDeclaration(MxStarParser.ForDeclarationContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxStarParser#forExpression}.
	 * @param ctx the parse tree
	 */
	void enterForExpression(MxStarParser.ForExpressionContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxStarParser#forExpression}.
	 * @param ctx the parse tree
	 */
	void exitForExpression(MxStarParser.ForExpressionContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxStarParser#jumpStatement}.
	 * @param ctx the parse tree
	 */
	void enterJumpStatement(MxStarParser.JumpStatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxStarParser#jumpStatement}.
	 * @param ctx the parse tree
	 */
	void exitJumpStatement(MxStarParser.JumpStatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxStarParser#compilationUnit}.
	 * @param ctx the parse tree
	 */
	void enterCompilationUnit(MxStarParser.CompilationUnitContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxStarParser#compilationUnit}.
	 * @param ctx the parse tree
	 */
	void exitCompilationUnit(MxStarParser.CompilationUnitContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxStarParser#translationUnit}.
	 * @param ctx the parse tree
	 */
	void enterTranslationUnit(MxStarParser.TranslationUnitContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxStarParser#translationUnit}.
	 * @param ctx the parse tree
	 */
	void exitTranslationUnit(MxStarParser.TranslationUnitContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxStarParser#externalDeclaration}.
	 * @param ctx the parse tree
	 */
	void enterExternalDeclaration(MxStarParser.ExternalDeclarationContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxStarParser#externalDeclaration}.
	 * @param ctx the parse tree
	 */
	void exitExternalDeclaration(MxStarParser.ExternalDeclarationContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxStarParser#classDefinition}.
	 * @param ctx the parse tree
	 */
	void enterClassDefinition(MxStarParser.ClassDefinitionContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxStarParser#classDefinition}.
	 * @param ctx the parse tree
	 */
	void exitClassDefinition(MxStarParser.ClassDefinitionContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxStarParser#classDeclarationList}.
	 * @param ctx the parse tree
	 */
	void enterClassDeclarationList(MxStarParser.ClassDeclarationListContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxStarParser#classDeclarationList}.
	 * @param ctx the parse tree
	 */
	void exitClassDeclarationList(MxStarParser.ClassDeclarationListContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxStarParser#classDeclaration}.
	 * @param ctx the parse tree
	 */
	void enterClassDeclaration(MxStarParser.ClassDeclarationContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxStarParser#classDeclaration}.
	 * @param ctx the parse tree
	 */
	void exitClassDeclaration(MxStarParser.ClassDeclarationContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxStarParser#functionDefinition}.
	 * @param ctx the parse tree
	 */
	void enterFunctionDefinition(MxStarParser.FunctionDefinitionContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxStarParser#functionDefinition}.
	 * @param ctx the parse tree
	 */
	void exitFunctionDefinition(MxStarParser.FunctionDefinitionContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxStarParser#declarationList}.
	 * @param ctx the parse tree
	 */
	void enterDeclarationList(MxStarParser.DeclarationListContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxStarParser#declarationList}.
	 * @param ctx the parse tree
	 */
	void exitDeclarationList(MxStarParser.DeclarationListContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxStarParser#newExpression}.
	 * @param ctx the parse tree
	 */
	void enterNewExpression(MxStarParser.NewExpressionContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxStarParser#newExpression}.
	 * @param ctx the parse tree
	 */
	void exitNewExpression(MxStarParser.NewExpressionContext ctx);
}