%{
	#include <stdio.h>
	#include <stdlib.h>
	#include <sym.h>
	
%}
%union{
	int val;
	symbole *var;
}
%token <var> IDENTIFICATEUR
%token <val> CONSTANTE
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
%left REL
%type <val> programme
%type <val> affectation
%start programme

%%
programme	:	
		liste_declarations liste_fonctions {printf("resultat : %d\n",$$);}
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
		IDENTIFICATEUR '(' liste_expressions ')' ';'
;
variable	:	
		IDENTIFICATEUR
	|	variable '[' expression ']'
;
expression	:	
		'(' expression ')'
	|	MOINS expression
	|	CONSTANTE
	|	variable
	|	IDENTIFICATEUR '(' expression ')'
	|	expression PLUS expression 	{$$ = $1+ $2;}
	|	expression MOINS expression 	{$$ =$1 - $2;}
	|	expression MUL expression 	{$$ = $1 * $2;}
	|	expression DIV expression	{$$ = $1 / $2;}
	|	expression LSHIFT expression	
	|	expression RSHIFT
	|	expression BAND expression
	|	expression BOR expression
	|	expression
	|	expression ',' expression
	|	%empty
	
;
condition	:	
		NOT '(' condition ')'
	|	condition LAND condition
	|	condition LOR
	|	'(' condition ')'
	|	expression binary_comp expression
	|	condition LT condition
	|	condition GT condition
	|	condition GEQ condition
	|	condition LEQ condition
	|	condition EQ condition
	|	condition NEQ condition
;
%%

yyerror( char *s){
      fprintf( stderr,"%s\n", s );
     }

int main(){
		yyparse();
}