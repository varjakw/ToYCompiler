import TokenType;
%%

WHITESPACE          = [\t\n]+
DIGIT               = [0-9]
INTEGER             = {DIGIT}+
LETTER              = [a-zA-Z]
STRING              = {LETTER}*

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


 {INTEGER}                      { return TokenType.INTEGER.ordinal(); }
 {WHITESPACE}                   { /* Ignore */ }


"bool"			{ count(); return(BOOL); }
"int"			{ count(); return(INT); }
"true"			{ count(); return(TRUE); }
"false"			{ count(); return(FALSE); }
"void"		{ count(); return(VOID); }
"printf"			{ count(); return(PRINTF); }
"string"		{ count(); return(STRING); }
"struct"		{ count(); return(STRUCT); }
"if"			{ count(); return(IF); }
"then"		{ count(); return(THEN); }
"else"			{ count(); return(ELSE); }
"for"			{ count(); return(FOR); }
"return"			{ count(); return(RETURN); }
"mod"			{ count(); return(MOD); }
"and"		{ count(); return(AND); }
"or"		{ count(); return(OR); }

("{"|"<%")		{ count(); return(LEFT_CURLY_BRACK); }
("}"|"%>")		{ count(); return(RIGHT_CURLY_BRACK); }
";"			{ count(); return(COLON); }
">"			{ count(); return(RIGHT); }
"<"			{ count(); return(LEFT); }
"=="			{ count(); return(EQUAL_DOUBLE); }
"<-"			{ count(); return(LEFT_ARROW); }
">-"			{ count(); return(RIGHT_ARROW); }
"!="			{ count(); return(NOT_EQ); }
"!"			{ count(); return(NOT); }
"("			{ count(); return(LEFT_BRACK); }
")"			{ count(); return(RIGHT_BRACK); }
"+"			{ count(); return(ADD); }
"-"			{ count(); return(SUB); }
"."			{ count(); return(DOT); }
"="			{ count(); return(EQUAL); }
"*"			{ count(); return(MUL); }
"/"			{ count(); return(DIV); }
"<="			{ count(); return(LT); }
">="			{ count(); return(GT); }

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
