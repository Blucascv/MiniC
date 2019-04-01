
package com.br.minic;

import com.br.minic.token.Token;

%%

%class AnalisadorLexico
%type Token
%line
%column

LETRA = [a-zA-Z]
DIGITO = [0-9]

LITERALINTEIRO = {DIGITO}+
LITERALPONTOFLUTUANTE = {DIGITO}+("."{DIGITO}+)*

IDENTIFICADOR = ({LETRA}|"_")({LETRA}|{DIGITO}|"_")*

LITERALCHAR  = '( {LETRA} | {DIGITO} | "\\n" | "\\\\" | "\\t" | "\\r" )?'
LITERALSTRING = "\"" [^"\""]* "\""

PULARLINHA = [ \r | \n | \r\n | \t ]

COMENTARIOLINHA = "//" [^\r\n]* {PULARLINHA}?
COMENTARIOMULTILINHAS = "/*"~"*/"

ESPAÇOBRANCO = [ ]

%%

"char" { return new Token( "PR" ,yyline, yycolumn, yytext() ); }
"else" { return new Token( "PR" ,yyline, yycolumn, yytext() ); }
"if" { return new Token( "PR", yyline, yycolumn, yytext() ); }
"int" { return new Token( "PR" ,yyline, yycolumn, yytext() ); }
"float" { return new Token( "PR" ,yyline, yycolumn, yytext() ); }
"double" { return new Token( "PR" ,yyline, yycolumn, yytext() ); }
"main" { return new Token( "PR", yyline, yycolumn, yytext() ); }
"printf" { return new Token( "PR" ,yyline, yycolumn, yytext() ); }
"printint" { return new Token( "PR" ,yyline, yycolumn, yytext() ); }
"printstr" { return new Token( "PR" ,yyline, yycolumn, yytext() ); }
"return" { return new Token( "PR" ,yyline, yycolumn, yytext() ); }
"static" { return new Token( "PR" ,yyline, yycolumn, yytext() ); }
"void" { return new Token( "PR" ,yyline, yycolumn, yytext() ); }
"while" { return new Token( "PR" ,yyline, yycolumn, yytext() ); }
"for" { return new Token( "PR" ,yyline, yycolumn, yytext() ); }
"do" { return new Token( "PR" ,yyline, yycolumn, yytext() ); }
"include" { return new Token( "PR", yyline, yycolumn, yytext() ); }

":" { return new Token( "PT", yyline, yycolumn, yytext() ); }
";" { return new Token( "PT", yyline, yycolumn, yytext() ); }
"," { return new Token( "PT", yyline, yycolumn, yytext() ); }
"(" { return new Token( "PT", yyline, yycolumn, yytext() ); }
")" { return new Token( "PT", yyline, yycolumn, yytext() ); }
"{" { return new Token( "PT", yyline, yycolumn, yytext() ); }
"}" { return new Token( "PT", yyline, yycolumn, yytext() ); }
"." { return new Token( "PT", yyline, yycolumn, yytext() ); }
"#" { return new Token( "PT", yyline, yycolumn, yytext() ); }
"&" { return new Token( "PT", yyline, yycolumn, yytext() ); }

"+" { return new Token( "OP", yyline, yycolumn, yytext() ); }
"-" { return new Token( "OP", yyline, yycolumn, yytext() ); }
"*" { return new Token( "OP", yyline, yycolumn, yytext() ); }
"/" { return new Token( "OP", yyline, yycolumn, yytext() ); }
"==" { return new Token( "OP", yyline, yycolumn, yytext() ); }
"!=" { return new Token( "OP", yyline, yycolumn, yytext() ); }
"<" { return new Token( "OP", yyline, yycolumn, yytext() ); }
">" { return new Token( "OP", yyline, yycolumn, yytext() ); }
"<=" { return new Token( "OP", yyline, yycolumn, yytext() ); }
">=" { return new Token( "OP", yyline, yycolumn, yytext() ); }
"&&" { return new Token( "OP", yyline, yycolumn, yytext() ); }
"||" { return new Token( "OP", yyline, yycolumn, yytext() ); }
"=" { return new Token( "OP", yyline, yycolumn, yytext() ); }
"!" { return new Token( "OP", yyline, yycolumn, yytext() ); }
"++" { return new Token( "OP", yyline, yycolumn, yytext() ); }
"--" { return new Token( "OP", yyline, yycolumn, yytext() ); }

{IDENTIFICADOR} {return new Token( "ID", yyline, yycolumn, yytext() ); }

{LITERALINTEIRO} { return new Token( "LI", yyline, yycolumn, yytext() ); }
{LITERALPONTOFLUTUANTE} { return new Token( "LIP", yyline, yycolumn, yytext() ); }
{LITERALCHAR} { return new Token( "LC", yyline, yycolumn, yytext() ); }
{LITERALSTRING} { return new Token( "LS", yyline, yycolumn, yytext() ); }

{COMENTARIOMULTILINHAS} {}
{COMENTARIOLINHA} {}

{PULARLINHA} {}
{ESPAÇOBRANCO} {}

. { return new Token( "ERRO", yyline, yycolumn, yytext() ); }