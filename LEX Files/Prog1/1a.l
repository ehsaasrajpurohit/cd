%option noyywrap

%{
    int w = 0;
    int c = 0;
    int l = 0;
    int s = 0;
%}

%%

[a-zA-Z]+ {w++; c += yyleng;};
[.] l++;
[ \t] s += (yytext[0] == '\t') ? 3 : 1;
\n return 0;

%%

int main(){
    printf("Enter the string \n");
    yylex();
    printf("Words -> %d \nChar -> %d \nLines -> %d \nSpaces -> %d\n", w, c, l, s);
    return 0;
}