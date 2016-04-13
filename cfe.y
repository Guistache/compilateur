%{
	#include <stdio.h>
	#include <stdlib.h>
	#include "sym.h"
	
%}
%union {
	char *name;
	type_t type;
	int entier;
}
%token <name>IDENTIFICATEUR
%token <entier>CONSTANTE
%token VOID INT FOR WHILE IF ELSE SWITCH CASE DEFAULT 
%token BREAK RETURN PLUS MOINS MUL DIV LSHIFT RSHIFT BAND BOR LAND LOR LT GT 
%token GEQ LEQ EQ NEQ NOT EXTERN 
%left PLUS MOINS
%left MUL DIV
%left LSHIFT RSHIFT
%left BOR BAND
%left LAND LOR
%nonassoc THEN
%nonassoc ELSE
%left OP
%left REL
%start programme

%%
programme	:	
		liste_declarations liste_fonctions
;
liste_declarations	:	
		liste_declarations declaration 
	|	%empty	
;
liste_fonctions	:	
		liste_fonctions fonction	
	|       fonction
;
declaration	:	
		type liste_declarateurs ';'
;
liste_declarateurs	:	
		liste_declarateurs ',' declarateur
	|	declarateur
;
declarateur	:	
		IDENTIFICATEUR
	|	declarateur '[' CONSTANTE ']'
;
fonction	:	
		type IDENTIFICATEUR '(' liste_parms ')' bloc
	|	EXTERN type IDENTIFICATEUR '(' liste_parms ')' ';'
; 
liste_parms 	:	
		l_parm
	|	%empty
;
l_parm 		:
		 l_parm ',' parm
	|	parm
;
parm		:
		INT IDENTIFICATEUR 
;
type		:	
		VOID
	|	INT
;	
liste_instructions :	
		liste_instructions instruction
	|	%empty
;
instruction	:	
		iteration
	|	selection
	|	saut
	|	affectation ';'
	|	bloc
	|	appel
;
iteration	:	
		FOR '(' affectation ';' condition ';' affectation ')' instruction
	|	WHILE '(' condition ')' instruction
;
selection	:	
		IF '(' condition ')' instruction %prec THEN
	|	IF '(' condition ')' instruction ELSE instruction
	|	SWITCH '(' expression ')' instruction
	|	CASE CONSTANTE ':' instruction
	|	DEFAULT ':' instruction
;
saut	:	
		BREAK ';'
	|	RETURN ';'
	|	RETURN expression ';'
;
affectation	:	
		variable '=' expression	
;
bloc	:	
		'{' liste_declarations liste_instructions '}'	
;
appel	:	
		IDENTIFICATEUR '(' expression ')' ';'
;
variable	:	
		IDENTIFICATEUR
	|	variable '[' expression ']'
;
expression	:	
		'(' expression ')'
	|	expression binary_op expression %prec OP
	|	MOINS expression
	|	CONSTANTE
	|	variable
	|	IDENTIFICATEUR '(' liste_expressions ')'
;
liste_expressions	:	
		liste_expressions ',' expression
	|	%empty
;
condition	:	
		NOT '(' condition ')'
	|	condition binary_rel condition %prec REL
	|	'(' condition ')'
	|	expression binary_comp expression
;
binary_op	:	
		PLUS
	|       MOINS
	|	MUL
	|	DIV
	|       LSHIFT
	|       RSHIFT
	|	BAND
	|	BOR
;
binary_rel	:	
		LAND
	|	LOR
;
binary_comp	:	
		LT
	|	GT
	|	GEQ
	|	LEQ
	|	EQ
	|	NEQ

%%

yyerror( char *s){
      fprintf( stderr,"%s\n", s );
     }

int main(){
		yyparse();
}