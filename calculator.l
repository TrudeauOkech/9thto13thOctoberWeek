%{
#include "calculator.tab.h"
%}

%%


[0-9]+     { yylval = atoi(yytext); return NUMBER; }
[-+*/()]  { return *yytext; }
[ \t\n]    ;  // Ignore whitespace and newline

.   { fprintf(stderr, "Invalid character: %s\n", yytext); }

%%

int main() {
    yyparse();
    return 0;
}
