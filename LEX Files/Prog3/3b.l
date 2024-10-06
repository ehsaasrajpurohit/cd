%option noyywrap

%{
    #include "y.tab.h"
%}

%%

"for" return FOR;
"(" return '(';
")" return ')';
"{" return '{';
"}" return '}';
";" return ';' ;
"=" return '=';
">" return '>';
"<" return '<';
[a-zA-Z_][a-zA-Z0-9_]* return EXP;
[0-9]+ return NUM;
"<=" return LE;
">=" return GE;
"++" return INC;
"--" return DEC;
[ \t]+ {/*ignore*/};
. {/*Ignore anything else*/};
\n return 0;

%%