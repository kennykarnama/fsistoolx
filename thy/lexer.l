%option noyywrap
%{
#include "parser.hpp"
#include "item.h"
#include <string.h>
%}

DIGIT   [0-9]
ID      [A-Za-z_][A-Za-z0-9_]*
WS      [ \t\r\n]+
NUM     {DIGIT}+(\.{DIGIT}+)?

%%

{WS}                ;
":"                 return ':';
"<="                return LE;
"<"                 return '<';
{NUM}               {
                      yylval.str = strdup(yytext);
                      return NUMBER;
                    }
{ID}                {
                      yylval.str = strdup(yytext);
                      return IDENT;
                    }
.                   { return yytext[0]; }
%%