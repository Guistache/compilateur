

%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "sym.h"
#include "cfe.tab.h"





/* Ne gère pas les commentaires. A rajouter */
/* Supprimer les lignes dont vous n'avez pas besoin. */


%}


D                       [0-9]
L                       [a-zA-Z_]
IDENTIFICATEUR		{L}({L}|{D})*
CONSTANTE		{D}+

%%
"break"                 {return BREAK;}
"case"                  {return CASE;}
"default"               {return DEFAULT;}
"else"                  {return ELSE;}
"extern"                {return EXTERN;}
"for"                   {return FOR;}
"if"                    {return IF;}
"int"                   {return INT;}
"return"                {return RETURN;}
"then"			{return THEN;}
"switch"                {return SWITCH;}
"void"                  {return VOID;}
"while"                 {return WHILE;}
{CONSTANTE}            	{yylval.entier = atof(yytext);return CONSTANTE;}
{IDENTIFICATEUR}	{yylval.name = yytext;return IDENTIFICATEUR; }

"+"                    	{return PLUS;}
"-"                    	{return MOINS;}
"*"                    	{return MUL;}
"/"                    	{return DIV;}
"&"                     {return BAND;}
"|"                     {return BOR;}
"<<"                    {return LSHIFT;}
">>"                    {return RSHIFT;}
"&&"                    {return LAND;}
"||"			{return LOR;}
"<"                     {return LT;}
">"			{return GT;}
"<="                    {return LEQ;}
">="                    {return GEQ;}
"=="                    {return EQ;}
"!="                    {return NEQ;}
"="			{return '=';}
";"			{return ';';}
","			{return ',';}
"("			{return '(';}
")"			{return ')';}
("{"|"<%")		{return('{'); }
("}"|"%>")		{return('}'); }
"["			{return '[';}
"]"			{return ']';}
":"			{return ':';}
"/*"			{comment();}
[ \t\v\n\f]             { ;}
.                       {fprintf(stderr,"erreur lexicale\n");}
%%

comment()
{
	char c, c1;

loop:
	while ((c = input()) != '*' && c != 0)
		putchar(c);

	if ((c1 = input()) != '/' && c != 0)
	{
		unput(c1);
		goto loop;
	}

	if (c != 0)
		putchar(c1);
}

yywrap()
{
	fprintf(stderr,"lexique\n");
	return(1);
}


