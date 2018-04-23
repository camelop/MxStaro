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
		Break=1, Continue=2, Else=3, For=4, If=5, Inline=6, Int=7, String=8, Return=9, 
		Void=10, While=11, Class=12, New=13, This=14, LeftParen=15, RightParen=16, 
		LeftBracket=17, RightBracket=18, LeftBrace=19, RightBrace=20, Less=21, 
		LessEqual=22, Greater=23, GreaterEqual=24, LeftShift=25, RightShift=26, 
		Plus=27, PlusPlus=28, Minus=29, MinusMinus=30, Star=31, Div=32, Mod=33, 
		And=34, Or=35, AndAnd=36, OrOr=37, Caret=38, Not=39, Tilde=40, Colon=41, 
		Semi=42, Comma=43, Assign=44, Equal=45, NotEqual=46, Dot=47, True=48, 
		False=49, Null=50, Identifier=51, Constant=52, DigitSequence=53, StringLiteral=54, 
		Whitespace=55, Newline=56, BlockComment=57, LineComment=58;
	public static String[] channelNames = {
		"DEFAULT_TOKEN_CHANNEL", "HIDDEN"
	};

	public static String[] modeNames = {
		"DEFAULT_MODE"
	};

	public static final String[] ruleNames = {
		"Break", "Continue", "Else", "For", "If", "Inline", "Int", "String", "Return", 
		"Void", "While", "Class", "New", "This", "LeftParen", "RightParen", "LeftBracket", 
		"RightBracket", "LeftBrace", "RightBrace", "Less", "LessEqual", "Greater", 
		"GreaterEqual", "LeftShift", "RightShift", "Plus", "PlusPlus", "Minus", 
		"MinusMinus", "Star", "Div", "Mod", "And", "Or", "AndAnd", "OrOr", "Caret", 
		"Not", "Tilde", "Colon", "Semi", "Comma", "Assign", "Equal", "NotEqual", 
		"Dot", "True", "False", "Null", "Identifier", "Nondigit", "Digit", "Constant", 
		"IntegerConstant", "NonzeroDigit", "Sign", "DigitSequence", "CharacterConstant", 
		"CCharSequence", "CChar", "EscapeSequence", "StringLiteral", "SCharSequence", 
		"SChar", "Whitespace", "Newline", "BlockComment", "LineComment"
	};

	private static final String[] _LITERAL_NAMES = {
		null, "'break'", "'continue'", "'else'", "'for'", "'if'", "'inline'", 
		"'int'", "'string'", "'return'", "'void'", "'while'", "'class'", "'new'", 
		"'this'", "'('", "')'", "'['", "']'", "'{'", "'}'", "'<'", "'<='", "'>'", 
		"'>='", "'<<'", "'>>'", "'+'", "'++'", "'-'", "'--'", "'*'", "'/'", "'%'", 
		"'&'", "'|'", "'&&'", "'||'", "'^'", "'!'", "'~'", "':'", "';'", "','", 
		"'='", "'=='", "'!='", "'.'", "'true'", "'false'", "'null'"
	};
	private static final String[] _SYMBOLIC_NAMES = {
		null, "Break", "Continue", "Else", "For", "If", "Inline", "Int", "String", 
		"Return", "Void", "While", "Class", "New", "This", "LeftParen", "RightParen", 
		"LeftBracket", "RightBracket", "LeftBrace", "RightBrace", "Less", "LessEqual", 
		"Greater", "GreaterEqual", "LeftShift", "RightShift", "Plus", "PlusPlus", 
		"Minus", "MinusMinus", "Star", "Div", "Mod", "And", "Or", "AndAnd", "OrOr", 
		"Caret", "Not", "Tilde", "Colon", "Semi", "Comma", "Assign", "Equal", 
		"NotEqual", "Dot", "True", "False", "Null", "Identifier", "Constant", 
		"DigitSequence", "StringLiteral", "Whitespace", "Newline", "BlockComment", 
		"LineComment"
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
		"\3\u608b\ua72a\u8133\ub9ed\u417c\u3be7\u7786\u5964\2<\u01a4\b\1\4\2\t"+
		"\2\4\3\t\3\4\4\t\4\4\5\t\5\4\6\t\6\4\7\t\7\4\b\t\b\4\t\t\t\4\n\t\n\4\13"+
		"\t\13\4\f\t\f\4\r\t\r\4\16\t\16\4\17\t\17\4\20\t\20\4\21\t\21\4\22\t\22"+
		"\4\23\t\23\4\24\t\24\4\25\t\25\4\26\t\26\4\27\t\27\4\30\t\30\4\31\t\31"+
		"\4\32\t\32\4\33\t\33\4\34\t\34\4\35\t\35\4\36\t\36\4\37\t\37\4 \t \4!"+
		"\t!\4\"\t\"\4#\t#\4$\t$\4%\t%\4&\t&\4\'\t\'\4(\t(\4)\t)\4*\t*\4+\t+\4"+
		",\t,\4-\t-\4.\t.\4/\t/\4\60\t\60\4\61\t\61\4\62\t\62\4\63\t\63\4\64\t"+
		"\64\4\65\t\65\4\66\t\66\4\67\t\67\48\t8\49\t9\4:\t:\4;\t;\4<\t<\4=\t="+
		"\4>\t>\4?\t?\4@\t@\4A\tA\4B\tB\4C\tC\4D\tD\4E\tE\4F\tF\3\2\3\2\3\2\3\2"+
		"\3\2\3\2\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\4\3\4\3\4\3\4\3\4\3\5\3"+
		"\5\3\5\3\5\3\6\3\6\3\6\3\7\3\7\3\7\3\7\3\7\3\7\3\7\3\b\3\b\3\b\3\b\3\t"+
		"\3\t\3\t\3\t\3\t\3\t\3\t\3\n\3\n\3\n\3\n\3\n\3\n\3\n\3\13\3\13\3\13\3"+
		"\13\3\13\3\f\3\f\3\f\3\f\3\f\3\f\3\r\3\r\3\r\3\r\3\r\3\r\3\16\3\16\3\16"+
		"\3\16\3\17\3\17\3\17\3\17\3\17\3\20\3\20\3\21\3\21\3\22\3\22\3\23\3\23"+
		"\3\24\3\24\3\25\3\25\3\26\3\26\3\27\3\27\3\27\3\30\3\30\3\31\3\31\3\31"+
		"\3\32\3\32\3\32\3\33\3\33\3\33\3\34\3\34\3\35\3\35\3\35\3\36\3\36\3\37"+
		"\3\37\3\37\3 \3 \3!\3!\3\"\3\"\3#\3#\3$\3$\3%\3%\3%\3&\3&\3&\3\'\3\'\3"+
		"(\3(\3)\3)\3*\3*\3+\3+\3,\3,\3-\3-\3.\3.\3.\3/\3/\3/\3\60\3\60\3\61\3"+
		"\61\3\61\3\61\3\61\3\62\3\62\3\62\3\62\3\62\3\62\3\63\3\63\3\63\3\63\3"+
		"\63\3\64\3\64\3\64\7\64\u013b\n\64\f\64\16\64\u013e\13\64\3\65\3\65\3"+
		"\66\3\66\3\67\3\67\5\67\u0146\n\67\38\38\78\u014a\n8\f8\168\u014d\138"+
		"\39\39\3:\3:\3;\6;\u0154\n;\r;\16;\u0155\3<\3<\3<\3<\3=\6=\u015d\n=\r"+
		"=\16=\u015e\3>\3>\5>\u0163\n>\3?\3?\3?\3@\3@\5@\u016a\n@\3@\3@\3A\6A\u016f"+
		"\nA\rA\16A\u0170\3B\3B\3B\3B\3B\3B\3B\5B\u017a\nB\3C\6C\u017d\nC\rC\16"+
		"C\u017e\3C\3C\3D\3D\5D\u0185\nD\3D\5D\u0188\nD\3D\3D\3E\3E\3E\3E\7E\u0190"+
		"\nE\fE\16E\u0193\13E\3E\3E\3E\3E\3E\3F\3F\3F\3F\7F\u019e\nF\fF\16F\u01a1"+
		"\13F\3F\3F\3\u0191\2G\3\3\5\4\7\5\t\6\13\7\r\b\17\t\21\n\23\13\25\f\27"+
		"\r\31\16\33\17\35\20\37\21!\22#\23%\24\'\25)\26+\27-\30/\31\61\32\63\33"+
		"\65\34\67\359\36;\37= ?!A\"C#E$G%I&K\'M(O)Q*S+U,W-Y.[/]\60_\61a\62c\63"+
		"e\64g\65i\2k\2m\66o\2q\2s\2u\67w\2y\2{\2}\2\1778\u0081\2\u0083\2\u0085"+
		"9\u0087:\u0089;\u008b<\3\2\13\5\2C\\aac|\3\2\62;\3\2\63;\4\2--//\6\2\f"+
		"\f\17\17))^^\f\2$$))AA^^cdhhppttvvxx\6\2\f\f\17\17$$^^\4\2\13\13\"\"\4"+
		"\2\f\f\17\17\2\u01a9\2\3\3\2\2\2\2\5\3\2\2\2\2\7\3\2\2\2\2\t\3\2\2\2\2"+
		"\13\3\2\2\2\2\r\3\2\2\2\2\17\3\2\2\2\2\21\3\2\2\2\2\23\3\2\2\2\2\25\3"+
		"\2\2\2\2\27\3\2\2\2\2\31\3\2\2\2\2\33\3\2\2\2\2\35\3\2\2\2\2\37\3\2\2"+
		"\2\2!\3\2\2\2\2#\3\2\2\2\2%\3\2\2\2\2\'\3\2\2\2\2)\3\2\2\2\2+\3\2\2\2"+
		"\2-\3\2\2\2\2/\3\2\2\2\2\61\3\2\2\2\2\63\3\2\2\2\2\65\3\2\2\2\2\67\3\2"+
		"\2\2\29\3\2\2\2\2;\3\2\2\2\2=\3\2\2\2\2?\3\2\2\2\2A\3\2\2\2\2C\3\2\2\2"+
		"\2E\3\2\2\2\2G\3\2\2\2\2I\3\2\2\2\2K\3\2\2\2\2M\3\2\2\2\2O\3\2\2\2\2Q"+
		"\3\2\2\2\2S\3\2\2\2\2U\3\2\2\2\2W\3\2\2\2\2Y\3\2\2\2\2[\3\2\2\2\2]\3\2"+
		"\2\2\2_\3\2\2\2\2a\3\2\2\2\2c\3\2\2\2\2e\3\2\2\2\2g\3\2\2\2\2m\3\2\2\2"+
		"\2u\3\2\2\2\2\177\3\2\2\2\2\u0085\3\2\2\2\2\u0087\3\2\2\2\2\u0089\3\2"+
		"\2\2\2\u008b\3\2\2\2\3\u008d\3\2\2\2\5\u0093\3\2\2\2\7\u009c\3\2\2\2\t"+
		"\u00a1\3\2\2\2\13\u00a5\3\2\2\2\r\u00a8\3\2\2\2\17\u00af\3\2\2\2\21\u00b3"+
		"\3\2\2\2\23\u00ba\3\2\2\2\25\u00c1\3\2\2\2\27\u00c6\3\2\2\2\31\u00cc\3"+
		"\2\2\2\33\u00d2\3\2\2\2\35\u00d6\3\2\2\2\37\u00db\3\2\2\2!\u00dd\3\2\2"+
		"\2#\u00df\3\2\2\2%\u00e1\3\2\2\2\'\u00e3\3\2\2\2)\u00e5\3\2\2\2+\u00e7"+
		"\3\2\2\2-\u00e9\3\2\2\2/\u00ec\3\2\2\2\61\u00ee\3\2\2\2\63\u00f1\3\2\2"+
		"\2\65\u00f4\3\2\2\2\67\u00f7\3\2\2\29\u00f9\3\2\2\2;\u00fc\3\2\2\2=\u00fe"+
		"\3\2\2\2?\u0101\3\2\2\2A\u0103\3\2\2\2C\u0105\3\2\2\2E\u0107\3\2\2\2G"+
		"\u0109\3\2\2\2I\u010b\3\2\2\2K\u010e\3\2\2\2M\u0111\3\2\2\2O\u0113\3\2"+
		"\2\2Q\u0115\3\2\2\2S\u0117\3\2\2\2U\u0119\3\2\2\2W\u011b\3\2\2\2Y\u011d"+
		"\3\2\2\2[\u011f\3\2\2\2]\u0122\3\2\2\2_\u0125\3\2\2\2a\u0127\3\2\2\2c"+
		"\u012c\3\2\2\2e\u0132\3\2\2\2g\u0137\3\2\2\2i\u013f\3\2\2\2k\u0141\3\2"+
		"\2\2m\u0145\3\2\2\2o\u0147\3\2\2\2q\u014e\3\2\2\2s\u0150\3\2\2\2u\u0153"+
		"\3\2\2\2w\u0157\3\2\2\2y\u015c\3\2\2\2{\u0162\3\2\2\2}\u0164\3\2\2\2\177"+
		"\u0167\3\2\2\2\u0081\u016e\3\2\2\2\u0083\u0179\3\2\2\2\u0085\u017c\3\2"+
		"\2\2\u0087\u0187\3\2\2\2\u0089\u018b\3\2\2\2\u008b\u0199\3\2\2\2\u008d"+
		"\u008e\7d\2\2\u008e\u008f\7t\2\2\u008f\u0090\7g\2\2\u0090\u0091\7c\2\2"+
		"\u0091\u0092\7m\2\2\u0092\4\3\2\2\2\u0093\u0094\7e\2\2\u0094\u0095\7q"+
		"\2\2\u0095\u0096\7p\2\2\u0096\u0097\7v\2\2\u0097\u0098\7k\2\2\u0098\u0099"+
		"\7p\2\2\u0099\u009a\7w\2\2\u009a\u009b\7g\2\2\u009b\6\3\2\2\2\u009c\u009d"+
		"\7g\2\2\u009d\u009e\7n\2\2\u009e\u009f\7u\2\2\u009f\u00a0\7g\2\2\u00a0"+
		"\b\3\2\2\2\u00a1\u00a2\7h\2\2\u00a2\u00a3\7q\2\2\u00a3\u00a4\7t\2\2\u00a4"+
		"\n\3\2\2\2\u00a5\u00a6\7k\2\2\u00a6\u00a7\7h\2\2\u00a7\f\3\2\2\2\u00a8"+
		"\u00a9\7k\2\2\u00a9\u00aa\7p\2\2\u00aa\u00ab\7n\2\2\u00ab\u00ac\7k\2\2"+
		"\u00ac\u00ad\7p\2\2\u00ad\u00ae\7g\2\2\u00ae\16\3\2\2\2\u00af\u00b0\7"+
		"k\2\2\u00b0\u00b1\7p\2\2\u00b1\u00b2\7v\2\2\u00b2\20\3\2\2\2\u00b3\u00b4"+
		"\7u\2\2\u00b4\u00b5\7v\2\2\u00b5\u00b6\7t\2\2\u00b6\u00b7\7k\2\2\u00b7"+
		"\u00b8\7p\2\2\u00b8\u00b9\7i\2\2\u00b9\22\3\2\2\2\u00ba\u00bb\7t\2\2\u00bb"+
		"\u00bc\7g\2\2\u00bc\u00bd\7v\2\2\u00bd\u00be\7w\2\2\u00be\u00bf\7t\2\2"+
		"\u00bf\u00c0\7p\2\2\u00c0\24\3\2\2\2\u00c1\u00c2\7x\2\2\u00c2\u00c3\7"+
		"q\2\2\u00c3\u00c4\7k\2\2\u00c4\u00c5\7f\2\2\u00c5\26\3\2\2\2\u00c6\u00c7"+
		"\7y\2\2\u00c7\u00c8\7j\2\2\u00c8\u00c9\7k\2\2\u00c9\u00ca\7n\2\2\u00ca"+
		"\u00cb\7g\2\2\u00cb\30\3\2\2\2\u00cc\u00cd\7e\2\2\u00cd\u00ce\7n\2\2\u00ce"+
		"\u00cf\7c\2\2\u00cf\u00d0\7u\2\2\u00d0\u00d1\7u\2\2\u00d1\32\3\2\2\2\u00d2"+
		"\u00d3\7p\2\2\u00d3\u00d4\7g\2\2\u00d4\u00d5\7y\2\2\u00d5\34\3\2\2\2\u00d6"+
		"\u00d7\7v\2\2\u00d7\u00d8\7j\2\2\u00d8\u00d9\7k\2\2\u00d9\u00da\7u\2\2"+
		"\u00da\36\3\2\2\2\u00db\u00dc\7*\2\2\u00dc \3\2\2\2\u00dd\u00de\7+\2\2"+
		"\u00de\"\3\2\2\2\u00df\u00e0\7]\2\2\u00e0$\3\2\2\2\u00e1\u00e2\7_\2\2"+
		"\u00e2&\3\2\2\2\u00e3\u00e4\7}\2\2\u00e4(\3\2\2\2\u00e5\u00e6\7\177\2"+
		"\2\u00e6*\3\2\2\2\u00e7\u00e8\7>\2\2\u00e8,\3\2\2\2\u00e9\u00ea\7>\2\2"+
		"\u00ea\u00eb\7?\2\2\u00eb.\3\2\2\2\u00ec\u00ed\7@\2\2\u00ed\60\3\2\2\2"+
		"\u00ee\u00ef\7@\2\2\u00ef\u00f0\7?\2\2\u00f0\62\3\2\2\2\u00f1\u00f2\7"+
		">\2\2\u00f2\u00f3\7>\2\2\u00f3\64\3\2\2\2\u00f4\u00f5\7@\2\2\u00f5\u00f6"+
		"\7@\2\2\u00f6\66\3\2\2\2\u00f7\u00f8\7-\2\2\u00f88\3\2\2\2\u00f9\u00fa"+
		"\7-\2\2\u00fa\u00fb\7-\2\2\u00fb:\3\2\2\2\u00fc\u00fd\7/\2\2\u00fd<\3"+
		"\2\2\2\u00fe\u00ff\7/\2\2\u00ff\u0100\7/\2\2\u0100>\3\2\2\2\u0101\u0102"+
		"\7,\2\2\u0102@\3\2\2\2\u0103\u0104\7\61\2\2\u0104B\3\2\2\2\u0105\u0106"+
		"\7\'\2\2\u0106D\3\2\2\2\u0107\u0108\7(\2\2\u0108F\3\2\2\2\u0109\u010a"+
		"\7~\2\2\u010aH\3\2\2\2\u010b\u010c\7(\2\2\u010c\u010d\7(\2\2\u010dJ\3"+
		"\2\2\2\u010e\u010f\7~\2\2\u010f\u0110\7~\2\2\u0110L\3\2\2\2\u0111\u0112"+
		"\7`\2\2\u0112N\3\2\2\2\u0113\u0114\7#\2\2\u0114P\3\2\2\2\u0115\u0116\7"+
		"\u0080\2\2\u0116R\3\2\2\2\u0117\u0118\7<\2\2\u0118T\3\2\2\2\u0119\u011a"+
		"\7=\2\2\u011aV\3\2\2\2\u011b\u011c\7.\2\2\u011cX\3\2\2\2\u011d\u011e\7"+
		"?\2\2\u011eZ\3\2\2\2\u011f\u0120\7?\2\2\u0120\u0121\7?\2\2\u0121\\\3\2"+
		"\2\2\u0122\u0123\7#\2\2\u0123\u0124\7?\2\2\u0124^\3\2\2\2\u0125\u0126"+
		"\7\60\2\2\u0126`\3\2\2\2\u0127\u0128\7v\2\2\u0128\u0129\7t\2\2\u0129\u012a"+
		"\7w\2\2\u012a\u012b\7g\2\2\u012bb\3\2\2\2\u012c\u012d\7h\2\2\u012d\u012e"+
		"\7c\2\2\u012e\u012f\7n\2\2\u012f\u0130\7u\2\2\u0130\u0131\7g\2\2\u0131"+
		"d\3\2\2\2\u0132\u0133\7p\2\2\u0133\u0134\7w\2\2\u0134\u0135\7n\2\2\u0135"+
		"\u0136\7n\2\2\u0136f\3\2\2\2\u0137\u013c\5i\65\2\u0138\u013b\5i\65\2\u0139"+
		"\u013b\5k\66\2\u013a\u0138\3\2\2\2\u013a\u0139\3\2\2\2\u013b\u013e\3\2"+
		"\2\2\u013c\u013a\3\2\2\2\u013c\u013d\3\2\2\2\u013dh\3\2\2\2\u013e\u013c"+
		"\3\2\2\2\u013f\u0140\t\2\2\2\u0140j\3\2\2\2\u0141\u0142\t\3\2\2\u0142"+
		"l\3\2\2\2\u0143\u0146\5o8\2\u0144\u0146\5e\63\2\u0145\u0143\3\2\2\2\u0145"+
		"\u0144\3\2\2\2\u0146n\3\2\2\2\u0147\u014b\5q9\2\u0148\u014a\5k\66\2\u0149"+
		"\u0148\3\2\2\2\u014a\u014d\3\2\2\2\u014b\u0149\3\2\2\2\u014b\u014c\3\2"+
		"\2\2\u014cp\3\2\2\2\u014d\u014b\3\2\2\2\u014e\u014f\t\4\2\2\u014fr\3\2"+
		"\2\2\u0150\u0151\t\5\2\2\u0151t\3\2\2\2\u0152\u0154\5k\66\2\u0153\u0152"+
		"\3\2\2\2\u0154\u0155\3\2\2\2\u0155\u0153\3\2\2\2\u0155\u0156\3\2\2\2\u0156"+
		"v\3\2\2\2\u0157\u0158\7)\2\2\u0158\u0159\5y=\2\u0159\u015a\7)\2\2\u015a"+
		"x\3\2\2\2\u015b\u015d\5{>\2\u015c\u015b\3\2\2\2\u015d\u015e\3\2\2\2\u015e"+
		"\u015c\3\2\2\2\u015e\u015f\3\2\2\2\u015fz\3\2\2\2\u0160\u0163\n\6\2\2"+
		"\u0161\u0163\5}?\2\u0162\u0160\3\2\2\2\u0162\u0161\3\2\2\2\u0163|\3\2"+
		"\2\2\u0164\u0165\7^\2\2\u0165\u0166\t\7\2\2\u0166~\3\2\2\2\u0167\u0169"+
		"\7$\2\2\u0168\u016a\5\u0081A\2\u0169\u0168\3\2\2\2\u0169\u016a\3\2\2\2"+
		"\u016a\u016b\3\2\2\2\u016b\u016c\7$\2\2\u016c\u0080\3\2\2\2\u016d\u016f"+
		"\5\u0083B\2\u016e\u016d\3\2\2\2\u016f\u0170\3\2\2\2\u0170\u016e\3\2\2"+
		"\2\u0170\u0171\3\2\2\2\u0171\u0082\3\2\2\2\u0172\u017a\n\b\2\2\u0173\u017a"+
		"\5}?\2\u0174\u0175\7^\2\2\u0175\u017a\7\f\2\2\u0176\u0177\7^\2\2\u0177"+
		"\u0178\7\17\2\2\u0178\u017a\7\f\2\2\u0179\u0172\3\2\2\2\u0179\u0173\3"+
		"\2\2\2\u0179\u0174\3\2\2\2\u0179\u0176\3\2\2\2\u017a\u0084\3\2\2\2\u017b"+
		"\u017d\t\t\2\2\u017c\u017b\3\2\2\2\u017d\u017e\3\2\2\2\u017e\u017c\3\2"+
		"\2\2\u017e\u017f\3\2\2\2\u017f\u0180\3\2\2\2\u0180\u0181\bC\2\2\u0181"+
		"\u0086\3\2\2\2\u0182\u0184\7\17\2\2\u0183\u0185\7\f\2\2\u0184\u0183\3"+
		"\2\2\2\u0184\u0185\3\2\2\2\u0185\u0188\3\2\2\2\u0186\u0188\7\f\2\2\u0187"+
		"\u0182\3\2\2\2\u0187\u0186\3\2\2\2\u0188\u0189\3\2\2\2\u0189\u018a\bD"+
		"\2\2\u018a\u0088\3\2\2\2\u018b\u018c\7\61\2\2\u018c\u018d\7,\2\2\u018d"+
		"\u0191\3\2\2\2\u018e\u0190\13\2\2\2\u018f\u018e\3\2\2\2\u0190\u0193\3"+
		"\2\2\2\u0191\u0192\3\2\2\2\u0191\u018f\3\2\2\2\u0192\u0194\3\2\2\2\u0193"+
		"\u0191\3\2\2\2\u0194\u0195\7,\2\2\u0195\u0196\7\61\2\2\u0196\u0197\3\2"+
		"\2\2\u0197\u0198\bE\2\2\u0198\u008a\3\2\2\2\u0199\u019a\7\61\2\2\u019a"+
		"\u019b\7\61\2\2\u019b\u019f\3\2\2\2\u019c\u019e\n\n\2\2\u019d\u019c\3"+
		"\2\2\2\u019e\u01a1\3\2\2\2\u019f\u019d\3\2\2\2\u019f\u01a0\3\2\2\2\u01a0"+
		"\u01a2\3\2\2\2\u01a1\u019f\3\2\2\2\u01a2\u01a3\bF\2\2\u01a3\u008c\3\2"+
		"\2\2\22\2\u013a\u013c\u0145\u014b\u0155\u015e\u0162\u0169\u0170\u0179"+
		"\u017e\u0184\u0187\u0191\u019f\3\b\2\2";
	public static final ATN _ATN =
		new ATNDeserializer().deserialize(_serializedATN.toCharArray());
	static {
		_decisionToDFA = new DFA[_ATN.getNumberOfDecisions()];
		for (int i = 0; i < _ATN.getNumberOfDecisions(); i++) {
			_decisionToDFA[i] = new DFA(_ATN.getDecisionState(i), i);
		}
	}
}