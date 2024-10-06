%{
    #include <stdio.h>
    #include <stdlib.h>
    void yyerror(const char * s);
    int yylex();
    int count = 0;
%}

%token FOR EXP NUM INC DEC LE GE

%start S

%%

S : I
I : FOR A B {count++;};
A : '(' E ';' E ';' E ')';
B : '{' B '}' | I | E | /*empty*/;
E : EXP Z EXP | EXP Z NUM | EXP INC | EXP DEC | INC EXP | DEC EXP;
Z : '>' | '<' | '=' | LE | GE;

%%

void yyerror(const char* s){
    fprintf(stderr, "Invalid!\n");
    exit(1);
}

int main(){
    if(yyparse()==0)    printf("Nested FORs -> %d\n", count);
    return 0;
}