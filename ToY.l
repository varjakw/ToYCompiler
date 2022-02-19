import TokenType;
%%
Whitespace = [\t\n]+
DIGIT = [0-9]
INTEGER {DIGIT}+
LETTER = [a-zA-Z]
BRACK = "(" | ")"
CURLY_BRACK = "{" | "}"
Bool = "True" | "False"
ARITH_OPERATOR = "+" | "-" | "/" | "%" | "*"
LOGICAL_OPERATOR = "&&" | "||" | "!" | "!="
RELATIONAL_OPERATOR = "<"|">"|"<="|">="|"=="
UNARY_OPERATOR = "++"|"--"


%%
(a|b)*abb {System.out.printf("*** found match [%s] at line %d, column %d\n", yytext(), yyline, yycolumn);
}

{Whitespace} {System.out.print("We got whitespace yo")}



. {
throw new Error("anna oop, ERROR");
}

%%
 public static void main(String argv[]) throws IOException {
        Yylex yy = new Yylex(System.in);
        Yytoken t;
        while ((t = yy.yylex()) != null)
            System.out.println(t);
    }