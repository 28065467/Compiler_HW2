%{
    #include "yacc.tab.h";
%}

%%
"if" {ECHO; return IF;}
"else" {ECHO; return ELSE;}
"while" {ECHO; return WHILE;}

"int" {ECHO; return INT;}
"void" {ECHO; return VOID;}

"=" {ECHO; return ASSIGN;}
"+" {ECHO; return ADD_OP;}
"-" {ECHO; return DIV_OP;}
"*" {ECHO; return MUL_OP;}
"/" {ECHO; return DIV_OP;}
">=" {ECHO; return GE_OP;}
[a-zA-Z_][a-zA-Z_0-9_]* { ECHO; return IDENTIFIER;}
[0-9]+ {ECHO; return CONSTANT;}

"("  { ECHO; return '('; }
")"  { ECHO; return ')'; }
";"  { ECHO; return ';'; }
"{"  { ECHO; return '{'; }
"}"  { ECHO; return '}'; }
";" {ECHO; return ';';}
" " {ECHO;}
. ;
%%
int yywrap() {
    return 1;
}