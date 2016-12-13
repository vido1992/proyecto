%{
	#include <stdio.h>
	FILE *archSal;
	FILE *archEnt;
	int num=1;
%}
%option noyywrap
%option yylineno

PalReservada		"int"|"float"|"double"|"bool"|"char"|"String"|"if"|"then"|"else"|"while"|"do"|"input"|"output"|"return"|"void"|"include"|"printf"|"scanf"
CarEspeciales	","|";"|":"|"<"|">"|"="|"!"|"&"|"$"
OpCompuesto	"++"|"--"|"<="|">="|"=="|"!="|"&&"|"||"
Espacio	" "|\t
Numero	[0-9]
Letra	[a-z|A-Z]


%%

"if"|"else if"|"else"		fprintf(archSal, "CONDICIONAL ");
"for"|"while"|"do"		fprintf(archSal, "BUCLE ");
{PalReservada}			fprintf(archSal, "PALAB_RESERVADA ");
{Espacio}+	     		fprintf(archSal,"ESPACIO "); 
\n				++num;fprintf(archSal,"\n");	
"<"[a-z]+".h>"			fprintf(archSal,"LIBRERIA ");
{Numero}+|"-"{Numero}		fprintf(archSal, "ENTERO ");
{Numero}*"."{Numero}+		fprintf(archSal, "FLOTANTE "); 
"true"|"TRUE"|"false"|"FALSE"	fprintf(archSal, "BOOLEAN ");
"'".{1}"'"			fprintf(archSal, "CHAR ");
[a-z|A-Z]|{Numero}*		fprintf(archSal, "ID ");
{Letra}+			fprintf(archSal, "STRING ");
"//"{Letra}			fprintf(archSal, "COMENTARIO ");
"+"|"-"|"*"|"/"|"%"		fprintf(archSal, "OPERADOR ");
{OpCompuesto}			fprintf(archSal, "OP_COMPUESTO ");
"main()"			fprintf(archSal, "MAIN ");
";"				fprintf(archSal, "PUNTOYCOMA ");
"("				fprintf(archSal, "P_ABIERTO ");
")"				fprintf(archSal, "P_CERRADO ");
"["				fprintf(archSal, "C_ABIERTO ");
"]"				fprintf(archSal, "C_CERRADO ");
"{"				fprintf(archSal, "LL_ABIERTA ");
"}"				fprintf(archSal, "LL_CERRADA ");
"."                             fprintf(archSal, "PUNTO ");
"#"				fprintf(archSal, "NUMERAL ");
{CarEspeciales}			fprintf(archSal, "CARACT_ESPECIAL "); 
.       			fprintf(archSal, "Error en la línea: %d el caracter erroneo es:( %s )",num,yytext);
	

%%
void main()
{
    yyin=fopen("Entrada.txt","r");
    archSal=fopen("Salida.txt","w");
    yylex();
    fclose(archSal);
}
