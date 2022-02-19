import TokenType;
%%

WHITESPACE = [\t\n]+
DIGIT = [0-9]
INTEGER {DIGIT}+
LETTER = [a-zA-Z]
STRING = {LETTER}*
BRACK = "(" | ")"
CURLY_BRACK = "{" | "}"
Bool = "True" | "False"
ARITH_OPERATOR = "+" | "-" | "/" | "%" | "*"
LOGICAL_OPERATOR = "&&" | "||" | "!" | "!="
RELATIONAL_OPERATOR = "<"|">"|"<="|">="|"=="
UNARY_OPERATOR = "++"|"--"


%%

[ \t\n]+ {\\ignore whitespace}

{"//".*\n} {\\ignore single line comments}

{"##".*\n} {\\ignore single line comments}

. {
throw new Error("ERROR");
}

%%
 public static void main(String argv[]) throws IOException {
        Yylex yy = new Yylex(System.in);
        Yytoken t;
        while ((t = yy.yylex()) != null)
            System.out.println(t);
    }