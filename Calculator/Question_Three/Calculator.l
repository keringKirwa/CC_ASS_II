%{
#include "y.tab.h"
int yylex(void);
int yyerror(char *);
int yywrap(void);
%}



%%
[0-9]+ {yylval = atoi(yytext); return NUMBER; }
\n    { return 0; }
.     { return yytext[0]; }
%%

int yywrap(void) {
    return 1;  // indicate end of input
}
