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
		Void=10, While=11, Class=12, New=13, This=14, True=15, False=16, LeftParen=17, 
		RightParen=18, LeftBracket=19, RightBracket=20, LeftBrace=21, RightBrace=22, 
		Less=23, LessEqual=24, Greater=25, GreaterEqual=26, LeftShift=27, RightShift=28, 
		Plus=29, PlusPlus=30, Minus=31, MinusMinus=32, Star=33, Div=34, Mod=35, 
		And=36, Or=37, AndAnd=38, OrOr=39, Caret=40, Not=41, Tilde=42, Colon=43, 
		Semi=44, Comma=45, Assign=46, Equal=47, NotEqual=48, Dot=49, Identifier=50, 
		BooleanConstant=51, Constant=52, DigitSequence=53, StringLiteral=54, Whitespace=55, 
		Newline=56, BlockComment=57, LineComment=58;
	public static String[] channelNames = {
		"DEFAULT_TOKEN_CHANNEL", "HIDDEN"
	};

	public static String[] modeNames = {
		"DEFAULT_MODE"
	};

	public static final String[] ruleNames = {
		"Break", "Continue", "Else", "For", "If", "Inline", "Int", "String", "Return", 
		"Void", "While", "Class", "New", "This", "True", "False", "LeftParen", 
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
		null, "'break'", "'continue'", "'else'", "'for'", "'if'", "'inline'", 
		"'int'", "'string'", "'return'", "'void'", "'while'", "'class'", "'new'", 
		"'this'", "'true'", "'false'", "'('", "')'", "'['", "']'", "'{'", "'}'", 
		"'<'", "'<='", "'>'", "'>='", "'<<'", "'>>'", "'+'", "'++'", "'-'", "'--'", 
		"'*'", "'/'", "'%'", "'&'", "'|'", "'&&'", "'||'", "'^'", "'!'", "'~'", 
		"':'", "';'", "','", "'='", "'=='", "'!='", "'.'"
	};
	private static final String[] _SYMBOLIC_NAMES = {
		null, "Break", "Continue", "Else", "For", "If", "Inline", "Int", "String", 
		"Return", "Void", "While", "Class", "New", "This", "True", "False", "LeftParen", 
		"RightParen", "LeftBracket", "RightBracket", "LeftBrace", "RightBrace", 
		"Less", "LessEqual", "Greater", "GreaterEqual", "LeftShift", "RightShift", 
		"Plus", "PlusPlus", "Minus", "MinusMinus", "Star", "Div", "Mod", "And", 
		"Or", "AndAnd", "OrOr", "Caret", "Not", "Tilde", "Colon", "Semi", "Comma", 
		"Assign", "Equal", "NotEqual", "Dot", "Identifier", "BooleanConstant", 
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
		"\3\u608b\ua72a\u8133\ub9ed\u417c\u3be7\u7786\u5964\2<\u01a3\b\1\4\2\t"+
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
		"\3\16\3\17\3\17\3\17\3\17\3\17\3\20\3\20\3\20\3\20\3\20\3\21\3\21\3\21"+
		"\3\21\3\21\3\21\3\22\3\22\3\23\3\23\3\24\3\24\3\25\3\25\3\26\3\26\3\27"+
		"\3\27\3\30\3\30\3\31\3\31\3\31\3\32\3\32\3\33\3\33\3\33\3\34\3\34\3\34"+
		"\3\35\3\35\3\35\3\36\3\36\3\37\3\37\3\37\3 \3 \3!\3!\3!\3\"\3\"\3#\3#"+
		"\3$\3$\3%\3%\3&\3&\3\'\3\'\3\'\3(\3(\3(\3)\3)\3*\3*\3+\3+\3,\3,\3-\3-"+
		"\3.\3.\3/\3/\3\60\3\60\3\60\3\61\3\61\3\61\3\62\3\62\3\63\3\63\3\63\7"+
		"\63\u0136\n\63\f\63\16\63\u0139\13\63\3\64\3\64\5\64\u013d\n\64\3\65\3"+
		"\65\3\66\3\66\3\67\3\67\5\67\u0145\n\67\38\38\78\u0149\n8\f8\168\u014c"+
		"\138\39\39\3:\3:\3;\6;\u0153\n;\r;\16;\u0154\3<\3<\3<\3<\3=\6=\u015c\n"+
		"=\r=\16=\u015d\3>\3>\5>\u0162\n>\3?\3?\3?\3@\3@\5@\u0169\n@\3@\3@\3A\6"+
		"A\u016e\nA\rA\16A\u016f\3B\3B\3B\3B\3B\3B\3B\5B\u0179\nB\3C\6C\u017c\n"+
		"C\rC\16C\u017d\3C\3C\3D\3D\5D\u0184\nD\3D\5D\u0187\nD\3D\3D\3E\3E\3E\3"+
		"E\7E\u018f\nE\fE\16E\u0192\13E\3E\3E\3E\3E\3E\3F\3F\3F\3F\7F\u019d\nF"+
		"\fF\16F\u01a0\13F\3F\3F\3\u0190\2G\3\3\5\4\7\5\t\6\13\7\r\b\17\t\21\n"+
		"\23\13\25\f\27\r\31\16\33\17\35\20\37\21!\22#\23%\24\'\25)\26+\27-\30"+
		"/\31\61\32\63\33\65\34\67\359\36;\37= ?!A\"C#E$G%I&K\'M(O)Q*S+U,W-Y.["+
		"/]\60_\61a\62c\63e\64g\65i\2k\2m\66o\2q\2s\2u\67w\2y\2{\2}\2\1778\u0081"+
		"\2\u0083\2\u00859\u0087:\u0089;\u008b<\3\2\13\5\2C\\aac|\3\2\62;\3\2\63"+
		";\4\2--//\6\2\f\f\17\17))^^\f\2$$))AA^^cdhhppttvvxx\6\2\f\f\17\17$$^^"+
		"\4\2\13\13\"\"\4\2\f\f\17\17\2\u01a9\2\3\3\2\2\2\2\5\3\2\2\2\2\7\3\2\2"+
		"\2\2\t\3\2\2\2\2\13\3\2\2\2\2\r\3\2\2\2\2\17\3\2\2\2\2\21\3\2\2\2\2\23"+
		"\3\2\2\2\2\25\3\2\2\2\2\27\3\2\2\2\2\31\3\2\2\2\2\33\3\2\2\2\2\35\3\2"+
		"\2\2\2\37\3\2\2\2\2!\3\2\2\2\2#\3\2\2\2\2%\3\2\2\2\2\'\3\2\2\2\2)\3\2"+
		"\2\2\2+\3\2\2\2\2-\3\2\2\2\2/\3\2\2\2\2\61\3\2\2\2\2\63\3\2\2\2\2\65\3"+
		"\2\2\2\2\67\3\2\2\2\29\3\2\2\2\2;\3\2\2\2\2=\3\2\2\2\2?\3\2\2\2\2A\3\2"+
		"\2\2\2C\3\2\2\2\2E\3\2\2\2\2G\3\2\2\2\2I\3\2\2\2\2K\3\2\2\2\2M\3\2\2\2"+
		"\2O\3\2\2\2\2Q\3\2\2\2\2S\3\2\2\2\2U\3\2\2\2\2W\3\2\2\2\2Y\3\2\2\2\2["+
		"\3\2\2\2\2]\3\2\2\2\2_\3\2\2\2\2a\3\2\2\2\2c\3\2\2\2\2e\3\2\2\2\2g\3\2"+
		"\2\2\2m\3\2\2\2\2u\3\2\2\2\2\177\3\2\2\2\2\u0085\3\2\2\2\2\u0087\3\2\2"+
		"\2\2\u0089\3\2\2\2\2\u008b\3\2\2\2\3\u008d\3\2\2\2\5\u0093\3\2\2\2\7\u009c"+
		"\3\2\2\2\t\u00a1\3\2\2\2\13\u00a5\3\2\2\2\r\u00a8\3\2\2\2\17\u00af\3\2"+
		"\2\2\21\u00b3\3\2\2\2\23\u00ba\3\2\2\2\25\u00c1\3\2\2\2\27\u00c6\3\2\2"+
		"\2\31\u00cc\3\2\2\2\33\u00d2\3\2\2\2\35\u00d6\3\2\2\2\37\u00db\3\2\2\2"+
		"!\u00e0\3\2\2\2#\u00e6\3\2\2\2%\u00e8\3\2\2\2\'\u00ea\3\2\2\2)\u00ec\3"+
		"\2\2\2+\u00ee\3\2\2\2-\u00f0\3\2\2\2/\u00f2\3\2\2\2\61\u00f4\3\2\2\2\63"+
		"\u00f7\3\2\2\2\65\u00f9\3\2\2\2\67\u00fc\3\2\2\29\u00ff\3\2\2\2;\u0102"+
		"\3\2\2\2=\u0104\3\2\2\2?\u0107\3\2\2\2A\u0109\3\2\2\2C\u010c\3\2\2\2E"+
		"\u010e\3\2\2\2G\u0110\3\2\2\2I\u0112\3\2\2\2K\u0114\3\2\2\2M\u0116\3\2"+
		"\2\2O\u0119\3\2\2\2Q\u011c\3\2\2\2S\u011e\3\2\2\2U\u0120\3\2\2\2W\u0122"+
		"\3\2\2\2Y\u0124\3\2\2\2[\u0126\3\2\2\2]\u0128\3\2\2\2_\u012a\3\2\2\2a"+
		"\u012d\3\2\2\2c\u0130\3\2\2\2e\u0132\3\2\2\2g\u013c\3\2\2\2i\u013e\3\2"+
		"\2\2k\u0140\3\2\2\2m\u0144\3\2\2\2o\u0146\3\2\2\2q\u014d\3\2\2\2s\u014f"+
		"\3\2\2\2u\u0152\3\2\2\2w\u0156\3\2\2\2y\u015b\3\2\2\2{\u0161\3\2\2\2}"+
		"\u0163\3\2\2\2\177\u0166\3\2\2\2\u0081\u016d\3\2\2\2\u0083\u0178\3\2\2"+
		"\2\u0085\u017b\3\2\2\2\u0087\u0186\3\2\2\2\u0089\u018a\3\2\2\2\u008b\u0198"+
		"\3\2\2\2\u008d\u008e\7d\2\2\u008e\u008f\7t\2\2\u008f\u0090\7g\2\2\u0090"+
		"\u0091\7c\2\2\u0091\u0092\7m\2\2\u0092\4\3\2\2\2\u0093\u0094\7e\2\2\u0094"+
		"\u0095\7q\2\2\u0095\u0096\7p\2\2\u0096\u0097\7v\2\2\u0097\u0098\7k\2\2"+
		"\u0098\u0099\7p\2\2\u0099\u009a\7w\2\2\u009a\u009b\7g\2\2\u009b\6\3\2"+
		"\2\2\u009c\u009d\7g\2\2\u009d\u009e\7n\2\2\u009e\u009f\7u\2\2\u009f\u00a0"+
		"\7g\2\2\u00a0\b\3\2\2\2\u00a1\u00a2\7h\2\2\u00a2\u00a3\7q\2\2\u00a3\u00a4"+
		"\7t\2\2\u00a4\n\3\2\2\2\u00a5\u00a6\7k\2\2\u00a6\u00a7\7h\2\2\u00a7\f"+
		"\3\2\2\2\u00a8\u00a9\7k\2\2\u00a9\u00aa\7p\2\2\u00aa\u00ab\7n\2\2\u00ab"+
		"\u00ac\7k\2\2\u00ac\u00ad\7p\2\2\u00ad\u00ae\7g\2\2\u00ae\16\3\2\2\2\u00af"+
		"\u00b0\7k\2\2\u00b0\u00b1\7p\2\2\u00b1\u00b2\7v\2\2\u00b2\20\3\2\2\2\u00b3"+
		"\u00b4\7u\2\2\u00b4\u00b5\7v\2\2\u00b5\u00b6\7t\2\2\u00b6\u00b7\7k\2\2"+
		"\u00b7\u00b8\7p\2\2\u00b8\u00b9\7i\2\2\u00b9\22\3\2\2\2\u00ba\u00bb\7"+
		"t\2\2\u00bb\u00bc\7g\2\2\u00bc\u00bd\7v\2\2\u00bd\u00be\7w\2\2\u00be\u00bf"+
		"\7t\2\2\u00bf\u00c0\7p\2\2\u00c0\24\3\2\2\2\u00c1\u00c2\7x\2\2\u00c2\u00c3"+
		"\7q\2\2\u00c3\u00c4\7k\2\2\u00c4\u00c5\7f\2\2\u00c5\26\3\2\2\2\u00c6\u00c7"+
		"\7y\2\2\u00c7\u00c8\7j\2\2\u00c8\u00c9\7k\2\2\u00c9\u00ca\7n\2\2\u00ca"+
		"\u00cb\7g\2\2\u00cb\30\3\2\2\2\u00cc\u00cd\7e\2\2\u00cd\u00ce\7n\2\2\u00ce"+
		"\u00cf\7c\2\2\u00cf\u00d0\7u\2\2\u00d0\u00d1\7u\2\2\u00d1\32\3\2\2\2\u00d2"+
		"\u00d3\7p\2\2\u00d3\u00d4\7g\2\2\u00d4\u00d5\7y\2\2\u00d5\34\3\2\2\2\u00d6"+
		"\u00d7\7v\2\2\u00d7\u00d8\7j\2\2\u00d8\u00d9\7k\2\2\u00d9\u00da\7u\2\2"+
		"\u00da\36\3\2\2\2\u00db\u00dc\7v\2\2\u00dc\u00dd\7t\2\2\u00dd\u00de\7"+
		"w\2\2\u00de\u00df\7g\2\2\u00df \3\2\2\2\u00e0\u00e1\7h\2\2\u00e1\u00e2"+
		"\7c\2\2\u00e2\u00e3\7n\2\2\u00e3\u00e4\7u\2\2\u00e4\u00e5\7g\2\2\u00e5"+
		"\"\3\2\2\2\u00e6\u00e7\7*\2\2\u00e7$\3\2\2\2\u00e8\u00e9\7+\2\2\u00e9"+
		"&\3\2\2\2\u00ea\u00eb\7]\2\2\u00eb(\3\2\2\2\u00ec\u00ed\7_\2\2\u00ed*"+
		"\3\2\2\2\u00ee\u00ef\7}\2\2\u00ef,\3\2\2\2\u00f0\u00f1\7\177\2\2\u00f1"+
		".\3\2\2\2\u00f2\u00f3\7>\2\2\u00f3\60\3\2\2\2\u00f4\u00f5\7>\2\2\u00f5"+
		"\u00f6\7?\2\2\u00f6\62\3\2\2\2\u00f7\u00f8\7@\2\2\u00f8\64\3\2\2\2\u00f9"+
		"\u00fa\7@\2\2\u00fa\u00fb\7?\2\2\u00fb\66\3\2\2\2\u00fc\u00fd\7>\2\2\u00fd"+
		"\u00fe\7>\2\2\u00fe8\3\2\2\2\u00ff\u0100\7@\2\2\u0100\u0101\7@\2\2\u0101"+
		":\3\2\2\2\u0102\u0103\7-\2\2\u0103<\3\2\2\2\u0104\u0105\7-\2\2\u0105\u0106"+
		"\7-\2\2\u0106>\3\2\2\2\u0107\u0108\7/\2\2\u0108@\3\2\2\2\u0109\u010a\7"+
		"/\2\2\u010a\u010b\7/\2\2\u010bB\3\2\2\2\u010c\u010d\7,\2\2\u010dD\3\2"+
		"\2\2\u010e\u010f\7\61\2\2\u010fF\3\2\2\2\u0110\u0111\7\'\2\2\u0111H\3"+
		"\2\2\2\u0112\u0113\7(\2\2\u0113J\3\2\2\2\u0114\u0115\7~\2\2\u0115L\3\2"+
		"\2\2\u0116\u0117\7(\2\2\u0117\u0118\7(\2\2\u0118N\3\2\2\2\u0119\u011a"+
		"\7~\2\2\u011a\u011b\7~\2\2\u011bP\3\2\2\2\u011c\u011d\7`\2\2\u011dR\3"+
		"\2\2\2\u011e\u011f\7#\2\2\u011fT\3\2\2\2\u0120\u0121\7\u0080\2\2\u0121"+
		"V\3\2\2\2\u0122\u0123\7<\2\2\u0123X\3\2\2\2\u0124\u0125\7=\2\2\u0125Z"+
		"\3\2\2\2\u0126\u0127\7.\2\2\u0127\\\3\2\2\2\u0128\u0129\7?\2\2\u0129^"+
		"\3\2\2\2\u012a\u012b\7?\2\2\u012b\u012c\7?\2\2\u012c`\3\2\2\2\u012d\u012e"+
		"\7#\2\2\u012e\u012f\7?\2\2\u012fb\3\2\2\2\u0130\u0131\7\60\2\2\u0131d"+
		"\3\2\2\2\u0132\u0137\5i\65\2\u0133\u0136\5i\65\2\u0134\u0136\5k\66\2\u0135"+
		"\u0133\3\2\2\2\u0135\u0134\3\2\2\2\u0136\u0139\3\2\2\2\u0137\u0135\3\2"+
		"\2\2\u0137\u0138\3\2\2\2\u0138f\3\2\2\2\u0139\u0137\3\2\2\2\u013a\u013d"+
		"\5\37\20\2\u013b\u013d\5!\21\2\u013c\u013a\3\2\2\2\u013c\u013b\3\2\2\2"+
		"\u013dh\3\2\2\2\u013e\u013f\t\2\2\2\u013fj\3\2\2\2\u0140\u0141\t\3\2\2"+
		"\u0141l\3\2\2\2\u0142\u0145\5o8\2\u0143\u0145\5g\64\2\u0144\u0142\3\2"+
		"\2\2\u0144\u0143\3\2\2\2\u0145n\3\2\2\2\u0146\u014a\5q9\2\u0147\u0149"+
		"\5k\66\2\u0148\u0147\3\2\2\2\u0149\u014c\3\2\2\2\u014a\u0148\3\2\2\2\u014a"+
		"\u014b\3\2\2\2\u014bp\3\2\2\2\u014c\u014a\3\2\2\2\u014d\u014e\t\4\2\2"+
		"\u014er\3\2\2\2\u014f\u0150\t\5\2\2\u0150t\3\2\2\2\u0151\u0153\5k\66\2"+
		"\u0152\u0151\3\2\2\2\u0153\u0154\3\2\2\2\u0154\u0152\3\2\2\2\u0154\u0155"+
		"\3\2\2\2\u0155v\3\2\2\2\u0156\u0157\7)\2\2\u0157\u0158\5y=\2\u0158\u0159"+
		"\7)\2\2\u0159x\3\2\2\2\u015a\u015c\5{>\2\u015b\u015a\3\2\2\2\u015c\u015d"+
		"\3\2\2\2\u015d\u015b\3\2\2\2\u015d\u015e\3\2\2\2\u015ez\3\2\2\2\u015f"+
		"\u0162\n\6\2\2\u0160\u0162\5}?\2\u0161\u015f\3\2\2\2\u0161\u0160\3\2\2"+
		"\2\u0162|\3\2\2\2\u0163\u0164\7^\2\2\u0164\u0165\t\7\2\2\u0165~\3\2\2"+
		"\2\u0166\u0168\7$\2\2\u0167\u0169\5\u0081A\2\u0168\u0167\3\2\2\2\u0168"+
		"\u0169\3\2\2\2\u0169\u016a\3\2\2\2\u016a\u016b\7$\2\2\u016b\u0080\3\2"+
		"\2\2\u016c\u016e\5\u0083B\2\u016d\u016c\3\2\2\2\u016e\u016f\3\2\2\2\u016f"+
		"\u016d\3\2\2\2\u016f\u0170\3\2\2\2\u0170\u0082\3\2\2\2\u0171\u0179\n\b"+
		"\2\2\u0172\u0179\5}?\2\u0173\u0174\7^\2\2\u0174\u0179\7\f\2\2\u0175\u0176"+
		"\7^\2\2\u0176\u0177\7\17\2\2\u0177\u0179\7\f\2\2\u0178\u0171\3\2\2\2\u0178"+
		"\u0172\3\2\2\2\u0178\u0173\3\2\2\2\u0178\u0175\3\2\2\2\u0179\u0084\3\2"+
		"\2\2\u017a\u017c\t\t\2\2\u017b\u017a\3\2\2\2\u017c\u017d\3\2\2\2\u017d"+
		"\u017b\3\2\2\2\u017d\u017e\3\2\2\2\u017e\u017f\3\2\2\2\u017f\u0180\bC"+
		"\2\2\u0180\u0086\3\2\2\2\u0181\u0183\7\17\2\2\u0182\u0184\7\f\2\2\u0183"+
		"\u0182\3\2\2\2\u0183\u0184\3\2\2\2\u0184\u0187\3\2\2\2\u0185\u0187\7\f"+
		"\2\2\u0186\u0181\3\2\2\2\u0186\u0185\3\2\2\2\u0187\u0188\3\2\2\2\u0188"+
		"\u0189\bD\2\2\u0189\u0088\3\2\2\2\u018a\u018b\7\61\2\2\u018b\u018c\7,"+
		"\2\2\u018c\u0190\3\2\2\2\u018d\u018f\13\2\2\2\u018e\u018d\3\2\2\2\u018f"+
		"\u0192\3\2\2\2\u0190\u0191\3\2\2\2\u0190\u018e\3\2\2\2\u0191\u0193\3\2"+
		"\2\2\u0192\u0190\3\2\2\2\u0193\u0194\7,\2\2\u0194\u0195\7\61\2\2\u0195"+
		"\u0196\3\2\2\2\u0196\u0197\bE\2\2\u0197\u008a\3\2\2\2\u0198\u0199\7\61"+
		"\2\2\u0199\u019a\7\61\2\2\u019a\u019e\3\2\2\2\u019b\u019d\n\n\2\2\u019c"+
		"\u019b\3\2\2\2\u019d\u01a0\3\2\2\2\u019e\u019c\3\2\2\2\u019e\u019f\3\2"+
		"\2\2\u019f\u01a1\3\2\2\2\u01a0\u019e\3\2\2\2\u01a1\u01a2\bF\2\2\u01a2"+
		"\u008c\3\2\2\2\23\2\u0135\u0137\u013c\u0144\u014a\u0154\u015d\u0161\u0168"+
		"\u016f\u0178\u017d\u0183\u0186\u0190\u019e\3\b\2\2";
	public static final ATN _ATN =
		new ATNDeserializer().deserialize(_serializedATN.toCharArray());
	static {
		_decisionToDFA = new DFA[_ATN.getNumberOfDecisions()];
		for (int i = 0; i < _ATN.getNumberOfDecisions(); i++) {
			_decisionToDFA[i] = new DFA(_ATN.getDecisionState(i), i);
		}
	}
}