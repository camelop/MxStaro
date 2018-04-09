// Generated from C:/Users/lxy98/IdeaProjects/MxStaro\MxStar.g4 by ANTLR 4.7
package cn.littleround;
import org.antlr.v4.runtime.tree.ParseTreeVisitor;

/**
 * This interface defines a complete generic visitor for a parse tree produced
 * by {@link MxStarParser}.
 *
 * @param <T> The return type of the visit operation. Use {@link Void} for
 * operations with no return type.
 */
public interface MxStarVisitor<T> extends ParseTreeVisitor<T> {
	/**
	 * Visit a parse tree produced by {@link MxStarParser#primaryExpression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitPrimaryExpression(MxStarParser.PrimaryExpressionContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxStarParser#postfixExpression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitPostfixExpression(MxStarParser.PostfixExpressionContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxStarParser#argumentExpressionList}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitArgumentExpressionList(MxStarParser.ArgumentExpressionListContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxStarParser#unaryExpression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitUnaryExpression(MxStarParser.UnaryExpressionContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxStarParser#unaryOperator}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitUnaryOperator(MxStarParser.UnaryOperatorContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxStarParser#castExpression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitCastExpression(MxStarParser.CastExpressionContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxStarParser#multiplicativeExpression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitMultiplicativeExpression(MxStarParser.MultiplicativeExpressionContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxStarParser#additiveExpression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitAdditiveExpression(MxStarParser.AdditiveExpressionContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxStarParser#shiftExpression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitShiftExpression(MxStarParser.ShiftExpressionContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxStarParser#relationalExpression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitRelationalExpression(MxStarParser.RelationalExpressionContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxStarParser#equalityExpression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitEqualityExpression(MxStarParser.EqualityExpressionContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxStarParser#andExpression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitAndExpression(MxStarParser.AndExpressionContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxStarParser#exclusiveOrExpression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitExclusiveOrExpression(MxStarParser.ExclusiveOrExpressionContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxStarParser#inclusiveOrExpression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitInclusiveOrExpression(MxStarParser.InclusiveOrExpressionContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxStarParser#logicalAndExpression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitLogicalAndExpression(MxStarParser.LogicalAndExpressionContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxStarParser#logicalOrExpression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitLogicalOrExpression(MxStarParser.LogicalOrExpressionContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxStarParser#expression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitExpression(MxStarParser.ExpressionContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxStarParser#declaration}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitDeclaration(MxStarParser.DeclarationContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxStarParser#declarationSpecifiers}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitDeclarationSpecifiers(MxStarParser.DeclarationSpecifiersContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxStarParser#declarationSpecifier}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitDeclarationSpecifier(MxStarParser.DeclarationSpecifierContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxStarParser#initDeclaratorList}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitInitDeclaratorList(MxStarParser.InitDeclaratorListContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxStarParser#initDeclarator}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitInitDeclarator(MxStarParser.InitDeclaratorContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxStarParser#typeSpecifier}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitTypeSpecifier(MxStarParser.TypeSpecifierContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxStarParser#functionSpecifier}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitFunctionSpecifier(MxStarParser.FunctionSpecifierContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxStarParser#declarator}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitDeclarator(MxStarParser.DeclaratorContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxStarParser#nestedParenthesesBlock}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitNestedParenthesesBlock(MxStarParser.NestedParenthesesBlockContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxStarParser#parameterList}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitParameterList(MxStarParser.ParameterListContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxStarParser#parameterDeclaration}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitParameterDeclaration(MxStarParser.ParameterDeclarationContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxStarParser#identifierList}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitIdentifierList(MxStarParser.IdentifierListContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxStarParser#typedefName}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitTypedefName(MxStarParser.TypedefNameContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxStarParser#statement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitStatement(MxStarParser.StatementContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxStarParser#compoundStatement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitCompoundStatement(MxStarParser.CompoundStatementContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxStarParser#blockItemList}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitBlockItemList(MxStarParser.BlockItemListContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxStarParser#blockItem}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitBlockItem(MxStarParser.BlockItemContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxStarParser#expressionStatement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitExpressionStatement(MxStarParser.ExpressionStatementContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxStarParser#selectionStatement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitSelectionStatement(MxStarParser.SelectionStatementContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxStarParser#iterationStatement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitIterationStatement(MxStarParser.IterationStatementContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxStarParser#forCondition}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitForCondition(MxStarParser.ForConditionContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxStarParser#forDeclaration}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitForDeclaration(MxStarParser.ForDeclarationContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxStarParser#forExpression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitForExpression(MxStarParser.ForExpressionContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxStarParser#jumpStatement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitJumpStatement(MxStarParser.JumpStatementContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxStarParser#compilationUnit}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitCompilationUnit(MxStarParser.CompilationUnitContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxStarParser#translationUnit}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitTranslationUnit(MxStarParser.TranslationUnitContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxStarParser#externalDeclaration}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitExternalDeclaration(MxStarParser.ExternalDeclarationContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxStarParser#classDefinition}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitClassDefinition(MxStarParser.ClassDefinitionContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxStarParser#classDeclarationList}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitClassDeclarationList(MxStarParser.ClassDeclarationListContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxStarParser#classDeclaration}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitClassDeclaration(MxStarParser.ClassDeclarationContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxStarParser#functionDefinition}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitFunctionDefinition(MxStarParser.FunctionDefinitionContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxStarParser#declarationList}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitDeclarationList(MxStarParser.DeclarationListContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxStarParser#newExpression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitNewExpression(MxStarParser.NewExpressionContext ctx);
}