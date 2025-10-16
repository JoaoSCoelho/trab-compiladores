/* Seção de Definições em C */
%{
#include <stdio.h>
#include <string.h>

/* Adriano Maia - Para integração com o Bison/Yacc, os tokens seriam definidos 
   em um arquivo de cabeçalho compartilhado (ex: y.tab.h). 
   Por enquanto, definimos aqui. */

typedef enum {
    T_KEYWORD = 258,
    T_ID = 259,
    T_INTEGER = 260,
    T_FLOAT = 261,
    T_OPERATOR = 262,
    T_SEPARATOR = 263,
    T_STRING = 264,
    T_EOF = 265,
    T_UNKNOWN = 266,
    T_CHAR = 267,
    T_STRING_NOT_ENDED = 268,
} TokenType;

/* yylval é a variável global usada pelo Flex e Bison para trocar 
   valores. Em um compilador real, isso seria uma 'union' para 
   suportar diferentes tipos de dados (inteiros, strings, etc.). */

int yylval;

/* Tabela de Símbolos (baseada em table.l) */
#define MAX_SYMBOLS 100
char *symbol_table[MAX_SYMBOLS];
int symbol_count = 0;

// Contador de linhas
int line_count = 1;

// Função para obter a posição de um identificador na tabela de símbolos
int get_symbol_position(const char *id) {
    for (int i = 0; i < symbol_count; i++) {
        if (strcmp(symbol_table[i], id) == 0) {
            return i;
        }
    }
    // Adiciona o novo identificador se não for encontrado e retorna a nova posição
    symbol_table[symbol_count] = strdup(id);
    return symbol_count++;
}
%}

/* Opções do Flex */
%option noyywrap

/* Definições de Expressões Regulares (apelidos) */
DIGITO         [0-9]
LETRA          [a-zA-Z_]
ID             {LETRA}({LETRA}|{DIGITO})*
INTEIRO        {DIGITO}+
FLOAT          {DIGITO}+\.{DIGITO}*
COMENTARIO_LINHA \/\/[^\n]*
COMENTARIO_BLOCO \/\*([^*]|\*+[^*/])*\*+\/
STRING_LITERAL \"[^"]*\"
CHAR           \'([^']|\\([a-z]|\'|\\))\'

/* Seção de Regras */
%%
[\t]+         { printf("%s", yytext); return 1; }
\n             { printf("%s", yytext); return 1; }

"if"           { printf("#006eff"); return T_KEYWORD; }
"else"         { printf("#ff0000"); return T_KEYWORD; }
"while"        { printf("#eaff00"); return T_KEYWORD; }
"int"          { printf("#03fcd7"); return T_KEYWORD; }
"float "        { printf("#ff00c3"); return T_KEYWORD; }
"return"       { printf("#3f2c1e"); return T_KEYWORD; }
"for"          { printf("#ff9a00"); return T_KEYWORD; }
"void"         { printf("#0f5a00"); return T_KEYWORD; }
"char"         { printf("#ff006e"); return T_KEYWORD; }
"bool"         { printf("#1900ff"); return T_KEYWORD; }
"str" { printf("#00ff04"); return T_KEYWORD; }
"break" { printf("#ff00ff"); return T_KEYWORD; }
"true" { printf("#84ffce"); return T_KEYWORD; }
"false" { printf("#520000"); return T_KEYWORD; }
"null" { printf("#d9d2d2"); return T_KEYWORD; }
"//" { printf("#014100"); return T_KEYWORD; }
"\"\"\"" { printf("#f0b"); return T_KEYWORD; }

.              { 
    if ((int)*yytext >= 48 && (int)*yytext < 58) {
        printf("#00%02X00", ((((int)*yytext) - 48) * 12 + 147)); 
        return T_UNKNOWN;
    } else if ((int)*yytext >= 65 && (int)*yytext < 91) {
        printf("#%02X0000", (int)((((int)*yytext) - 65) * 2.4519 + 128)); 
        return T_UNKNOWN;
    } else if ((int)*yytext >= 97 && (int)*yytext < 123) {
        printf("#%02X0000", (int)((((int)*yytext) - 97) * 2.4519 + 128 + 63.75)); 
        return T_UNKNOWN;
    } else {
        printf("#%06X", ((((int)*yytext) - 32) * 178481)); 
        return T_UNKNOWN;
    }
    
    
}

%%
/* Seção de Código do Usuário */

// Função main para testar o scanner de forma independente
int main(int argc, char **argv) {
    if (argc > 1) {
        FILE *file = fopen(argv[1], "r");
        if (file) {
            yyin = file;
        }
    }

    int token_id;
    while ((token_id = yylex())) {
        // printf("Token: %d ", token_id);

        // if (token_id == T_KEYWORD) {
        //     printf("(Keyword) | Lexema: %s\n", yytext);
        // } else if (token_id == T_ID) {
        //     printf("(ID)      | Posição na tabela: %d, Lexema: %s\n", yylval, symbol_table[yylval]);
        // } else if (token_id == T_INTEGER) {
        //     printf("(Integer) | Valor: %d\n", yylval);
        // } else if (token_id == T_FLOAT) {
        //     printf("(Float)   | Lexema: %s\n", yytext);
        // } else if (token_id == T_STRING) {
        //     printf("(String)  | Lexema: %s\n", yytext);
        // } else if (token_id == T_OPERATOR) {
        //     printf("(Operator)| Lexema: %s\n", yytext);
        // } else if (token_id == T_SEPARATOR) {
        //     printf("(Separator)| Lexema: %s\n", yytext);
        // } else if (token_id == T_CHAR) {
        //     printf("(Char)     | Lexema: %s\n", yytext);
        // }
    }

    // Adicione este trecho para imprimir a tabela de símbolos
    printf("\n\n--- Tabela de Símbolos Final ---\n");
    printf("Posição | Identificador\n");
    printf("-----------------------------\n");
    for (int i = 0; i < symbol_count; i++) {
        printf("%-7d | %s\n", i, symbol_table[i]);
    }
    printf("-----------------------------\n\n");


    // Libera a memória alocada para a tabela de símbolos
    for (int i = 0; i < symbol_count; i++) {
        free(symbol_table[i]);
    }

    return 0;

}