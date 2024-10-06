%option noyywrap

%{
    #include "y.tab.h"
%}

%%

"int" return TYPE;
"float" return TYPE;
"char" return TYPE;
[_a-zA-Z][_a-zA-Z0-9]* return ID;
[0-9]+ return NUM;
"[" return '[';
"]" return ']';
"," return ',';
";" return ';';
. {};
\n return 0;

%%