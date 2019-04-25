%{
	FILE* yyin;
	int char_count=0, word_count=0, line_count=0;
%}

%%
[^ \t\n\r]+ {word_count++; char_count += yyleng;}
\n {line_count++;}
. {char_count++;}
%%

int yywrap() {
	return 1;
}

int main(int argc, char* argv[]) {
	yyin = fopen(argv[1], "r");
	yylex();
	fclose(yyin);
	
	printf("Number of words: %d\n", word_count);
	printf("Number of lines: %d\n", line_count);
	printf("Number of characters: %d\n", char_count);
}
