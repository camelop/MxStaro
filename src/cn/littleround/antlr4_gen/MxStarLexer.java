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
		"Dot", "True", "False", "Null", "Identifier", "Identifierstart", "Nondigit", 
		"Digit", "Constant", "IntegerConstant", "NonzeroDigit", "Sign", "DigitSequence", 
		"CharacterConstant", "CCharSequence", "CChar", "EscapeSequence", "StringLiteral", 
		"SCharSequence", "SChar", "Whitespace", "Newline", "BlockComment", "LineComment"
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
		"\3\u608b\ua72a\u8133\ub9ed\u417c\u3be7\u7786\u5964\2<\u01a8\b\1\4\2\t"+
		"\2\4\3\t\3\4\4\t\4\4\5\t\5\4\6\t\6\4\7\t\7\4\b\t\b\4\t\t\t\4\n\t\n\4\13"+
		"\t\13\4\f\t\f\4\r\t\r\4\16\t\16\4\17\t\17\4\20\t\20\4\21\t\21\4\22\t\22"+
		"\4\23\t\23\4\24\t\24\4\25\t\25\4\26\t\26\4\27\t\27\4\30\t\30\4\31\t\31"+
		"\4\32\t\32\4\33\t\33\4\34\t\34\4\35\t\35\4\36\t\36\4\37\t\37\4 \t \4!"+
		"\t!\4\"\t\"\4#\t#\4$\t$\4%\t%\4&\t&\4\'\t\'\4(\t(\4)\t)\4*\t*\4+\t+\4"+
		",\t,\4-\t-\4.\t.\4/\t/\4\60\t\60\4\61\t\61\4\62\t\62\4\63\t\63\4\64\t"+
		"\64\4\65\t\65\4\66\t\66\4\67\t\67\48\t8\49\t9\4:\t:\4;\t;\4<\t<\4=\t="+
		"\4>\t>\4?\t?\4@\t@\4A\tA\4B\tB\4C\tC\4D\tD\4E\tE\4F\tF\4G\tG\3\2\3\2\3"+
		"\2\3\2\3\2\3\2\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\4\3\4\3\4\3\4\3\4"+
		"\3\5\3\5\3\5\3\5\3\6\3\6\3\6\3\7\3\7\3\7\3\7\3\7\3\7\3\7\3\b\3\b\3\b\3"+
		"\b\3\t\3\t\3\t\3\t\3\t\3\t\3\t\3\n\3\n\3\n\3\n\3\n\3\n\3\n\3\13\3\13\3"+
		"\13\3\13\3\13\3\f\3\f\3\f\3\f\3\f\3\f\3\r\3\r\3\r\3\r\3\r\3\r\3\16\3\16"+
		"\3\16\3\16\3\17\3\17\3\17\3\17\3\17\3\20\3\20\3\21\3\21\3\22\3\22\3\23"+
		"\3\23\3\24\3\24\3\25\3\25\3\26\3\26\3\27\3\27\3\27\3\30\3\30\3\31\3\31"+
		"\3\31\3\32\3\32\3\32\3\33\3\33\3\33\3\34\3\34\3\35\3\35\3\35\3\36\3\36"+
		"\3\37\3\37\3\37\3 \3 \3!\3!\3\"\3\"\3#\3#\3$\3$\3%\3%\3%\3&\3&\3&\3\'"+
		"\3\'\3(\3(\3)\3)\3*\3*\3+\3+\3,\3,\3-\3-\3.\3.\3.\3/\3/\3/\3\60\3\60\3"+
		"\61\3\61\3\61\3\61\3\61\3\62\3\62\3\62\3\62\3\62\3\62\3\63\3\63\3\63\3"+
		"\63\3\63\3\64\3\64\3\64\7\64\u013d\n\64\f\64\16\64\u0140\13\64\3\65\3"+
		"\65\3\66\3\66\3\67\3\67\38\38\58\u014a\n8\39\39\79\u014e\n9\f9\169\u0151"+
		"\139\3:\3:\3;\3;\3<\6<\u0158\n<\r<\16<\u0159\3=\3=\3=\3=\3>\6>\u0161\n"+
		">\r>\16>\u0162\3?\3?\5?\u0167\n?\3@\3@\3@\3A\3A\5A\u016e\nA\3A\3A\3B\6"+
		"B\u0173\nB\rB\16B\u0174\3C\3C\3C\3C\3C\3C\3C\5C\u017e\nC\3D\6D\u0181\n"+
		"D\rD\16D\u0182\3D\3D\3E\3E\5E\u0189\nE\3E\5E\u018c\nE\3E\3E\3F\3F\3F\3"+
		"F\7F\u0194\nF\fF\16F\u0197\13F\3F\3F\3F\3F\3F\3G\3G\3G\3G\7G\u01a2\nG"+
		"\fG\16G\u01a5\13G\3G\3G\3\u0195\2H\3\3\5\4\7\5\t\6\13\7\r\b\17\t\21\n"+
		"\23\13\25\f\27\r\31\16\33\17\35\20\37\21!\22#\23%\24\'\25)\26+\27-\30"+
		"/\31\61\32\63\33\65\34\67\359\36;\37= ?!A\"C#E$G%I&K\'M(O)Q*S+U,W-Y.["+
		"/]\60_\61a\62c\63e\64g\65i\2k\2m\2o\66q\2s\2u\2w\67y\2{\2}\2\177\2\u0081"+
		"8\u0083\2\u0085\2\u00879\u0089:\u008b;\u008d<\3\2\f\4\2C\\c|\5\2C\\aa"+
		"c|\3\2\62;\3\2\63;\4\2--//\6\2\f\f\17\17))^^\f\2$$))AA^^cdhhppttvvxx\6"+
		"\2\f\f\17\17$$^^\4\2\13\13\"\"\4\2\f\f\17\17\2\u01ac\2\3\3\2\2\2\2\5\3"+
		"\2\2\2\2\7\3\2\2\2\2\t\3\2\2\2\2\13\3\2\2\2\2\r\3\2\2\2\2\17\3\2\2\2\2"+
		"\21\3\2\2\2\2\23\3\2\2\2\2\25\3\2\2\2\2\27\3\2\2\2\2\31\3\2\2\2\2\33\3"+
		"\2\2\2\2\35\3\2\2\2\2\37\3\2\2\2\2!\3\2\2\2\2#\3\2\2\2\2%\3\2\2\2\2\'"+
		"\3\2\2\2\2)\3\2\2\2\2+\3\2\2\2\2-\3\2\2\2\2/\3\2\2\2\2\61\3\2\2\2\2\63"+
		"\3\2\2\2\2\65\3\2\2\2\2\67\3\2\2\2\29\3\2\2\2\2;\3\2\2\2\2=\3\2\2\2\2"+
		"?\3\2\2\2\2A\3\2\2\2\2C\3\2\2\2\2E\3\2\2\2\2G\3\2\2\2\2I\3\2\2\2\2K\3"+
		"\2\2\2\2M\3\2\2\2\2O\3\2\2\2\2Q\3\2\2\2\2S\3\2\2\2\2U\3\2\2\2\2W\3\2\2"+
		"\2\2Y\3\2\2\2\2[\3\2\2\2\2]\3\2\2\2\2_\3\2\2\2\2a\3\2\2\2\2c\3\2\2\2\2"+
		"e\3\2\2\2\2g\3\2\2\2\2o\3\2\2\2\2w\3\2\2\2\2\u0081\3\2\2\2\2\u0087\3\2"+
		"\2\2\2\u0089\3\2\2\2\2\u008b\3\2\2\2\2\u008d\3\2\2\2\3\u008f\3\2\2\2\5"+
		"\u0095\3\2\2\2\7\u009e\3\2\2\2\t\u00a3\3\2\2\2\13\u00a7\3\2\2\2\r\u00aa"+
		"\3\2\2\2\17\u00b1\3\2\2\2\21\u00b5\3\2\2\2\23\u00bc\3\2\2\2\25\u00c3\3"+
		"\2\2\2\27\u00c8\3\2\2\2\31\u00ce\3\2\2\2\33\u00d4\3\2\2\2\35\u00d8\3\2"+
		"\2\2\37\u00dd\3\2\2\2!\u00df\3\2\2\2#\u00e1\3\2\2\2%\u00e3\3\2\2\2\'\u00e5"+
		"\3\2\2\2)\u00e7\3\2\2\2+\u00e9\3\2\2\2-\u00eb\3\2\2\2/\u00ee\3\2\2\2\61"+
		"\u00f0\3\2\2\2\63\u00f3\3\2\2\2\65\u00f6\3\2\2\2\67\u00f9\3\2\2\29\u00fb"+
		"\3\2\2\2;\u00fe\3\2\2\2=\u0100\3\2\2\2?\u0103\3\2\2\2A\u0105\3\2\2\2C"+
		"\u0107\3\2\2\2E\u0109\3\2\2\2G\u010b\3\2\2\2I\u010d\3\2\2\2K\u0110\3\2"+
		"\2\2M\u0113\3\2\2\2O\u0115\3\2\2\2Q\u0117\3\2\2\2S\u0119\3\2\2\2U\u011b"+
		"\3\2\2\2W\u011d\3\2\2\2Y\u011f\3\2\2\2[\u0121\3\2\2\2]\u0124\3\2\2\2_"+
		"\u0127\3\2\2\2a\u0129\3\2\2\2c\u012e\3\2\2\2e\u0134\3\2\2\2g\u0139\3\2"+
		"\2\2i\u0141\3\2\2\2k\u0143\3\2\2\2m\u0145\3\2\2\2o\u0149\3\2\2\2q\u014b"+
		"\3\2\2\2s\u0152\3\2\2\2u\u0154\3\2\2\2w\u0157\3\2\2\2y\u015b\3\2\2\2{"+
		"\u0160\3\2\2\2}\u0166\3\2\2\2\177\u0168\3\2\2\2\u0081\u016b\3\2\2\2\u0083"+
		"\u0172\3\2\2\2\u0085\u017d\3\2\2\2\u0087\u0180\3\2\2\2\u0089\u018b\3\2"+
		"\2\2\u008b\u018f\3\2\2\2\u008d\u019d\3\2\2\2\u008f\u0090\7d\2\2\u0090"+
		"\u0091\7t\2\2\u0091\u0092\7g\2\2\u0092\u0093\7c\2\2\u0093\u0094\7m\2\2"+
		"\u0094\4\3\2\2\2\u0095\u0096\7e\2\2\u0096\u0097\7q\2\2\u0097\u0098\7p"+
		"\2\2\u0098\u0099\7v\2\2\u0099\u009a\7k\2\2\u009a\u009b\7p\2\2\u009b\u009c"+
		"\7w\2\2\u009c\u009d\7g\2\2\u009d\6\3\2\2\2\u009e\u009f\7g\2\2\u009f\u00a0"+
		"\7n\2\2\u00a0\u00a1\7u\2\2\u00a1\u00a2\7g\2\2\u00a2\b\3\2\2\2\u00a3\u00a4"+
		"\7h\2\2\u00a4\u00a5\7q\2\2\u00a5\u00a6\7t\2\2\u00a6\n\3\2\2\2\u00a7\u00a8"+
		"\7k\2\2\u00a8\u00a9\7h\2\2\u00a9\f\3\2\2\2\u00aa\u00ab\7k\2\2\u00ab\u00ac"+
		"\7p\2\2\u00ac\u00ad\7n\2\2\u00ad\u00ae\7k\2\2\u00ae\u00af\7p\2\2\u00af"+
		"\u00b0\7g\2\2\u00b0\16\3\2\2\2\u00b1\u00b2\7k\2\2\u00b2\u00b3\7p\2\2\u00b3"+
		"\u00b4\7v\2\2\u00b4\20\3\2\2\2\u00b5\u00b6\7u\2\2\u00b6\u00b7\7v\2\2\u00b7"+
		"\u00b8\7t\2\2\u00b8\u00b9\7k\2\2\u00b9\u00ba\7p\2\2\u00ba\u00bb\7i\2\2"+
		"\u00bb\22\3\2\2\2\u00bc\u00bd\7t\2\2\u00bd\u00be\7g\2\2\u00be\u00bf\7"+
		"v\2\2\u00bf\u00c0\7w\2\2\u00c0\u00c1\7t\2\2\u00c1\u00c2\7p\2\2\u00c2\24"+
		"\3\2\2\2\u00c3\u00c4\7x\2\2\u00c4\u00c5\7q\2\2\u00c5\u00c6\7k\2\2\u00c6"+
		"\u00c7\7f\2\2\u00c7\26\3\2\2\2\u00c8\u00c9\7y\2\2\u00c9\u00ca\7j\2\2\u00ca"+
		"\u00cb\7k\2\2\u00cb\u00cc\7n\2\2\u00cc\u00cd\7g\2\2\u00cd\30\3\2\2\2\u00ce"+
		"\u00cf\7e\2\2\u00cf\u00d0\7n\2\2\u00d0\u00d1\7c\2\2\u00d1\u00d2\7u\2\2"+
		"\u00d2\u00d3\7u\2\2\u00d3\32\3\2\2\2\u00d4\u00d5\7p\2\2\u00d5\u00d6\7"+
		"g\2\2\u00d6\u00d7\7y\2\2\u00d7\34\3\2\2\2\u00d8\u00d9\7v\2\2\u00d9\u00da"+
		"\7j\2\2\u00da\u00db\7k\2\2\u00db\u00dc\7u\2\2\u00dc\36\3\2\2\2\u00dd\u00de"+
		"\7*\2\2\u00de \3\2\2\2\u00df\u00e0\7+\2\2\u00e0\"\3\2\2\2\u00e1\u00e2"+
		"\7]\2\2\u00e2$\3\2\2\2\u00e3\u00e4\7_\2\2\u00e4&\3\2\2\2\u00e5\u00e6\7"+
		"}\2\2\u00e6(\3\2\2\2\u00e7\u00e8\7\177\2\2\u00e8*\3\2\2\2\u00e9\u00ea"+
		"\7>\2\2\u00ea,\3\2\2\2\u00eb\u00ec\7>\2\2\u00ec\u00ed\7?\2\2\u00ed.\3"+
		"\2\2\2\u00ee\u00ef\7@\2\2\u00ef\60\3\2\2\2\u00f0\u00f1\7@\2\2\u00f1\u00f2"+
		"\7?\2\2\u00f2\62\3\2\2\2\u00f3\u00f4\7>\2\2\u00f4\u00f5\7>\2\2\u00f5\64"+
		"\3\2\2\2\u00f6\u00f7\7@\2\2\u00f7\u00f8\7@\2\2\u00f8\66\3\2\2\2\u00f9"+
		"\u00fa\7-\2\2\u00fa8\3\2\2\2\u00fb\u00fc\7-\2\2\u00fc\u00fd\7-\2\2\u00fd"+
		":\3\2\2\2\u00fe\u00ff\7/\2\2\u00ff<\3\2\2\2\u0100\u0101\7/\2\2\u0101\u0102"+
		"\7/\2\2\u0102>\3\2\2\2\u0103\u0104\7,\2\2\u0104@\3\2\2\2\u0105\u0106\7"+
		"\61\2\2\u0106B\3\2\2\2\u0107\u0108\7\'\2\2\u0108D\3\2\2\2\u0109\u010a"+
		"\7(\2\2\u010aF\3\2\2\2\u010b\u010c\7~\2\2\u010cH\3\2\2\2\u010d\u010e\7"+
		"(\2\2\u010e\u010f\7(\2\2\u010fJ\3\2\2\2\u0110\u0111\7~\2\2\u0111\u0112"+
		"\7~\2\2\u0112L\3\2\2\2\u0113\u0114\7`\2\2\u0114N\3\2\2\2\u0115\u0116\7"+
		"#\2\2\u0116P\3\2\2\2\u0117\u0118\7\u0080\2\2\u0118R\3\2\2\2\u0119\u011a"+
		"\7<\2\2\u011aT\3\2\2\2\u011b\u011c\7=\2\2\u011cV\3\2\2\2\u011d\u011e\7"+
		".\2\2\u011eX\3\2\2\2\u011f\u0120\7?\2\2\u0120Z\3\2\2\2\u0121\u0122\7?"+
		"\2\2\u0122\u0123\7?\2\2\u0123\\\3\2\2\2\u0124\u0125\7#\2\2\u0125\u0126"+
		"\7?\2\2\u0126^\3\2\2\2\u0127\u0128\7\60\2\2\u0128`\3\2\2\2\u0129\u012a"+
		"\7v\2\2\u012a\u012b\7t\2\2\u012b\u012c\7w\2\2\u012c\u012d\7g\2\2\u012d"+
		"b\3\2\2\2\u012e\u012f\7h\2\2\u012f\u0130\7c\2\2\u0130\u0131\7n\2\2\u0131"+
		"\u0132\7u\2\2\u0132\u0133\7g\2\2\u0133d\3\2\2\2\u0134\u0135\7p\2\2\u0135"+
		"\u0136\7w\2\2\u0136\u0137\7n\2\2\u0137\u0138\7n\2\2\u0138f\3\2\2\2\u0139"+
		"\u013e\5i\65\2\u013a\u013d\5k\66\2\u013b\u013d\5m\67\2\u013c\u013a\3\2"+
		"\2\2\u013c\u013b\3\2\2\2\u013d\u0140\3\2\2\2\u013e\u013c\3\2\2\2\u013e"+
		"\u013f\3\2\2\2\u013fh\3\2\2\2\u0140\u013e\3\2\2\2\u0141\u0142\t\2\2\2"+
		"\u0142j\3\2\2\2\u0143\u0144\t\3\2\2\u0144l\3\2\2\2\u0145\u0146\t\4\2\2"+
		"\u0146n\3\2\2\2\u0147\u014a\5q9\2\u0148\u014a\5e\63\2\u0149\u0147\3\2"+
		"\2\2\u0149\u0148\3\2\2\2\u014ap\3\2\2\2\u014b\u014f\5s:\2\u014c\u014e"+
		"\5m\67\2\u014d\u014c\3\2\2\2\u014e\u0151\3\2\2\2\u014f\u014d\3\2\2\2\u014f"+
		"\u0150\3\2\2\2\u0150r\3\2\2\2\u0151\u014f\3\2\2\2\u0152\u0153\t\5\2\2"+
		"\u0153t\3\2\2\2\u0154\u0155\t\6\2\2\u0155v\3\2\2\2\u0156\u0158\5m\67\2"+
		"\u0157\u0156\3\2\2\2\u0158\u0159\3\2\2\2\u0159\u0157\3\2\2\2\u0159\u015a"+
		"\3\2\2\2\u015ax\3\2\2\2\u015b\u015c\7)\2\2\u015c\u015d\5{>\2\u015d\u015e"+
		"\7)\2\2\u015ez\3\2\2\2\u015f\u0161\5}?\2\u0160\u015f\3\2\2\2\u0161\u0162"+
		"\3\2\2\2\u0162\u0160\3\2\2\2\u0162\u0163\3\2\2\2\u0163|\3\2\2\2\u0164"+
		"\u0167\n\7\2\2\u0165\u0167\5\177@\2\u0166\u0164\3\2\2\2\u0166\u0165\3"+
		"\2\2\2\u0167~\3\2\2\2\u0168\u0169\7^\2\2\u0169\u016a\t\b\2\2\u016a\u0080"+
		"\3\2\2\2\u016b\u016d\7$\2\2\u016c\u016e\5\u0083B\2\u016d\u016c\3\2\2\2"+
		"\u016d\u016e\3\2\2\2\u016e\u016f\3\2\2\2\u016f\u0170\7$\2\2\u0170\u0082"+
		"\3\2\2\2\u0171\u0173\5\u0085C\2\u0172\u0171\3\2\2\2\u0173\u0174\3\2\2"+
		"\2\u0174\u0172\3\2\2\2\u0174\u0175\3\2\2\2\u0175\u0084\3\2\2\2\u0176\u017e"+
		"\n\t\2\2\u0177\u017e\5\177@\2\u0178\u0179\7^\2\2\u0179\u017e\7\f\2\2\u017a"+
		"\u017b\7^\2\2\u017b\u017c\7\17\2\2\u017c\u017e\7\f\2\2\u017d\u0176\3\2"+
		"\2\2\u017d\u0177\3\2\2\2\u017d\u0178\3\2\2\2\u017d\u017a\3\2\2\2\u017e"+
		"\u0086\3\2\2\2\u017f\u0181\t\n\2\2\u0180\u017f\3\2\2\2\u0181\u0182\3\2"+
		"\2\2\u0182\u0180\3\2\2\2\u0182\u0183\3\2\2\2\u0183\u0184\3\2\2\2\u0184"+
		"\u0185\bD\2\2\u0185\u0088\3\2\2\2\u0186\u0188\7\17\2\2\u0187\u0189\7\f"+
		"\2\2\u0188\u0187\3\2\2\2\u0188\u0189\3\2\2\2\u0189\u018c\3\2\2\2\u018a"+
		"\u018c\7\f\2\2\u018b\u0186\3\2\2\2\u018b\u018a\3\2\2\2\u018c\u018d\3\2"+
		"\2\2\u018d\u018e\bE\2\2\u018e\u008a\3\2\2\2\u018f\u0190\7\61\2\2\u0190"+
		"\u0191\7,\2\2\u0191\u0195\3\2\2\2\u0192\u0194\13\2\2\2\u0193\u0192\3\2"+
		"\2\2\u0194\u0197\3\2\2\2\u0195\u0196\3\2\2\2\u0195\u0193\3\2\2\2\u0196"+
		"\u0198\3\2\2\2\u0197\u0195\3\2\2\2\u0198\u0199\7,\2\2\u0199\u019a\7\61"+
		"\2\2\u019a\u019b\3\2\2\2\u019b\u019c\bF\2\2\u019c\u008c\3\2\2\2\u019d"+
		"\u019e\7\61\2\2\u019e\u019f\7\61\2\2\u019f\u01a3\3\2\2\2\u01a0\u01a2\n"+
		"\13\2\2\u01a1\u01a0\3\2\2\2\u01a2\u01a5\3\2\2\2\u01a3\u01a1\3\2\2\2\u01a3"+
		"\u01a4\3\2\2\2\u01a4\u01a6\3\2\2\2\u01a5\u01a3\3\2\2\2\u01a6\u01a7\bG"+
		"\2\2\u01a7\u008e\3\2\2\2\22\2\u013c\u013e\u0149\u014f\u0159\u0162\u0166"+
		"\u016d\u0174\u017d\u0182\u0188\u018b\u0195\u01a3\3\b\2\2";
	public static final ATN _ATN =
		new ATNDeserializer().deserialize(_serializedATN.toCharArray());
	static {
		_decisionToDFA = new DFA[_ATN.getNumberOfDecisions()];
		for (int i = 0; i < _ATN.getNumberOfDecisions(); i++) {
			_decisionToDFA[i] = new DFA(_ATN.getDecisionState(i), i);
		}
	}
}