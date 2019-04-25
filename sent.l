%{
	#include <stdio.h>
	#include "y.tab.h"
%}

%%
[ \t] ;
am|is|are|have|has|can|will|shall|eat|sing|goes|go { printf("VERB\t\t==> %s\n", yytext); return VERB; }
very|simply|gently { printf("ADVERB\t\t==> %s\n", yytext); return ADVERB; }
and|or|also|so|but|if|then { printf("CONJUNCTION\t==> %s\n", yytext); return CONJUNCTION; }
fast|good|honest { printf("ADJECTIVE\t\t==> %s\n", yytext); return ADJECTIVE; }
I|she|he|it|you|they|this { printf("PRONOUN\t\t==> %s\n", yytext); return PRONOUN; }
in|on|to { printf("PREPOSITION\t\t==> %s\n", yytext); return PREPOSITION; }
a|an|the { printf("ARTICLE\t\t==> %s\n", yytext); return ARTICLE; }
[a-zA-Z]+ { printf("NOUN\t\t==> %s\n", yytext); return NOUN; }
. ;
%%

int yywrap() {
	return 1;
}
