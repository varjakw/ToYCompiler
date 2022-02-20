import TokenType;
%%

WHITESPACE          = [\t\n]+
DIGIT               = [0-9]
INTEGER               {DIGIT}+
LETTER              = [a-zA-Z]
STRING              = {LETTER}*
LEFT_BRACK          = "("
RIGHT_BRACK         = ")"
LEFT_CURLY_BRACK    = "{"
RIGHT_CURLY_BRACK   = "}"
BOOL                = "True" | "False"
ARITH_OPERATOR      = "+" | "-" | "/" | "%" | "*"
LOGICAL_OPERATOR    = "&&" | "||" | "!" | "!="
RELATIONAL_OPERATOR = "<"|">"|"<="|">="|"=="
UNARY_OPERATOR      = "++"|"--"
KEYWORD             = "bool"|"int"|"true"|"false"|"void"|"printf"|"string"|"struct"|"if"|"then"|"else"|"for"|"return"
IDENTIFIER          = [(^KEYWORD)|_|LETTER][LETTER|DIGIT|_]*    //TODO: I have a feeling this doesnt work
INTEGER_LITERAL     = "-"{INTEGER}                              //TODO: Set min/max

// Tell JLex to have yylex() return a Token
%type Token
// Tell JLex to name the generate class Lexer
%class Lexer
// Tell JLex what to return when eof of file is hit
%eofval {
return new Token(null); %
eofval }

%%

{"//".*\n} {\\ignore single line comments}

{"##".*\n} {\\ignore single line comments}

 {KEYWORD}                      { return TokenType.KEYWORD.ordinal(); }
 {STRING}                       { return TokenType.STRING.ordinal(); }
 {IDENTIFIER}                   { return TokenType.IDENTIFIER.ordinal(); }
 {INTEGER}                      { return TokenType.INTEGER.ordinal(); }
 {ARITH_OPERATOR}               { return TokenType.OPERATOR.ordinal(); }
 {LOGICAL_OPERATOR}             { return TokenType.OPERATOR.ordinal(); }
 {RELATIONAL_OPERATOR}          { return TokenType.OPERATOR.ordinal(); }
 {UNARY_OPERATOR}               { return TokenType.OPERATOR.ordinal(); }
 {LEFT_BRACK}                   { return TokenType.LEFT_BRACK.ordinal(); }
 {RIGHT_BRACK}                  { return TokenType.RIGHT_BRACK.ordinal(); }
 {LEFT_CURLY_BRACK}             { return TokenType.LEFT_CURLY_BRACK.ordinal(); }
 {RIGHT_CURLY_BRACK}            { return TokenType.RIGHT_CURLY_BRACK.ordinal(); }
 {WHITESPACE}                   { /* Ignore */ }


. {
throw new Error("ERROR: " + yytext());
}

%%
 public static void main(String argv[]) throws IOException {
        Yylex yy = new Yylex(System.in);
        Yytoken t;
        while ((t = yy.yylex()) != null)
            System.out.println(t);
 }
