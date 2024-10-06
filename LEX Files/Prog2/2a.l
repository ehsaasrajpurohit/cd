%option noyywrap

%{
    int pi = 0;
    int ni = 0;
    int pf = 0;
    int nf = 0;
%}

%%

[+]?[0-9]* pi++;
[-][0-9]* ni++;
[+]?[0-9]*[.][0-9]* pf++;
[-][0-9]*[.][0-9]* nf++;

. { /*ignore everything else*/ };
\n return 0;

%%

int main(){
    yylex();
    printf("PI -> %d \n", pi);
    printf("NI -> %d \n", ni);
    printf("PF -> %d \n", pf);
    printf("NF -> %d \n", nf);

    return 0;
}