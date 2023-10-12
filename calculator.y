%{
#include <stdio.h>
%}

%token NUMBER

%%

expression: NUMBER
    | expression '+' expression   { $$ = $1 + $3; }
    | expression '-' expression   { $$ = $1 - $3; }
    | expression '*' expression   { $$ = $1 * $3; }
    | expression '/' expression   { if ($3 != 0) $$ = $1 / $3; else $$ = 0; }
    | '(' expression ')'          { $$ = $2; }
    ;

%%

int yyerror(char* message) {
    fprintf(stderr, "Error: %s\n", message);
    return 1;
}

int main() {
    yyparse();
    return 0;
}
