%{
	#include <stdio.h>
	#include <stdlib.h>
	void yyerror(char*);
%}

%token ID BUILTIN SC NL COMMA

%%
start: BUILTIN varlist SC NL {printf("Valid declaration syntax\n"); exit(1);};
varlist: ID|varlist COMMA ID;
%%

int main() {
	printf("Enter the statement: ");
	yyparse();
	return 1;
}

void yyerror(char* s) {
	printf("ERROR: %s\n", s);
}



