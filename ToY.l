%%
Whitespace = [\t\n]+
%%
(a|b)*abb {System.out.printf("*** found match [%s] at line %d, column %d\n", yytext(), yyline, yycolumn);
}

{Whitespace} {System.out.print("We got whitespace yo")}