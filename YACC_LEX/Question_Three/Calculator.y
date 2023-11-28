%{
    #include<stdio.h>
    int yylex(void);
    int yyerror(char *);
%}

%token  NUMBER 
%left SUM SUB

%%
S : expression {printf("result = %d\n",$1);};
expression: NUMBER {$$ = $1;} | expression SUM expression{$$ = $1 + $3;} | expression SUB expression {$$ = $1 - $3;};

%%

int main(){
yyparse();
return 0;
}

int yyerror(char *s){
    printf("%s",s);
}
