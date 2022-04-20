#ifndef ast_h
#define ast_h

struct node;
struct declaration;
struct type;
struct expr;
struct compound_statement;
struct statement_list;

#define NODE                    1
#define TYPE 2
#define DECLARATION             3
#define EXPR              4
#define COMPOUND_STATEMENT      5
#define STATEMENT_LIST 6

struct node {
   int tag;
};

struct declaration {
   int tag;
   int type;
   const char *identifier;
};

struct expr {
   int tag;

#define ADD            1   
#define SUB            2    
#define MUL            3   
#define DIV            4    
#define GT             5    
#define LT             6   
#define EQ             7     
#define NE             8    
#define LE             9     
#define GE             10    
#define EQUAL         11    
#define ID     12

   int operator;
   struct expr *subexpr[2];
   union {
      const char *identifier;
   } expr;
};

struct compound_statement {
   int tag;

   struct ast_statement_list *statement_list;
};

struct declaration *
create_declaration(int type, const char *identifier);

struct expr *
create_expr(int operation, struct ast_expr *lhs,
                                 struct ast_expr *rhs);

struct compound_statement *
create_cs(struct statement_list *statement_list);

void
print_node(struct node *node);

#endif