%option noyywrap

%{
    #include <stdio.h>
    int nc = 0;
%}

%%

"/*"[a-zA-Z0-9\t\n ]*"*/" {nc++;};
"//"[a-zA-Z0-9\t ]*\n {nc++; fprintf(yyout, "\n");};
. {fprintf(yyout, "%s", yytext);};
\n return 0;

%%

int main(){
    yyin = fopen("input.txt", "r");
    yyout = fopen("output.txt", "w");
    yylex();
    printf("Comments -> %d", nc);
    fclose(yyin);
    fclose(yyout);
    return 0;
}