
Compiler Design Lab
VU21csen0100090
Urjith Reddy Dwarsala
1. lex code for Valid identifier

======================================================================
%{
#include<stdio.h>
%}

%%

([a-zA-Z][0-9])+|[a-zA-Z]* {printf("Identifier\n");}   

^[0-9]+ {printf("Not a Identifier\n");}

.|\n; 
%%
int yywrap()					
{
return 1;
}

int main(void)
{

yylex();						
return 0;
}
 
 







===============================================================================
2. Checking valid integer or float
%{
#include <stdio.h>
#include <stdlib.h>
%}

%%
[0-9]+             printf("Integer\n");
[0-9]+"."[0-9]+    printf("Float\n");
[a-zA-Z_][a-zA-Z0-9_]*  printf("Identifier\n");
.                  printf("Invalid\n");
%%

int yywrap(){
return 1;
}

int main(){
char input[100];
printf("Enter String: ");
scanf("%s", input);

char* endptr;
long int_val = strtol(input, &endptr, 10);
double float_val = strtod(input, &endptr);

if (*endptr == '\0') {
    printf("Manually Checked: ");
    if (float_val == int_val)
        printf("Integer\n");
    else
        printf("Float\n");
}

return 0;
}
 
 


=======================================================================================


3. Valid Email
%{
#include <stdio.h>
%}

%%
[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,} {
    printf("Valid email: %s\n", yytext);
}
.|\n { /* Ignore other characters */ }
%%

int yywrap() {
    return 1; /* Signal the end of input */
}

int main() {
    printf("Enter email addresses (one per line, 'q' to quit):\n");
    yylex();
    return 0;
}














============================================================================================================




4. Lex for counting vowel and consonants
%{
int vowelCount = 0;
int consonantCount = 0;
%}

%%
[aeiouAEIOU] { vowelCount++; }
[^aeiouAEIOU\n] { consonantCount++; }
.|\n { /* ignore other characters */ }
%%

int yywrap() {
    printf("Number of vowels: %d\n", vowelCount);
    printf("Number of consonants: %d\n", consonantCount);
    return 1;
}

int main() {
    printf("Enter a string: ");
    yylex();
    return 0;
}

===================================================================================================
5. Write a LEX program to check whether the given input is a noun or a verb.




%{
#include <stdio.h>
#include <string.h>

#define MAX_WORD_LENGTH 100

int is_noun(char *word);
int is_verb(char *word);
%}

%%
[a-zA-Z]+   {
                char word[MAX_WORD_LENGTH];
                strcpy(word, yytext);

                if (is_noun(word)) {
                    printf("%s is a noun\n", word);
                } else if (is_verb(word)) {
                    printf("%s is a verb\n", word);
                } else {
                    printf("%s is not a noun or a verb\n", word);
                }
            }
%%

int is_noun(char *word) {
    int length = strlen(word);
    return (word[length - 1] == 's');
}

int is_verb(char *word) {
    return (word[0] == 'v');
}

int yywrap() {
    return 1;
}

int main() {
    printf("Enter a word: ");
    yylex();
    return 0;
}

=========================================================================================================
6. Write a LEX program for a valid constant.
%{
#include <stdio.h>
%}

%%
[0-9]+          { printf("%s is an integer constant\n", yytext); }
[0-9]+\.[0-9]+  { printf("%s is a float constant\n", yytext); }
'.'             { printf("%s is a character constant\n", yytext); }
'"'.*'"'        { printf("%s is a string constant\n", yytext); }
.               { printf("%s is not a valid constant\n", yytext); }
%%

int yywrap() {
    return 1;
}

int main() {
    printf("Enter constants (one per line, 'q' to quit):\n");
    yylex();
    return 0;
}
