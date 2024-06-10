#include "main.h"

extern int yyparse(void);
extern FILE* yyin;

int main()
{
    FILE* fp = fopen("test.c" , "r");
    if (fp == NULL)
    {
        printf("Can't open the file");
        return 1;
    }
    yyin = fp;
    yyparse();
    fclose(fp);
    
}