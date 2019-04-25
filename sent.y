%{
	#include <stdio.h>
	void yyerror(char*);
	int yylex();
	FILE* yyin;
%}

%token NOUN PRONOUN ADJECTIVE VERB ADVERB CONJUNCTION PREPOSITION ARTICLE

%%
sentence: 
	compound { printf("COMPOUND SENTENCE\n"); }
	|
	simple { printf("SIMPLE SENTENCE\n"); }
	;

simple: 
	subject VERB object
	;

compound:
	subject VERB object CONJUNCTION subject VERB object
	;

subject:
	NOUN|PRONOUN
	;
	
object:
	NOUN|ADJECTIVE NOUN|ADVERB NOUN|PREPOSITION NOUN|ARTICLE NOUN
	;
%%

void yyerror(char* msg) {
	printf("ERROR: %s\n", msg);
}

int main(int argc, char* argv[]) {
	yyin = fopen(argv[1], "r");
	yyparse();
	fclose(yyin);
	return 0;
}
