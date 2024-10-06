%{
    #include <stdio.h>
    #include <stdlib.h>
    int yylex();
    void yyerror(const char* s);
%}

%token NUM ID TYPE RETURN
%right '='
%left '+' '-'
%left '/' '*'

%%

S: F {printf("Successful\n"); exit(0);};

F: TYPE ID '(' PARAM ')' '{' BODY '}';

PARAM: /*empty*/ | TYPE ID | PARAM ',' TYPE ID;

BODY: STMT | BODY STMT;

STMT: PARAM ';'
    | E ';'
    | RETURN E ';';

E: ID '=' E
  | E '+' E 
  | E '-' E 
  | E '*' E
  | E '/' E
  | '(' E ')'   /* Added parentheses */
  | NUM
  | ID
  ;

%%

void yyerror(const char* s){
    fprintf(stderr, "ERROR\n");
    exit(1);
}

int main(){
    printf("Function: ");
    yyparse();
    return 0;
}
