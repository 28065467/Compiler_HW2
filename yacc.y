%{
    #include "main.h"
%}
%token IDENTIFIER CONSTANT
%token INT VOID
%token IF ELSE WHILE 
%token ASSIGN EQ_OP NE_OP LE_OP GE_OP ADD_OP SUB_OP MUL_OP DIV_OP

%start HEAD
%%
HEAD
    :function_declare
    ;
function_declare
    : type IDENTIFIER '('')' '{' compound_statment '}'
    ;
type
    : INT
    | VOID
    ;
compound_statment
    : statment
    | compound_statment statment
    ;
statment
    : assign_statment
    | if_statment
    | while_statment
    | calculation_stament
    ;
assign_statment
    : type IDENTIFIER ASSIGN term ';'
    | IDENTIFIER ASSIGN term ';'
    ;
if_statment
    : IF '(' conditional_statment ')' statment
    | IF '(' conditional_statment ')' statment ELSE statment
    ;
while_statment
    : WHILE '(' conditional_statment ')' statment
    ;
calculation_stament
    : term operation term ';'
    ;
conditional_statment
    : IDENTIFIER conditon term
    ;
operation
    : ADD_OP| SUB_OP| MUL_OP| DIV_OP
    ;
conditon
    : EQ_OP |NE_OP |LE_OP| GE_OP|
    ;
term
    : IDENTIFIER | CONSTANT
    ;
%%
void yyerror(const char* s){
    printf("Error: %s" , s);
}