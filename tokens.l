%{
FILE* yyin;
%}

DIGIT [0-9]
NUMBER {DIGIT}+
REAL {DIGIT}*[.]{NUMBER}
LETTER [a-zA-Z_]
KEYWORDS class|static
DATATYPE int|float|double|String|char|void
CONDITIONAL if|else|"else if"|switch|case
ITERATIVE for|while|do
PREPROCESSOR import[^\n]*;
SC ";"
IDENTIFIER {LETTER}({DIGIT}|{LETTER})*
NONIDENTIFIER {DIGIT}({LETTER}|{DIGIT})*
ARITH_OP "+"|"-"|"*"|"/"|"%"
LOGICAL_OP "||"|"&&"|"!"|"!="
REL_OP ">"|"<"|"<="|">="|"=="
UNARY "++"|"--"
ACCESS public|protected|private|""
STRING \".*\"
COMMENT_SINGLE "//".*
COMMENT_MULTI "/*".*"*/"
FUNCTION {ACCESS}{DATATYPE}{IDENTIFIER}"("({DATATYPE}{IDENTIFIER})*")"

%%

[ \n\t\r]+ ;
{SC} {printf("%s\t==> DELIMITER\n", yytext);}
{PREPROCESSOR} {printf("%s\t==> PREPROCESSOR\n", yytext);}
{CONDITIONAL} {printf("%s\t==> CONDITIONAL\n", yytext);}
{ITERATIVE} {printf("%s\t==> ITERATIVE CONSTRUCT\n", yytext);}
{DATATYPE} {printf("%s\t==> DATATYPE\n", yytext);}
{ACCESS} {printf("%s\t==> ACCESS SPECIFIER\n", yytext);}
{KEYWORDS} {printf("%s\t==> KEYWORDS\n", yytext);}
{NUMBER} {printf("%s\t==> CONSTANT INTEGER\n", yytext);}
{REAL} {printf("%s\t==> REAL CONSTANT\n", yytext);}
{IDENTIFIER} {printf("%s\t==> IDENTIFIER\n", yytext);}
{NONIDENTIFIER} {printf("%s\t==> NON IDENTIFIER\n", yytext);}
{UNARY} {printf("%s\t==> UNARY OPERATOR\n", yytext);}
{ARITH_OP} {printf("%s\t==> ARITHMETIC OPERATOR\n", yytext);}
{LOGICAL_OP} {printf("%s\t==> LOGICAL OPERATOR\n", yytext);}
{REL_OP} {printf("%s\t==> RELATIONAL OPERATOR\n", yytext);}
{STRING} {printf("%s\t==> STRING\n", yytext);}
{COMMENT_SINGLE} {printf("%s\t==> SINGLE LINE COMMENT\n", yytext);}
{COMMENT_MULTI} {printf("%s\t==> MULTI LINE COMMENT\n", yytext);}
"=" {printf("%s\t==> ASSIGNMENT OPERATOR\n", yytext);}
"{" {printf("%s\t==> BLOCK BEGIN\n", yytext);}
"}" {printf("%s\t==> BLOCK END\n", yytext);}
"(" {printf("%s\t==> PARANTHESIS BEGIN\n", yytext);}
")" {printf("%s\t==> PARANTHESIS END\n", yytext);}
. ;

%%

int yywrap() {
	return 1;
}

int main(int argc, char** argv) {
	yyin = fopen(argv[1], "r");
	yylex();
	fclose(yyin);
}

