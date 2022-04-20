%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#included "ast.h" //AST
#include "driver.h"
void yyerror(char *i);
%}

//semantic record
%}
%union
{
	int integerval;		//integer constants
	float floatval		//float constants
	char *identifier;		//identifiers

	//structs here
}

//tokens
//precedence of operators
%left ADD SUB
%left MUL DIV

%left GT LT EQUAL NOT_EQ LTE GTE

%token COLON

%token INT FLOAT IF ELSE 

%token BOOL TRUE FALSE VOID PRINTF STRING STRUCT THEN  FOR RETURN

%token EQUAL_DOUBLE RIGHT_ARROW NOT LEFT_BRACK RIGHT_BRACK

%token MOD AND OR LEFT_CURLY_BRACK RIGHT_CURLY_BRACK COLON RIGHT LEFT

//identifier
%token <identifier> ID

//rule types
%type <type> type
%type <declaration> declaration
%type <expr> expr
%type <stmt> statement
%type <compound_statement>   compound_statement


//structure of program
<pgm> ::= <proc> <pgm'>
      | <struct> <pgm>

<pgm'> ::= # empty seq
      |<proc> <pgnm'>
      | <struct> <pgm'>


//grammatical rules ::= "is a/becomes", | "or".

<type> ::= int | bool | string | <id>

<return-type> ::= <type> | void

<struct> ::= struct <id> { <declaration>, <declaration>,...}

<declaration> ::= <type> <id>

<proc> ::= <return-type> <id> ( <declaration>,...) {<statement>}

<stmt> ::= for (<id>) = <expr>; <expr>; <statement>) <statement>
         |if (<expr>) then <statement>
         | if (<expr>) then <statement> else <statement>
         | print (<string>);
         | return <expr>;
         | {<compound-statement> }
         | <type> <identifier>;
         | <1-exp> = <expr>;
         | <id>(<expr>,...);
         | id = <id>(<expr>,...);

<compound_statement> ::= #empty seq
                     | <stmt> <compound_statement>

<1-exp> ::= <id> | <id> . <1-exp>

<exp> ::= <int>
		| <string>
      | true
      | false
      |<exp> <op> <exp>
      | - <exp>
      | ! <exp>
      | <1-exp>
      | ( <exp> )

<op> ::= + | - | * | / | mod | and | or | == | > | < | >= | <= | !=
*/

//statement
statement: declaration SEMICOLON { $$ = (struct ast_node *) $1; }
         | expression SEMICOLON  { $$ = (struct ast_node *) $1; }
         | assignment SEMICOLON  { $$ = (struct ast_node *) $1; }
         | selection_statement   { $$ = (struct ast_node *) $1; }
         | while_statement       { $$ = (struct ast_node *) $1; }
         ;
//change::::

//identifier
primary_expression: IDENTIFIER {
   $$ = create_expression(AST_IDENTIFIER, NULL, NULL);
   $$->primary_expr.identifier = $1;
}
| INT_CONSTANT {
   $$ = create_expression(AST_INT_CONSTANT, NULL, NULL);
   $$->primary_expr.int_constant = $1;
}
| FLOAT_CONSTANT {
   $$ = create_expression(AST_FLOAT_CONSTANT, NULL, NULL);
   $$->primary_expr.float_constant = $1;
};

 /* variable declaration rules */
declaration: type_specifier IDENTIFIER {
   $$ = create_declaration($1, $2);
}
;

type_specifier: KW_INT     { $$ = TYPE_INT;     }
              | KW_FLOAT   { $$ = TYPE_FLOAT;   }
              ;

//arithmetic
expression: expression ADD expression {
   $$ = create_expression(AST_ADD, $1, $3);
}
| expression SUB expression {
   $$ = create_expression(AST_SUB, $1, $3);
}
| expression MUL expression {
   $$ = create_expression(AST_MUL, $1, $3);
}
| expression DIV expression {
   $$ = create_expression(AST_DIV, $1, $3);
}
| expression GT  expression {
   $$ = create_expression(AST_GT, $1, $3);
}
| expression LT  expression {
   $$ = create_expression(AST_LT, $1, $3);
}
| expression EQ  expression {
   $$ = create_expression(AST_EQ, $1, $3);
}
| expression NOT_EQ  expression {
   $$ = create_expression(AST_NE, $1, $3);
};

%%
void
yyerror(char *s)
{
   printf("%s\n", s);
}

int main(int argc, char *argv[])
{
   yyparse();
   return 0;
}

