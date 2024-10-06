%option noyywrap

%{
    #include <stdio.h>
    int kwd = 0;
    int id = 0;
    int oprt = 0;
%}

%%

"int" {kwd++;};
"float" {kwd++;};
"char" {kwd++;};
[+-/\*=] {oprt++;};
[_a-zA-Z]+[_a-zA-Z0-9]* {id++;};
\n {/*ignore*/};
. {/*ignore everything else*/};

%%

int main(){
    yyin = fopen("input.txt", "r");
    yylex();
    printf("Keywords -> %d \nOperator -> %d\nIdentifier -> %d\n", kwd, oprt, id);
    return 0;
}