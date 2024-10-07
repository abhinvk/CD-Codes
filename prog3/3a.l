%{
	#include<stdio.h>
	extern FILE *yyin;
	int single = 0, multi = 0, mlines = 0;
%}

%%
"//"[^\n]* {single++; }
"/*"[^*]*"*/" {multi++;
	for(int i = 0;i<yyleng;i++)
	{
		if(yytext[i] == '\n'){mlines++;}
	}
}

%%

int main(){
	yyin = fopen("inp.txt","r");
	yyout = fopen("out.txt","w");
	
	yylex();
	printf("Single = %d\nmulti = %d\nmlines = %d\n",single,multi,mlines);
}
