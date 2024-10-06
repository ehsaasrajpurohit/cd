%{
    #include "y.tab.h"
%}
%%
"int"|"float"|"char"|"void" return TYPE;
"return" return RETURN;
[0-9]+ return NUM;
[a-zA-Z_][a-zA-Z0-9_]* return ID;
[ \t\n]+ ; 
. return yytext[0];
%%