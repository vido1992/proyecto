%{
#include <stdio.h>
FILE *archSal;
%}


PaRes	"int"|"switch"|"float"|"bool"|"chat"|"String"|"if"|"else"|"while"|"do"|"return"

SimParaUso	","|";"|"{" |"}" |"*"|"/"|"."|"_"|"+"|"-"|"!"|"&"|"<"|">"|"="

Compu	"<="|">="|"=="|"!="|"=!"|"&&"|"||"

ID	[a-z]([A-Za-z]|[0-9])*

Entero		[0-9]+
Flotante	[0-9]*"."[0-9]*
Boolian		"true"|"false"
Caracter	"'"[a-zA-Z]{1}"'"
Cadenas		\"[^\n"]+\"

%%
{PaRes}		printf(archSal,"es una palabra reservada",yytext);
{SimParaUso} 	printf(archSal,"simb para la composicion de instruccion",yytext);
{Compu}		printf(archSal,"Simb comp par condiciondoble ",yytext);
{ID}		printf(archSal,"identificadores",yytext);
{Entero}	printf(archSal,"es un numero entero",yytext);
{Flotante}	printf(archSal,"es un numero con decimal",yytext);
{Boolian}	printf(archSal,"es boolean",yytext);
{Caracter}	printf(archSal,"es un simbolo",yytext);
{Cadenas}	printf(archSal,"Es una cadena",yytext);

%%

void main(int argc, char *argv[])
{
	yyin=fopen(argv[1],"r");
	archSal=fopen("Compiladores.txt","w");
	yylex();
	fclose(archSal);
	
}

