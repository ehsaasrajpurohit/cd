%{
    #include <stdio.h>
    #include <stdlib.h>
    void yyerror(const char * s);
    int yylex();
    int count = 0;
%}

%token IF EXP NUM
%start S

%%

S : I;
I : IF A B {count++;};
A : '(' EXP ')' | '(' NUM ')';
B : '{' B '}' | I | /*empty*/;

%%

void yyerror(const char* s){
    fprintf(stderr, "Invalid!\n");
    exit(1);
}

int main(){
    if(yyparse()==0)    printf("Num of IF statements -> %d", count);
    return 0;
}