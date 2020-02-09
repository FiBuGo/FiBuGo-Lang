%{
#include <stdio.h>
#include <string.h>
#include "y.tab.h"
%}
Digit [0-9]
Alphabetic [A-Za-z]
%%
"//"([a-z]|[0-9]|[A-Z]|" ")*	{}
[/][*][^*]*[*]+([^*/][^*]*[*]+)*[/]	{}

int	return (INT);
float	return (FLOAT);
bool	return (BOOL);
void	return (VOID);
char	return (CHAR);
string	return (STR);
false	return (FALSE);
true	return (TRUE);
"&&"	return (AND_OP);
"||"	return (OR_OP);
if	return (IF);
elif	return (ELIF);
else	return (ELSE);
while	return (WHILE);
for	return (FOR);
continue	return (CONTINUE);
break	return (BREAK);
func	return (FUNC);
return	return (RETURN);
"<="	return (LESS_EQ_OP);
">="	return (GREATER_EQ_OP);
"!="	return (NOT_EQ_OP);
"=="	return (EQUALITY_OP);
"<"	return (LESS_OP);
">"	return (GREATER_OP);
"="	return (EQUAL_OP);
"*"	return (MULTIPLY_OP);
"/"	return (DIVIDE_OP);
"-"	return (SUB_OP);
"+"	return (ADD_OP);
"^"	return (POW_OP);
"%"	return (MOD_OP);
"!"	return (NOT_OP);
";"	return (SEMICOLON);
"{"	return (CURLY_OPEN);
"}"	return (CURLY_CLOSE);
"("	return (LEFT_PARANT);
")"	return (RIGHT_PARANT);
"["	return (SQR_OPEN);
"]"	return (SQR_CLOSE);
","	return (COMMA);
"$"	return (DOLLAR_SIGN);
gps	return (GPS);
road	return (ROAD);
crossroad	return (CROSSROAD);
graph	return (GRAPH);
user	return (USER);
showonmap	return (BLTIN_SHOW_ON_MAP);
searchlocation	return (BLTIN_SEARCH_LOCATION);
getroadspeed	return (BLTIN_GET_ROAD_SPEED);
getlocation	return (BLTIN_GET_LOCATION);
showtarget	return (BLTIN_TARGET);
getroads	return (BLTIN_GET_ROADS);
getcrossroads	return (BLTIN_GET_CROSSROADS);
getcrossroadsnum	return (BLTIN_GET_CROSSROADS_NUM);
getroadsnum	return (BLTIN_GET_ROADS_NUM);
colloborateusers	return (BLTIN_COLLOBORATE_USERS);
intructuser	return (BLTIN_INSTRUCT_USER);
increasescoreofroad	return (BLTIN_INCREASE_SCORE_OF_ROAD);
decreasescoreofroad	return (BLTIN_DECREASE_SCORE_OF_ROAD);
getscoreofroad	return (BLTIN_GET_SCORE_OF_ROAD);
showroadonmap	return (BLTIN_SHOW_ROAD_ON_MAP);
showcrossroadonmap	return (BLTIN_SHOW_CROSSROAD_ON_MAP);
addcrossroad	return (BLTIN_ADD_CROSSROAD);
addroad	return (BLTIN_ADD_ROAD);
print	return (BLTIN_PRINT);
home	return (HOME);
hospital	return (HOSPITAL);
school	return (SCHOOL);
bridge	return (BRIDGE);
mall	return (MALL);
busstop	return (BUSSTOP);
hotel	return (HOTEL);
postoffice	return (POSTOFFICE);
{Digit}+	{ sscanf(yytext, "%d", &yylval);
	return (INT_LITERAL);
	}
{Digit}*"."{Digit}+	return (FLOAT_LITERAL);
\"(\\.|[^\\"])*\"	return (STR_LITERAL);
\'(\\.|[^\\'])+\'	return (CHAR_LITERAL);
{Alphabetic}({Digit}|{Alphabetic})*	return (IDENT);
(\r|\n|\r\n)	yylineno++;
[ \t\v\f]+	{};
.	{ yyerror("Non recognized!"); }
%%
