%{
/* C++ friendly includes and globals */
#include <vector>
#include <string>
#include <cstdlib>
#include <cstdio>
#include <cstring>
#include "item.h"

std::vector<Item> records;
std::vector<KeyValue> keyvalues;

/* forward decl of yylex and yyerror */
extern "C" int yylex(void);
extern "C" int yyparse(void);
extern "C" void yyerror(const char* s);
%}

/* Use C union for semantic values */
%union {
  char* str;
  double num;
}

/* tokens with types */
%token <str> IDENT
%token <str> NUMBER
%token LE

%type <num> condition

%%

input:
    /* empty */
  | input line
  ;

line:
    NUMBER ':' condition {
        int label = atoi($1);
        double upper = $3;
        records.push_back(Item{upper, label});
        free($1);
      }
  | IDENT ':' IDENT {
        /* Handle generic key:value pairs */
        KeyValue kv;
        kv.key = $1;
        kv.value = $3;
        keyvalues.push_back(kv);
      }
  ;

condition:
    IDENT LE NUMBER {
        /* pattern: Score <= 40  -> upper = 40 */
        $$ = atof($3);
        free($3);
      }
  | NUMBER '<' IDENT LE NUMBER {
        /* pattern: 40 < Score <= 55 -> upper = 55 */
        $$ = atof($5);
        free($1); free($5);
      }
  ;

%%

/* error handler */
extern "C" void yyerror(const char* s) {
  fprintf(stderr, "Parse error: %s\n", s);
}