// Generated from C:/Users/lxy98/IdeaProjects/MxStaro\MxStar.g4 by ANTLR 4.7
package cn.littleround.antlr4_gen;
import org.antlr.v4.runtime.Lexer;
import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.Token;
import org.antlr.v4.runtime.TokenStream;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.atn.*;
import org.antlr.v4.runtime.dfa.DFA;
import org.antlr.v4.runtime.misc.*;

@SuppressWarnings({"all", "warnings", "unchecked", "unused", "cast"})
public class MxStarLexer extends Lexer {
	static { RuntimeMetaData.checkVersion("4.7", RuntimeMetaData.VERSION); }

	protected static final DFA[] _decisionToDFA;
	protected static final PredictionContextCache _sharedContextCache =
		new PredictionContextCache();
	public static final int
		Break=1, Char=2, Continue=3, Else=4, For=5, If=6, Inline=7, Int=8, String=9, 
		Return=10, Void=11, While=12, Class=13, New=14, This=15, True=16, False=17, 
		LeftParen=18, RightParen=19, LeftBracket=20, RightBracket=21, LeftBrace=22, 
		RightBrace=23, Less=24, LessEqual=25, Greater=26, GreaterEqual=27, LeftShift=28, 
		RightShift=29, Plus=30, PlusPlus=31, Minus=32, MinusMinus=33, Star=34, 
		Div=35, Mod=36, And=37, Or=38, AndAnd=39, OrOr=40, Caret=41, Not=42, Tilde=43, 
		Colon=44, Semi=45, Comma=46, Assign=47, Equal=48, NotEqual=49, Dot=50, 
		Identifier=51, BooleanConstant=52, Constant=53, DigitSequence=54, StringLiteral=55, 
		Whitespace=56, Newline=57, BlockComment=58, LineComment=59;
	public static String[] channelNames = {
		"DEFAULT_TOKEN_CHANNEL", "HIDDEN"
	};

	public static String[] modeNames = {
		"DEFAULT_MODE"
	};

	public static final String[] ruleNames = {
		"Break", "Char", "Continue", "Else", "For", "If", "Inline", "Int", "String", 
		"Return", "Void", "While", "Class", "New", "This", "True", "False", "LeftParen", 
		"RightParen", "LeftBracket", "RightBracket", "LeftBrace", "RightBrace", 
		"Less", "LessEqual", "Greater", "GreaterEqual", "LeftShift", "RightShift", 
		"Plus", "PlusPlus", "Minus", "MinusMinus", "Star", "Div", "Mod", "And", 
		"Or", "AndAnd", "OrOr", "Caret", "Not", "Tilde", "Colon", "Semi", "Comma", 
		"Assign", "Equal", "NotEqual", "Dot", "Identifier", "BooleanConstant", 
		"Nondigit", "Digit", "Constant", "IntegerConstant", "NonzeroDigit", "Sign", 
		"DigitSequence", "CharacterConstant", "CCharSequence", "CChar", "EscapeSequence", 
		"StringLiteral", "SCharSequence", "SChar", "Whitespace", "Newline", "BlockComment", 
		"LineComment"
	};

	private static final String[] _LITERAL_NAMES = {
		null, "'break'", "'char'", "'continue'", "'else'", "'for'", "'if'", "'inline'", 
		"'int'", "'string'", "'return'", "'void'", "'while'", "'class'", "'new'", 
		"'this'", "'true'", "'false'", "'('", "')'", "'['", "']'", "'{'", "'}'", 
		"'<'", "'<='", "'>'", "'>='", "'<<'", "'>>'", "'+'", "'++'", "'-'", "'--'", 
		"'*'", "'/'", "'%'", "'&'", "'|'", "'&&'", "'||'", "'^'", "'!'", "'~'", 
		"':'", "';'", "','", "'='", "'=='", "'!='", "'.'"
	};
	private static final String[] _SYMBOLIC_NAMES = {
		null, "Break", "Char", "Continue", "Else", "For", "If", "Inline", "Int", 
		"String", "Return", "Void", "While", "Class", "New", "This", "True", "False", 
		"LeftParen", "RightParen", "LeftBracket", "RightBracket", "LeftBrace", 
		"RightBrace", "Less", "LessEqual", "Greater", "GreaterEqual", "LeftShift", 
		"RightShift", "Plus", "PlusPlus", "Minus", "MinusMinus", "Star", "Div", 
		"Mod", "And", "Or", "AndAnd", "OrOr", "Caret", "Not", "Tilde", "Colon", 
		"Semi", "Comma", "Assign", "Equal", "NotEqual", "Dot", "Identifier", "BooleanConstant", 
		"Constant", "DigitSequence", "StringLiteral", "Whitespace", "Newline", 
		"BlockComment", "LineComment"
	};
	public static final Vocabulary VOCABULARY = new VocabularyImpl(_LITERAL_NAMES, _SYMBOLIC_NAMES);

	/**
	 * @deprecated Use {@link #VOCABULARY} instead.
	 */
	@Deprecated
	public static final String[] tokenNames;
	static {
		tokenNames = new String[_SYMBOLIC_NAMES.length];
		for (int i = 0; i < tokenNames.length; i++) {
			tokenNames[i] = VOCABULARY.getLiteralName(i);
			if (tokenNames[i] == null) {
				tokenNames[i] = VOCABULARY.getSymbolicName(i);
			}

			if (tokenNames[i] == null) {
				tokenNames[i] = "<INVALID>";
			}
		}
	}

	@Override
	@Deprecated
	public String[] getTokenNames() {
		return tokenNames;
	}

	@Override

	public Vocabulary getVocabulary() {
		return VOCABULARY;
	}


	public MxStarLexer(CharStream input) {
		super(input);
		_interp = new LexerATNSimulator(this,_ATN,_decisionToDFA,_sharedContextCache);
	}

	@Override
	public String getGrammarFileName() { return "MxStar.g4"; }

	@Override
	public String[] getRuleNames() { return ruleNames; }

	@Override
	public String getSerializedATN() { return _serializedATN; }

	@Override
	public String[] getChannelNames() { return channelNames; }

	@Override
	public String[] getModeNames() { return modeNames; }

	@Override
	public ATN getATN() { return _ATN; }

	public static final String _serializedATN =
		"\3\u608b\ua72a\u8133\ub9ed\u417c\u3be7\u7786\u5964\2=\u01aa\b\1\4\2\t"+
		"\2\4\3\t\3\4\4\t\4\4\5\t\5\4\6\t\6\4\7\t\7\4\b\t\b\4\t\t\t\4\n\t\n\4\13"+
		"\t\13\4\f\t\f\4\r\t\r\4\16\t\16\4\17\t\17\4\20\t\20\4\21\t\21\4\22\t\22"+
		"\4\23\t\23\4\24\t\24\4\25\t\25\4\26\t\26\4\27\t\27\4\30\t\30\4\31\t\31"+
		"\4\32\t\32\4\33\t\33\4\34\t\34\4\35\t\35\4\36\t\36\4\37\t\37\4 \t \4!"+
		"\t!\4\"\t\"\4#\t#\4$\t$\4%\t%\4&\t&\4\'\t\'\4(\t(\4)\t)\4*\t*\4+\t+\4"+
		",\t,\4-\t-\4.\t.\4/\t/\4\60\t\60\4\61\t\61\4\62\t\62\4\63\t\63\4\64\t"+
		"\64\4\65\t\65\4\66\t\66\4\67\t\67\48\t8\49\t9\4:\t:\4;\t;\4<\t<\4=\t="+
		"\4>\t>\4?\t?\4@\t@\4A\tA\4B\tB\4C\tC\4D\tD\4E\tE\4F\tF\4G\tG\3\2\3\2\3"+
		"\2\3\2\3\2\3\2\3\3\3\3\3\3\3\3\3\3\3\4\3\4\3\4\3\4\3\4\3\4\3\4\3\4\3\4"+
		"\3\5\3\5\3\5\3\5\3\5\3\6\3\6\3\6\3\6\3\7\3\7\3\7\3\b\3\b\3\b\3\b\3\b\3"+
		"\b\3\b\3\t\3\t\3\t\3\t\3\n\3\n\3\n\3\n\3\n\3\n\3\n\3\13\3\13\3\13\3\13"+
		"\3\13\3\13\3\13\3\f\3\f\3\f\3\f\3\f\3\r\3\r\3\r\3\r\3\r\3\r\3\16\3\16"+
		"\3\16\3\16\3\16\3\16\3\17\3\17\3\17\3\17\3\20\3\20\3\20\3\20\3\20\3\21"+
		"\3\21\3\21\3\21\3\21\3\22\3\22\3\22\3\22\3\22\3\22\3\23\3\23\3\24\3\24"+
		"\3\25\3\25\3\26\3\26\3\27\3\27\3\30\3\30\3\31\3\31\3\32\3\32\3\32\3\33"+
		"\3\33\3\34\3\34\3\34\3\35\3\35\3\35\3\36\3\36\3\36\3\37\3\37\3 \3 \3 "+
		"\3!\3!\3\"\3\"\3\"\3#\3#\3$\3$\3%\3%\3&\3&\3\'\3\'\3(\3(\3(\3)\3)\3)\3"+
		"*\3*\3+\3+\3,\3,\3-\3-\3.\3.\3/\3/\3\60\3\60\3\61\3\61\3\61\3\62\3\62"+
		"\3\62\3\63\3\63\3\64\3\64\3\64\7\64\u013d\n\64\f\64\16\64\u0140\13\64"+
		"\3\65\3\65\5\65\u0144\n\65\3\66\3\66\3\67\3\67\38\38\58\u014c\n8\39\3"+
		"9\79\u0150\n9\f9\169\u0153\139\3:\3:\3;\3;\3<\6<\u015a\n<\r<\16<\u015b"+
		"\3=\3=\3=\3=\3>\6>\u0163\n>\r>\16>\u0164\3?\3?\5?\u0169\n?\3@\3@\3@\3"+
		"A\3A\5A\u0170\nA\3A\3A\3B\6B\u0175\nB\rB\16B\u0176\3C\3C\3C\3C\3C\3C\3"+
		"C\5C\u0180\nC\3D\6D\u0183\nD\rD\16D\u0184\3D\3D\3E\3E\5E\u018b\nE\3E\5"+
		"E\u018e\nE\3E\3E\3F\3F\3F\3F\7F\u0196\nF\fF\16F\u0199\13F\3F\3F\3F\3F"+
		"\3F\3G\3G\3G\3G\7G\u01a4\nG\fG\16G\u01a7\13G\3G\3G\3\u0197\2H\3\3\5\4"+
		"\7\5\t\6\13\7\r\b\17\t\21\n\23\13\25\f\27\r\31\16\33\17\35\20\37\21!\22"+
		"#\23%\24\'\25)\26+\27-\30/\31\61\32\63\33\65\34\67\359\36;\37= ?!A\"C"+
		"#E$G%I&K\'M(O)Q*S+U,W-Y.[/]\60_\61a\62c\63e\64g\65i\66k\2m\2o\67q\2s\2"+
		"u\2w8y\2{\2}\2\177\2\u00819\u0083\2\u0085\2\u0087:\u0089;\u008b<\u008d"+
		"=\3\2\13\5\2C\\aac|\3\2\62;\3\2\63;\4\2--//\6\2\f\f\17\17))^^\f\2$$))"+
		"AA^^cdhhppttvvxx\6\2\f\f\17\17$$^^\4\2\13\13\"\"\4\2\f\f\17\17\2\u01b0"+
		"\2\3\3\2\2\2\2\5\3\2\2\2\2\7\3\2\2\2\2\t\3\2\2\2\2\13\3\2\2\2\2\r\3\2"+
		"\2\2\2\17\3\2\2\2\2\21\3\2\2\2\2\23\3\2\2\2\2\25\3\2\2\2\2\27\3\2\2\2"+
		"\2\31\3\2\2\2\2\33\3\2\2\2\2\35\3\2\2\2\2\37\3\2\2\2\2!\3\2\2\2\2#\3\2"+
		"\2\2\2%\3\2\2\2\2\'\3\2\2\2\2)\3\2\2\2\2+\3\2\2\2\2-\3\2\2\2\2/\3\2\2"+
		"\2\2\61\3\2\2\2\2\63\3\2\2\2\2\65\3\2\2\2\2\67\3\2\2\2\29\3\2\2\2\2;\3"+
		"\2\2\2\2=\3\2\2\2\2?\3\2\2\2\2A\3\2\2\2\2C\3\2\2\2\2E\3\2\2\2\2G\3\2\2"+
		"\2\2I\3\2\2\2\2K\3\2\2\2\2M\3\2\2\2\2O\3\2\2\2\2Q\3\2\2\2\2S\3\2\2\2\2"+
		"U\3\2\2\2\2W\3\2\2\2\2Y\3\2\2\2\2[\3\2\2\2\2]\3\2\2\2\2_\3\2\2\2\2a\3"+
		"\2\2\2\2c\3\2\2\2\2e\3\2\2\2\2g\3\2\2\2\2i\3\2\2\2\2o\3\2\2\2\2w\3\2\2"+
		"\2\2\u0081\3\2\2\2\2\u0087\3\2\2\2\2\u0089\3\2\2\2\2\u008b\3\2\2\2\2\u008d"+
		"\3\2\2\2\3\u008f\3\2\2\2\5\u0095\3\2\2\2\7\u009a\3\2\2\2\t\u00a3\3\2\2"+
		"\2\13\u00a8\3\2\2\2\r\u00ac\3\2\2\2\17\u00af\3\2\2\2\21\u00b6\3\2\2\2"+
		"\23\u00ba\3\2\2\2\25\u00c1\3\2\2\2\27\u00c8\3\2\2\2\31\u00cd\3\2\2\2\33"+
		"\u00d3\3\2\2\2\35\u00d9\3\2\2\2\37\u00dd\3\2\2\2!\u00e2\3\2\2\2#\u00e7"+
		"\3\2\2\2%\u00ed\3\2\2\2\'\u00ef\3\2\2\2)\u00f1\3\2\2\2+\u00f3\3\2\2\2"+
		"-\u00f5\3\2\2\2/\u00f7\3\2\2\2\61\u00f9\3\2\2\2\63\u00fb\3\2\2\2\65\u00fe"+
		"\3\2\2\2\67\u0100\3\2\2\29\u0103\3\2\2\2;\u0106\3\2\2\2=\u0109\3\2\2\2"+
		"?\u010b\3\2\2\2A\u010e\3\2\2\2C\u0110\3\2\2\2E\u0113\3\2\2\2G\u0115\3"+
		"\2\2\2I\u0117\3\2\2\2K\u0119\3\2\2\2M\u011b\3\2\2\2O\u011d\3\2\2\2Q\u0120"+
		"\3\2\2\2S\u0123\3\2\2\2U\u0125\3\2\2\2W\u0127\3\2\2\2Y\u0129\3\2\2\2["+
		"\u012b\3\2\2\2]\u012d\3\2\2\2_\u012f\3\2\2\2a\u0131\3\2\2\2c\u0134\3\2"+
		"\2\2e\u0137\3\2\2\2g\u0139\3\2\2\2i\u0143\3\2\2\2k\u0145\3\2\2\2m\u0147"+
		"\3\2\2\2o\u014b\3\2\2\2q\u014d\3\2\2\2s\u0154\3\2\2\2u\u0156\3\2\2\2w"+
		"\u0159\3\2\2\2y\u015d\3\2\2\2{\u0162\3\2\2\2}\u0168\3\2\2\2\177\u016a"+
		"\3\2\2\2\u0081\u016d\3\2\2\2\u0083\u0174\3\2\2\2\u0085\u017f\3\2\2\2\u0087"+
		"\u0182\3\2\2\2\u0089\u018d\3\2\2\2\u008b\u0191\3\2\2\2\u008d\u019f\3\2"+
		"\2\2\u008f\u0090\7d\2\2\u0090\u0091\7t\2\2\u0091\u0092\7g\2\2\u0092\u0093"+
		"\7c\2\2\u0093\u0094\7m\2\2\u0094\4\3\2\2\2\u0095\u0096\7e\2\2\u0096\u0097"+
		"\7j\2\2\u0097\u0098\7c\2\2\u0098\u0099\7t\2\2\u0099\6\3\2\2\2\u009a\u009b"+
		"\7e\2\2\u009b\u009c\7q\2\2\u009c\u009d\7p\2\2\u009d\u009e\7v\2\2\u009e"+
		"\u009f\7k\2\2\u009f\u00a0\7p\2\2\u00a0\u00a1\7w\2\2\u00a1\u00a2\7g\2\2"+
		"\u00a2\b\3\2\2\2\u00a3\u00a4\7g\2\2\u00a4\u00a5\7n\2\2\u00a5\u00a6\7u"+
		"\2\2\u00a6\u00a7\7g\2\2\u00a7\n\3\2\2\2\u00a8\u00a9\7h\2\2\u00a9\u00aa"+
		"\7q\2\2\u00aa\u00ab\7t\2\2\u00ab\f\3\2\2\2\u00ac\u00ad\7k\2\2\u00ad\u00ae"+
		"\7h\2\2\u00ae\16\3\2\2\2\u00af\u00b0\7k\2\2\u00b0\u00b1\7p\2\2\u00b1\u00b2"+
		"\7n\2\2\u00b2\u00b3\7k\2\2\u00b3\u00b4\7p\2\2\u00b4\u00b5\7g\2\2\u00b5"+
		"\20\3\2\2\2\u00b6\u00b7\7k\2\2\u00b7\u00b8\7p\2\2\u00b8\u00b9\7v\2\2\u00b9"+
		"\22\3\2\2\2\u00ba\u00bb\7u\2\2\u00bb\u00bc\7v\2\2\u00bc\u00bd\7t\2\2\u00bd"+
		"\u00be\7k\2\2\u00be\u00bf\7p\2\2\u00bf\u00c0\7i\2\2\u00c0\24\3\2\2\2\u00c1"+
		"\u00c2\7t\2\2\u00c2\u00c3\7g\2\2\u00c3\u00c4\7v\2\2\u00c4\u00c5\7w\2\2"+
		"\u00c5\u00c6\7t\2\2\u00c6\u00c7\7p\2\2\u00c7\26\3\2\2\2\u00c8\u00c9\7"+
		"x\2\2\u00c9\u00ca\7q\2\2\u00ca\u00cb\7k\2\2\u00cb\u00cc\7f\2\2\u00cc\30"+
		"\3\2\2\2\u00cd\u00ce\7y\2\2\u00ce\u00cf\7j\2\2\u00cf\u00d0\7k\2\2\u00d0"+
		"\u00d1\7n\2\2\u00d1\u00d2\7g\2\2\u00d2\32\3\2\2\2\u00d3\u00d4\7e\2\2\u00d4"+
		"\u00d5\7n\2\2\u00d5\u00d6\7c\2\2\u00d6\u00d7\7u\2\2\u00d7\u00d8\7u\2\2"+
		"\u00d8\34\3\2\2\2\u00d9\u00da\7p\2\2\u00da\u00db\7g\2\2\u00db\u00dc\7"+
		"y\2\2\u00dc\36\3\2\2\2\u00dd\u00de\7v\2\2\u00de\u00df\7j\2\2\u00df\u00e0"+
		"\7k\2\2\u00e0\u00e1\7u\2\2\u00e1 \3\2\2\2\u00e2\u00e3\7v\2\2\u00e3\u00e4"+
		"\7t\2\2\u00e4\u00e5\7w\2\2\u00e5\u00e6\7g\2\2\u00e6\"\3\2\2\2\u00e7\u00e8"+
		"\7h\2\2\u00e8\u00e9\7c\2\2\u00e9\u00ea\7n\2\2\u00ea\u00eb\7u\2\2\u00eb"+
		"\u00ec\7g\2\2\u00ec$\3\2\2\2\u00ed\u00ee\7*\2\2\u00ee&\3\2\2\2\u00ef\u00f0"+
		"\7+\2\2\u00f0(\3\2\2\2\u00f1\u00f2\7]\2\2\u00f2*\3\2\2\2\u00f3\u00f4\7"+
		"_\2\2\u00f4,\3\2\2\2\u00f5\u00f6\7}\2\2\u00f6.\3\2\2\2\u00f7\u00f8\7\177"+
		"\2\2\u00f8\60\3\2\2\2\u00f9\u00fa\7>\2\2\u00fa\62\3\2\2\2\u00fb\u00fc"+
		"\7>\2\2\u00fc\u00fd\7?\2\2\u00fd\64\3\2\2\2\u00fe\u00ff\7@\2\2\u00ff\66"+
		"\3\2\2\2\u0100\u0101\7@\2\2\u0101\u0102\7?\2\2\u01028\3\2\2\2\u0103\u0104"+
		"\7>\2\2\u0104\u0105\7>\2\2\u0105:\3\2\2\2\u0106\u0107\7@\2\2\u0107\u0108"+
		"\7@\2\2\u0108<\3\2\2\2\u0109\u010a\7-\2\2\u010a>\3\2\2\2\u010b\u010c\7"+
		"-\2\2\u010c\u010d\7-\2\2\u010d@\3\2\2\2\u010e\u010f\7/\2\2\u010fB\3\2"+
		"\2\2\u0110\u0111\7/\2\2\u0111\u0112\7/\2\2\u0112D\3\2\2\2\u0113\u0114"+
		"\7,\2\2\u0114F\3\2\2\2\u0115\u0116\7\61\2\2\u0116H\3\2\2\2\u0117\u0118"+
		"\7\'\2\2\u0118J\3\2\2\2\u0119\u011a\7(\2\2\u011aL\3\2\2\2\u011b\u011c"+
		"\7~\2\2\u011cN\3\2\2\2\u011d\u011e\7(\2\2\u011e\u011f\7(\2\2\u011fP\3"+
		"\2\2\2\u0120\u0121\7~\2\2\u0121\u0122\7~\2\2\u0122R\3\2\2\2\u0123\u0124"+
		"\7`\2\2\u0124T\3\2\2\2\u0125\u0126\7#\2\2\u0126V\3\2\2\2\u0127\u0128\7"+
		"\u0080\2\2\u0128X\3\2\2\2\u0129\u012a\7<\2\2\u012aZ\3\2\2\2\u012b\u012c"+
		"\7=\2\2\u012c\\\3\2\2\2\u012d\u012e\7.\2\2\u012e^\3\2\2\2\u012f\u0130"+
		"\7?\2\2\u0130`\3\2\2\2\u0131\u0132\7?\2\2\u0132\u0133\7?\2\2\u0133b\3"+
		"\2\2\2\u0134\u0135\7#\2\2\u0135\u0136\7?\2\2\u0136d\3\2\2\2\u0137\u0138"+
		"\7\60\2\2\u0138f\3\2\2\2\u0139\u013e\5k\66\2\u013a\u013d\5k\66\2\u013b"+
		"\u013d\5m\67\2\u013c\u013a\3\2\2\2\u013c\u013b\3\2\2\2\u013d\u0140\3\2"+
		"\2\2\u013e\u013c\3\2\2\2\u013e\u013f\3\2\2\2\u013fh\3\2\2\2\u0140\u013e"+
		"\3\2\2\2\u0141\u0144\5!\21\2\u0142\u0144\5#\22\2\u0143\u0141\3\2\2\2\u0143"+
		"\u0142\3\2\2\2\u0144j\3\2\2\2\u0145\u0146\t\2\2\2\u0146l\3\2\2\2\u0147"+
		"\u0148\t\3\2\2\u0148n\3\2\2\2\u0149\u014c\5q9\2\u014a\u014c\5i\65\2\u014b"+
		"\u0149\3\2\2\2\u014b\u014a\3\2\2\2\u014cp\3\2\2\2\u014d\u0151\5s:\2\u014e"+
		"\u0150\5m\67\2\u014f\u014e\3\2\2\2\u0150\u0153\3\2\2\2\u0151\u014f\3\2"+
		"\2\2\u0151\u0152\3\2\2\2\u0152r\3\2\2\2\u0153\u0151\3\2\2\2\u0154\u0155"+
		"\t\4\2\2\u0155t\3\2\2\2\u0156\u0157\t\5\2\2\u0157v\3\2\2\2\u0158\u015a"+
		"\5m\67\2\u0159\u0158\3\2\2\2\u015a\u015b\3\2\2\2\u015b\u0159\3\2\2\2\u015b"+
		"\u015c\3\2\2\2\u015cx\3\2\2\2\u015d\u015e\7)\2\2\u015e\u015f\5{>\2\u015f"+
		"\u0160\7)\2\2\u0160z\3\2\2\2\u0161\u0163\5}?\2\u0162\u0161\3\2\2\2\u0163"+
		"\u0164\3\2\2\2\u0164\u0162\3\2\2\2\u0164\u0165\3\2\2\2\u0165|\3\2\2\2"+
		"\u0166\u0169\n\6\2\2\u0167\u0169\5\177@\2\u0168\u0166\3\2\2\2\u0168\u0167"+
		"\3\2\2\2\u0169~\3\2\2\2\u016a\u016b\7^\2\2\u016b\u016c\t\7\2\2\u016c\u0080"+
		"\3\2\2\2\u016d\u016f\7$\2\2\u016e\u0170\5\u0083B\2\u016f\u016e\3\2\2\2"+
		"\u016f\u0170\3\2\2\2\u0170\u0171\3\2\2\2\u0171\u0172\7$\2\2\u0172\u0082"+
		"\3\2\2\2\u0173\u0175\5\u0085C\2\u0174\u0173\3\2\2\2\u0175\u0176\3\2\2"+
		"\2\u0176\u0174\3\2\2\2\u0176\u0177\3\2\2\2\u0177\u0084\3\2\2\2\u0178\u0180"+
		"\n\b\2\2\u0179\u0180\5\177@\2\u017a\u017b\7^\2\2\u017b\u0180\7\f\2\2\u017c"+
		"\u017d\7^\2\2\u017d\u017e\7\17\2\2\u017e\u0180\7\f\2\2\u017f\u0178\3\2"+
		"\2\2\u017f\u0179\3\2\2\2\u017f\u017a\3\2\2\2\u017f\u017c\3\2\2\2\u0180"+
		"\u0086\3\2\2\2\u0181\u0183\t\t\2\2\u0182\u0181\3\2\2\2\u0183\u0184\3\2"+
		"\2\2\u0184\u0182\3\2\2\2\u0184\u0185\3\2\2\2\u0185\u0186\3\2\2\2\u0186"+
		"\u0187\bD\2\2\u0187\u0088\3\2\2\2\u0188\u018a\7\17\2\2\u0189\u018b\7\f"+
		"\2\2\u018a\u0189\3\2\2\2\u018a\u018b\3\2\2\2\u018b\u018e\3\2\2\2\u018c"+
		"\u018e\7\f\2\2\u018d\u0188\3\2\2\2\u018d\u018c\3\2\2\2\u018e\u018f\3\2"+
		"\2\2\u018f\u0190\bE\2\2\u0190\u008a\3\2\2\2\u0191\u0192\7\61\2\2\u0192"+
		"\u0193\7,\2\2\u0193\u0197\3\2\2\2\u0194\u0196\13\2\2\2\u0195\u0194\3\2"+
		"\2\2\u0196\u0199\3\2\2\2\u0197\u0198\3\2\2\2\u0197\u0195\3\2\2\2\u0198"+
		"\u019a\3\2\2\2\u0199\u0197\3\2\2\2\u019a\u019b\7,\2\2\u019b\u019c\7\61"+
		"\2\2\u019c\u019d\3\2\2\2\u019d\u019e\bF\2\2\u019e\u008c\3\2\2\2\u019f"+
		"\u01a0\7\61\2\2\u01a0\u01a1\7\61\2\2\u01a1\u01a5\3\2\2\2\u01a2\u01a4\n"+
		"\n\2\2\u01a3\u01a2\3\2\2\2\u01a4\u01a7\3\2\2\2\u01a5\u01a3\3\2\2\2\u01a5"+
		"\u01a6\3\2\2\2\u01a6\u01a8\3\2\2\2\u01a7\u01a5\3\2\2\2\u01a8\u01a9\bG"+
		"\2\2\u01a9\u008e\3\2\2\2\23\2\u013c\u013e\u0143\u014b\u0151\u015b\u0164"+
		"\u0168\u016f\u0176\u017f\u0184\u018a\u018d\u0197\u01a5\3\b\2\2";
	public static final ATN _ATN =
		new ATNDeserializer().deserialize(_serializedATN.toCharArray());
	static {
		_decisionToDFA = new DFA[_ATN.getNumberOfDecisions()];
		for (int i = 0; i < _ATN.getNumberOfDecisions(); i++) {
			_decisionToDFA[i] = new DFA(_ATN.getDecisionState(i), i);
		}
	}
}