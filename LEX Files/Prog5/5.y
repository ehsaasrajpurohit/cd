%{
    #include <stdio.h>
    #include <stdlib.h>
    void yyerror(const char* s);
    int yylex();
    int count = 0;
    extern FILE* yyin;
%}

%token ID NUM TYPE

%%

program : declarations;
declarations : declaration | declaration declarations;
declaration : TYPE A B ';' ;

A : ID {count++;} | ID '[' ']' {count++;} | ID '[' NUM ']' {count++;};
B : ',' A B | {};

%%

void yyerror(const char* s){
    fprintf(stderr, "Invalid!\n");
    exit(1);
}

int main(){
    yyin = fopen("input.txt", "r");
    if(yyparse() == 0)  printf("Total Num Of Variables -> %d \n", count);
    return 0;
}