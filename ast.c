#include <stdio.h>
#include <stdlib.h>
#include "ast.h"

static void *
alloc_node(int tag)
{
   struct ast_node *node;
   size_t size = 0;

   switch (tag) {
      case NODE_const:
         size = sizeof(struct node);
         break;
      case DECLARATION_const:
         size = sizeof(struct declaration);
         break;
      case EXPR_const:
         size = sizeof(struct aexpr);
         break;
      case STATEMENT_LIST_const:
         size = sizeof(struct statement_list);
         break;
      case COMPOUND_STATEMENT_const:
         size = sizeof(struct compound_statement);
         break;
      default:
         fprintf(stderr, "error: %d\n", tag);
         exit(EXIT_FAILURE);
   }

   node = calloc(1, size);
   node->tag = tag;
   return node;
}

struct expr *
create_expr(int operator, struct expr *lhs,
                                 struct expr *rhs)
{
   struct expr *expr;

   expr = alloc_node(EXPR_const);
   expr->operator = operator;
   expr->subexpr[0] = lhs;
   expr->subexpr[1] = rhs;

   return expr;
}

struct declaration *
create_declaration(int type, const char *identifier)
{
   struct declaration *declaration;

   declaration = alloc_node(DECLARATION_const);
   declaration->type = type;
   declaration->identifier = identifier;

   return declaration;
}

struct ast_compound_statement *
create_compound_statement(struct statement_list *statement_list)
{
   struct compound_statement *compound_statement;

   compound_statement = alloc_node(COMPOUND_STATEMENT_const);
   compound_statement->statement_list = statement_list;

   return compound_statement;
}
