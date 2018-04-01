// Generated from C:/Users/lxy98/IdeaProjects/MxStaro\MxStar.g4 by ANTLR 4.7
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
		Return=10, Void=11, While=12, Class=13, New=14, This=15, LeftParen=16, 
		RightParen=17, LeftBracket=18, RightBracket=19, LeftBrace=20, RightBrace=21, 
		Less=22, LessEqual=23, Greater=24, GreaterEqual=25, LeftShift=26, RightShift=27, 
		Plus=28, PlusPlus=29, Minus=30, MinusMinus=31, Star=32, Div=33, Mod=34, 
		And=35, Or=36, AndAnd=37, OrOr=38, Caret=39, Not=40, Tilde=41, Colon=42, 
		Semi=43, Comma=44, Assign=45, Equal=46, NotEqual=47, Dot=48, Identifier=49, 
		Constant=50, DigitSequence=51, StringLiteral=52, Whitespace=53, Newline=54, 
		BlockComment=55, LineComment=56;
	public static String[] channelNames = {
		"DEFAULT_TOKEN_CHANNEL", "HIDDEN"
	};

	public static String[] modeNames = {
		"DEFAULT_MODE"
	};

	public static final String[] ruleNames = {
		"Break", "Char", "Continue", "Else", "For", "If", "Inline", "Int", "String", 
		"Return", "Void", "While", "Class", "New", "This", "LeftParen", "RightParen", 
		"LeftBracket", "RightBracket", "LeftBrace", "RightBrace", "Less", "LessEqual", 
		"Greater", "GreaterEqual", "LeftShift", "RightShift", "Plus", "PlusPlus", 
		"Minus", "MinusMinus", "Star", "Div", "Mod", "And", "Or", "AndAnd", "OrOr", 
		"Caret", "Not", "Tilde", "Colon", "Semi", "Comma", "Assign", "Equal", 
		"NotEqual", "Dot", "Identifier", "Nondigit", "Digit", "Constant", "IntegerConstant", 
		"NonzeroDigit", "Sign", "DigitSequence", "CharacterConstant", "CCharSequence", 
		"CChar", "EscapeSequence", "StringLiteral", "SCharSequence", "SChar", 
		"Whitespace", "Newline", "BlockComment", "LineComment"
	};

	private static final String[] _LITERAL_NAMES = {
		null, "'break'", "'char'", "'continue'", "'else'", "'for'", "'if'", "'inline'", 
		"'int'", "'string'", "'return'", "'void'", "'while'", "'class'", "'new'", 
		"'this'", "'('", "')'", "'['", "']'", "'{'", "'}'", "'<'", "'<='", "'>'", 
		"'>='", "'<<'", "'>>'", "'+'", "'++'", "'-'", "'--'", "'*'", "'/'", "'%'", 
		"'&'", "'|'", "'&&'", "'||'", "'^'", "'!'", "'~'", "':'", "';'", "','", 
		"'='", "'=='", "'!='", "'.'"
	};
	private static final String[] _SYMBOLIC_NAMES = {
		null, "Break", "Char", "Continue", "Else", "For", "If", "Inline", "Int", 
		"String", "Return", "Void", "While", "Class", "New", "This", "LeftParen", 
		"RightParen", "LeftBracket", "RightBracket", "LeftBrace", "RightBrace", 
		"Less", "LessEqual", "Greater", "GreaterEqual", "LeftShift", "RightShift", 
		"Plus", "PlusPlus", "Minus", "MinusMinus", "Star", "Div", "Mod", "And", 
		"Or", "AndAnd", "OrOr", "Caret", "Not", "Tilde", "Colon", "Semi", "Comma", 
		"Assign", "Equal", "NotEqual", "Dot", "Identifier", "Constant", "DigitSequence", 
		"StringLiteral", "Whitespace", "Newline", "BlockComment", "LineComment"
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
		"\3\u608b\ua72a\u8133\ub9ed\u417c\u3be7\u7786\u5964\2:\u0195\b\1\4\2\t"+
		"\2\4\3\t\3\4\4\t\4\4\5\t\5\4\6\t\6\4\7\t\7\4\b\t\b\4\t\t\t\4\n\t\n\4\13"+
		"\t\13\4\f\t\f\4\r\t\r\4\16\t\16\4\17\t\17\4\20\t\20\4\21\t\21\4\22\t\22"+
		"\4\23\t\23\4\24\t\24\4\25\t\25\4\26\t\26\4\27\t\27\4\30\t\30\4\31\t\31"+
		"\4\32\t\32\4\33\t\33\4\34\t\34\4\35\t\35\4\36\t\36\4\37\t\37\4 \t \4!"+
		"\t!\4\"\t\"\4#\t#\4$\t$\4%\t%\4&\t&\4\'\t\'\4(\t(\4)\t)\4*\t*\4+\t+\4"+
		",\t,\4-\t-\4.\t.\4/\t/\4\60\t\60\4\61\t\61\4\62\t\62\4\63\t\63\4\64\t"+
		"\64\4\65\t\65\4\66\t\66\4\67\t\67\48\t8\49\t9\4:\t:\4;\t;\4<\t<\4=\t="+
		"\4>\t>\4?\t?\4@\t@\4A\tA\4B\tB\4C\tC\4D\tD\3\2\3\2\3\2\3\2\3\2\3\2\3\3"+
		"\3\3\3\3\3\3\3\3\3\4\3\4\3\4\3\4\3\4\3\4\3\4\3\4\3\4\3\5\3\5\3\5\3\5\3"+
		"\5\3\6\3\6\3\6\3\6\3\7\3\7\3\7\3\b\3\b\3\b\3\b\3\b\3\b\3\b\3\t\3\t\3\t"+
		"\3\t\3\n\3\n\3\n\3\n\3\n\3\n\3\n\3\13\3\13\3\13\3\13\3\13\3\13\3\13\3"+
		"\f\3\f\3\f\3\f\3\f\3\r\3\r\3\r\3\r\3\r\3\r\3\16\3\16\3\16\3\16\3\16\3"+
		"\16\3\17\3\17\3\17\3\17\3\20\3\20\3\20\3\20\3\20\3\21\3\21\3\22\3\22\3"+
		"\23\3\23\3\24\3\24\3\25\3\25\3\26\3\26\3\27\3\27\3\30\3\30\3\30\3\31\3"+
		"\31\3\32\3\32\3\32\3\33\3\33\3\33\3\34\3\34\3\34\3\35\3\35\3\36\3\36\3"+
		"\36\3\37\3\37\3 \3 \3 \3!\3!\3\"\3\"\3#\3#\3$\3$\3%\3%\3&\3&\3&\3\'\3"+
		"\'\3\'\3(\3(\3)\3)\3*\3*\3+\3+\3,\3,\3-\3-\3.\3.\3/\3/\3/\3\60\3\60\3"+
		"\60\3\61\3\61\3\62\3\62\3\62\7\62\u012c\n\62\f\62\16\62\u012f\13\62\3"+
		"\63\3\63\3\64\3\64\3\65\3\65\5\65\u0137\n\65\3\66\3\66\7\66\u013b\n\66"+
		"\f\66\16\66\u013e\13\66\3\67\3\67\38\38\39\69\u0145\n9\r9\169\u0146\3"+
		":\3:\3:\3:\3;\6;\u014e\n;\r;\16;\u014f\3<\3<\5<\u0154\n<\3=\3=\3=\3>\3"+
		">\5>\u015b\n>\3>\3>\3?\6?\u0160\n?\r?\16?\u0161\3@\3@\3@\3@\3@\3@\3@\5"+
		"@\u016b\n@\3A\6A\u016e\nA\rA\16A\u016f\3A\3A\3B\3B\5B\u0176\nB\3B\5B\u0179"+
		"\nB\3B\3B\3C\3C\3C\3C\7C\u0181\nC\fC\16C\u0184\13C\3C\3C\3C\3C\3C\3D\3"+
		"D\3D\3D\7D\u018f\nD\fD\16D\u0192\13D\3D\3D\3\u0182\2E\3\3\5\4\7\5\t\6"+
		"\13\7\r\b\17\t\21\n\23\13\25\f\27\r\31\16\33\17\35\20\37\21!\22#\23%\24"+
		"\'\25)\26+\27-\30/\31\61\32\63\33\65\34\67\359\36;\37= ?!A\"C#E$G%I&K"+
		"\'M(O)Q*S+U,W-Y.[/]\60_\61a\62c\63e\2g\2i\64k\2m\2o\2q\65s\2u\2w\2y\2"+
		"{\66}\2\177\2\u0081\67\u00838\u00859\u0087:\3\2\13\5\2C\\aac|\3\2\62;"+
		"\3\2\63;\4\2--//\6\2\f\f\17\17))^^\f\2$$))AA^^cdhhppttvvxx\6\2\f\f\17"+
		"\17$$^^\4\2\13\13\"\"\4\2\f\f\17\17\2\u019a\2\3\3\2\2\2\2\5\3\2\2\2\2"+
		"\7\3\2\2\2\2\t\3\2\2\2\2\13\3\2\2\2\2\r\3\2\2\2\2\17\3\2\2\2\2\21\3\2"+
		"\2\2\2\23\3\2\2\2\2\25\3\2\2\2\2\27\3\2\2\2\2\31\3\2\2\2\2\33\3\2\2\2"+
		"\2\35\3\2\2\2\2\37\3\2\2\2\2!\3\2\2\2\2#\3\2\2\2\2%\3\2\2\2\2\'\3\2\2"+
		"\2\2)\3\2\2\2\2+\3\2\2\2\2-\3\2\2\2\2/\3\2\2\2\2\61\3\2\2\2\2\63\3\2\2"+
		"\2\2\65\3\2\2\2\2\67\3\2\2\2\29\3\2\2\2\2;\3\2\2\2\2=\3\2\2\2\2?\3\2\2"+
		"\2\2A\3\2\2\2\2C\3\2\2\2\2E\3\2\2\2\2G\3\2\2\2\2I\3\2\2\2\2K\3\2\2\2\2"+
		"M\3\2\2\2\2O\3\2\2\2\2Q\3\2\2\2\2S\3\2\2\2\2U\3\2\2\2\2W\3\2\2\2\2Y\3"+
		"\2\2\2\2[\3\2\2\2\2]\3\2\2\2\2_\3\2\2\2\2a\3\2\2\2\2c\3\2\2\2\2i\3\2\2"+
		"\2\2q\3\2\2\2\2{\3\2\2\2\2\u0081\3\2\2\2\2\u0083\3\2\2\2\2\u0085\3\2\2"+
		"\2\2\u0087\3\2\2\2\3\u0089\3\2\2\2\5\u008f\3\2\2\2\7\u0094\3\2\2\2\t\u009d"+
		"\3\2\2\2\13\u00a2\3\2\2\2\r\u00a6\3\2\2\2\17\u00a9\3\2\2\2\21\u00b0\3"+
		"\2\2\2\23\u00b4\3\2\2\2\25\u00bb\3\2\2\2\27\u00c2\3\2\2\2\31\u00c7\3\2"+
		"\2\2\33\u00cd\3\2\2\2\35\u00d3\3\2\2\2\37\u00d7\3\2\2\2!\u00dc\3\2\2\2"+
		"#\u00de\3\2\2\2%\u00e0\3\2\2\2\'\u00e2\3\2\2\2)\u00e4\3\2\2\2+\u00e6\3"+
		"\2\2\2-\u00e8\3\2\2\2/\u00ea\3\2\2\2\61\u00ed\3\2\2\2\63\u00ef\3\2\2\2"+
		"\65\u00f2\3\2\2\2\67\u00f5\3\2\2\29\u00f8\3\2\2\2;\u00fa\3\2\2\2=\u00fd"+
		"\3\2\2\2?\u00ff\3\2\2\2A\u0102\3\2\2\2C\u0104\3\2\2\2E\u0106\3\2\2\2G"+
		"\u0108\3\2\2\2I\u010a\3\2\2\2K\u010c\3\2\2\2M\u010f\3\2\2\2O\u0112\3\2"+
		"\2\2Q\u0114\3\2\2\2S\u0116\3\2\2\2U\u0118\3\2\2\2W\u011a\3\2\2\2Y\u011c"+
		"\3\2\2\2[\u011e\3\2\2\2]\u0120\3\2\2\2_\u0123\3\2\2\2a\u0126\3\2\2\2c"+
		"\u0128\3\2\2\2e\u0130\3\2\2\2g\u0132\3\2\2\2i\u0136\3\2\2\2k\u0138\3\2"+
		"\2\2m\u013f\3\2\2\2o\u0141\3\2\2\2q\u0144\3\2\2\2s\u0148\3\2\2\2u\u014d"+
		"\3\2\2\2w\u0153\3\2\2\2y\u0155\3\2\2\2{\u0158\3\2\2\2}\u015f\3\2\2\2\177"+
		"\u016a\3\2\2\2\u0081\u016d\3\2\2\2\u0083\u0178\3\2\2\2\u0085\u017c\3\2"+
		"\2\2\u0087\u018a\3\2\2\2\u0089\u008a\7d\2\2\u008a\u008b\7t\2\2\u008b\u008c"+
		"\7g\2\2\u008c\u008d\7c\2\2\u008d\u008e\7m\2\2\u008e\4\3\2\2\2\u008f\u0090"+
		"\7e\2\2\u0090\u0091\7j\2\2\u0091\u0092\7c\2\2\u0092\u0093\7t\2\2\u0093"+
		"\6\3\2\2\2\u0094\u0095\7e\2\2\u0095\u0096\7q\2\2\u0096\u0097\7p\2\2\u0097"+
		"\u0098\7v\2\2\u0098\u0099\7k\2\2\u0099\u009a\7p\2\2\u009a\u009b\7w\2\2"+
		"\u009b\u009c\7g\2\2\u009c\b\3\2\2\2\u009d\u009e\7g\2\2\u009e\u009f\7n"+
		"\2\2\u009f\u00a0\7u\2\2\u00a0\u00a1\7g\2\2\u00a1\n\3\2\2\2\u00a2\u00a3"+
		"\7h\2\2\u00a3\u00a4\7q\2\2\u00a4\u00a5\7t\2\2\u00a5\f\3\2\2\2\u00a6\u00a7"+
		"\7k\2\2\u00a7\u00a8\7h\2\2\u00a8\16\3\2\2\2\u00a9\u00aa\7k\2\2\u00aa\u00ab"+
		"\7p\2\2\u00ab\u00ac\7n\2\2\u00ac\u00ad\7k\2\2\u00ad\u00ae\7p\2\2\u00ae"+
		"\u00af\7g\2\2\u00af\20\3\2\2\2\u00b0\u00b1\7k\2\2\u00b1\u00b2\7p\2\2\u00b2"+
		"\u00b3\7v\2\2\u00b3\22\3\2\2\2\u00b4\u00b5\7u\2\2\u00b5\u00b6\7v\2\2\u00b6"+
		"\u00b7\7t\2\2\u00b7\u00b8\7k\2\2\u00b8\u00b9\7p\2\2\u00b9\u00ba\7i\2\2"+
		"\u00ba\24\3\2\2\2\u00bb\u00bc\7t\2\2\u00bc\u00bd\7g\2\2\u00bd\u00be\7"+
		"v\2\2\u00be\u00bf\7w\2\2\u00bf\u00c0\7t\2\2\u00c0\u00c1\7p\2\2\u00c1\26"+
		"\3\2\2\2\u00c2\u00c3\7x\2\2\u00c3\u00c4\7q\2\2\u00c4\u00c5\7k\2\2\u00c5"+
		"\u00c6\7f\2\2\u00c6\30\3\2\2\2\u00c7\u00c8\7y\2\2\u00c8\u00c9\7j\2\2\u00c9"+
		"\u00ca\7k\2\2\u00ca\u00cb\7n\2\2\u00cb\u00cc\7g\2\2\u00cc\32\3\2\2\2\u00cd"+
		"\u00ce\7e\2\2\u00ce\u00cf\7n\2\2\u00cf\u00d0\7c\2\2\u00d0\u00d1\7u\2\2"+
		"\u00d1\u00d2\7u\2\2\u00d2\34\3\2\2\2\u00d3\u00d4\7p\2\2\u00d4\u00d5\7"+
		"g\2\2\u00d5\u00d6\7y\2\2\u00d6\36\3\2\2\2\u00d7\u00d8\7v\2\2\u00d8\u00d9"+
		"\7j\2\2\u00d9\u00da\7k\2\2\u00da\u00db\7u\2\2\u00db \3\2\2\2\u00dc\u00dd"+
		"\7*\2\2\u00dd\"\3\2\2\2\u00de\u00df\7+\2\2\u00df$\3\2\2\2\u00e0\u00e1"+
		"\7]\2\2\u00e1&\3\2\2\2\u00e2\u00e3\7_\2\2\u00e3(\3\2\2\2\u00e4\u00e5\7"+
		"}\2\2\u00e5*\3\2\2\2\u00e6\u00e7\7\177\2\2\u00e7,\3\2\2\2\u00e8\u00e9"+
		"\7>\2\2\u00e9.\3\2\2\2\u00ea\u00eb\7>\2\2\u00eb\u00ec\7?\2\2\u00ec\60"+
		"\3\2\2\2\u00ed\u00ee\7@\2\2\u00ee\62\3\2\2\2\u00ef\u00f0\7@\2\2\u00f0"+
		"\u00f1\7?\2\2\u00f1\64\3\2\2\2\u00f2\u00f3\7>\2\2\u00f3\u00f4\7>\2\2\u00f4"+
		"\66\3\2\2\2\u00f5\u00f6\7@\2\2\u00f6\u00f7\7@\2\2\u00f78\3\2\2\2\u00f8"+
		"\u00f9\7-\2\2\u00f9:\3\2\2\2\u00fa\u00fb\7-\2\2\u00fb\u00fc\7-\2\2\u00fc"+
		"<\3\2\2\2\u00fd\u00fe\7/\2\2\u00fe>\3\2\2\2\u00ff\u0100\7/\2\2\u0100\u0101"+
		"\7/\2\2\u0101@\3\2\2\2\u0102\u0103\7,\2\2\u0103B\3\2\2\2\u0104\u0105\7"+
		"\61\2\2\u0105D\3\2\2\2\u0106\u0107\7\'\2\2\u0107F\3\2\2\2\u0108\u0109"+
		"\7(\2\2\u0109H\3\2\2\2\u010a\u010b\7~\2\2\u010bJ\3\2\2\2\u010c\u010d\7"+
		"(\2\2\u010d\u010e\7(\2\2\u010eL\3\2\2\2\u010f\u0110\7~\2\2\u0110\u0111"+
		"\7~\2\2\u0111N\3\2\2\2\u0112\u0113\7`\2\2\u0113P\3\2\2\2\u0114\u0115\7"+
		"#\2\2\u0115R\3\2\2\2\u0116\u0117\7\u0080\2\2\u0117T\3\2\2\2\u0118\u0119"+
		"\7<\2\2\u0119V\3\2\2\2\u011a\u011b\7=\2\2\u011bX\3\2\2\2\u011c\u011d\7"+
		".\2\2\u011dZ\3\2\2\2\u011e\u011f\7?\2\2\u011f\\\3\2\2\2\u0120\u0121\7"+
		"?\2\2\u0121\u0122\7?\2\2\u0122^\3\2\2\2\u0123\u0124\7#\2\2\u0124\u0125"+
		"\7?\2\2\u0125`\3\2\2\2\u0126\u0127\7\60\2\2\u0127b\3\2\2\2\u0128\u012d"+
		"\5e\63\2\u0129\u012c\5e\63\2\u012a\u012c\5g\64\2\u012b\u0129\3\2\2\2\u012b"+
		"\u012a\3\2\2\2\u012c\u012f\3\2\2\2\u012d\u012b\3\2\2\2\u012d\u012e\3\2"+
		"\2\2\u012ed\3\2\2\2\u012f\u012d\3\2\2\2\u0130\u0131\t\2\2\2\u0131f\3\2"+
		"\2\2\u0132\u0133\t\3\2\2\u0133h\3\2\2\2\u0134\u0137\5k\66\2\u0135\u0137"+
		"\5s:\2\u0136\u0134\3\2\2\2\u0136\u0135\3\2\2\2\u0137j\3\2\2\2\u0138\u013c"+
		"\5m\67\2\u0139\u013b\5g\64\2\u013a\u0139\3\2\2\2\u013b\u013e\3\2\2\2\u013c"+
		"\u013a\3\2\2\2\u013c\u013d\3\2\2\2\u013dl\3\2\2\2\u013e\u013c\3\2\2\2"+
		"\u013f\u0140\t\4\2\2\u0140n\3\2\2\2\u0141\u0142\t\5\2\2\u0142p\3\2\2\2"+
		"\u0143\u0145\5g\64\2\u0144\u0143\3\2\2\2\u0145\u0146\3\2\2\2\u0146\u0144"+
		"\3\2\2\2\u0146\u0147\3\2\2\2\u0147r\3\2\2\2\u0148\u0149\7)\2\2\u0149\u014a"+
		"\5u;\2\u014a\u014b\7)\2\2\u014bt\3\2\2\2\u014c\u014e\5w<\2\u014d\u014c"+
		"\3\2\2\2\u014e\u014f\3\2\2\2\u014f\u014d\3\2\2\2\u014f\u0150\3\2\2\2\u0150"+
		"v\3\2\2\2\u0151\u0154\n\6\2\2\u0152\u0154\5y=\2\u0153\u0151\3\2\2\2\u0153"+
		"\u0152\3\2\2\2\u0154x\3\2\2\2\u0155\u0156\7^\2\2\u0156\u0157\t\7\2\2\u0157"+
		"z\3\2\2\2\u0158\u015a\7$\2\2\u0159\u015b\5}?\2\u015a\u0159\3\2\2\2\u015a"+
		"\u015b\3\2\2\2\u015b\u015c\3\2\2\2\u015c\u015d\7$\2\2\u015d|\3\2\2\2\u015e"+
		"\u0160\5\177@\2\u015f\u015e\3\2\2\2\u0160\u0161\3\2\2\2\u0161\u015f\3"+
		"\2\2\2\u0161\u0162\3\2\2\2\u0162~\3\2\2\2\u0163\u016b\n\b\2\2\u0164\u016b"+
		"\5y=\2\u0165\u0166\7^\2\2\u0166\u016b\7\f\2\2\u0167\u0168\7^\2\2\u0168"+
		"\u0169\7\17\2\2\u0169\u016b\7\f\2\2\u016a\u0163\3\2\2\2\u016a\u0164\3"+
		"\2\2\2\u016a\u0165\3\2\2\2\u016a\u0167\3\2\2\2\u016b\u0080\3\2\2\2\u016c"+
		"\u016e\t\t\2\2\u016d\u016c\3\2\2\2\u016e\u016f\3\2\2\2\u016f\u016d\3\2"+
		"\2\2\u016f\u0170\3\2\2\2\u0170\u0171\3\2\2\2\u0171\u0172\bA\2\2\u0172"+
		"\u0082\3\2\2\2\u0173\u0175\7\17\2\2\u0174\u0176\7\f\2\2\u0175\u0174\3"+
		"\2\2\2\u0175\u0176\3\2\2\2\u0176\u0179\3\2\2\2\u0177\u0179\7\f\2\2\u0178"+
		"\u0173\3\2\2\2\u0178\u0177\3\2\2\2\u0179\u017a\3\2\2\2\u017a\u017b\bB"+
		"\2\2\u017b\u0084\3\2\2\2\u017c\u017d\7\61\2\2\u017d\u017e\7,\2\2\u017e"+
		"\u0182\3\2\2\2\u017f\u0181\13\2\2\2\u0180\u017f\3\2\2\2\u0181\u0184\3"+
		"\2\2\2\u0182\u0183\3\2\2\2\u0182\u0180\3\2\2\2\u0183\u0185\3\2\2\2\u0184"+
		"\u0182\3\2\2\2\u0185\u0186\7,\2\2\u0186\u0187\7\61\2\2\u0187\u0188\3\2"+
		"\2\2\u0188\u0189\bC\2\2\u0189\u0086\3\2\2\2\u018a\u018b\7\61\2\2\u018b"+
		"\u018c\7\61\2\2\u018c\u0190\3\2\2\2\u018d\u018f\n\n\2\2\u018e\u018d\3"+
		"\2\2\2\u018f\u0192\3\2\2\2\u0190\u018e\3\2\2\2\u0190\u0191\3\2\2\2\u0191"+
		"\u0193\3\2\2\2\u0192\u0190\3\2\2\2\u0193\u0194\bD\2\2\u0194\u0088\3\2"+
		"\2\2\22\2\u012b\u012d\u0136\u013c\u0146\u014f\u0153\u015a\u0161\u016a"+
		"\u016f\u0175\u0178\u0182\u0190\3\b\2\2";
	public static final ATN _ATN =
		new ATNDeserializer().deserialize(_serializedATN.toCharArray());
	static {
		_decisionToDFA = new DFA[_ATN.getNumberOfDecisions()];
		for (int i = 0; i < _ATN.getNumberOfDecisions(); i++) {
			_decisionToDFA[i] = new DFA(_ATN.getDecisionState(i), i);
		}
	}
}