%{
    #include <stdio.h>
    #include <stdlib.h>
    void yyerror(const char * s);
    int yylex();
%}

%token NUM
%left '+' '-'
%left '*' '/'

%%

S : I {printf("Result -> %d \n", $1);};
I : I '+' I {$$ = $1 + $3;}
  | I '-' I {$$ = $1 - $3;}
  | I '*' I {$$ = $1 * $3;}
  | I '/' I {$$ = $1 / $3;}
  | '('I')' {$$ = $2;}
  | NUM;

%%

void yyerror(const char * s){
    fprintf(stderr, "Invalid!\n");
    exit(1);
}

int main(){
    if(yyparse() == 0)  printf("Valid!\n");
    return 0;
}