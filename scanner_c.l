/* Seção de Definições em C */
%{
#include <stdio.h>
#include <string.h>

/* Enumeração de Tokens Refinada */
typedef enum {
    T_EOF = 0,

    // Palavras-chave
    T_IF = 258, T_ELSE, T_WHILE, T_INT_KEYWORD, T_FLOAT_KEYWORD, T_RETURN,
    T_CHAR_KEYWORD,T_BOOL,T_STR,T_FOR,T_VOID,T_BREAK,T_TRUE,T_FALSE,T_NULL,

    // Identificadores e Literais
    T_ID,
    T_INTEGER,
    T_FLOAT,
    T_STRING,
    T_LITERAL_CHAR,

    // Operadores
    T_OP_IGUALDADE, T_OP_DIFERENTE, T_OP_MENOR, T_OP_MAIOR, T_OP_MENOR_IGUAL,
    T_OP_MAIOR_IGUAL, T_OP_SOMA, T_OP_SUB, T_OP_MULT, T_OP_DIV, T_OP_ATRIBUICAO,

    // Separadores
    T_PONTO_VIRGULA, T_VIRGULA, T_PARENTESES_ESQ, T_PARENTESES_DIR,
    T_CHAVES_ESQ, T_CHAVES_DIR,

    // Erro
    T_UNKNOWN
} TokenType;

int yylval;

#define MAX_SYMBOLS 100
char *symbol_table[MAX_SYMBOLS];
int symbol_count = 0;

int get_symbol_position(const char *id) {
    for (int i = 0; i < symbol_count; i++) {
        if (strcmp(symbol_table[i], id) == 0) {
            return i;
        }
    }
    // Adiciona uma verificação para não estourar a tabela de símbolos
    if (symbol_count < MAX_SYMBOLS) {
        symbol_table[symbol_count] = strdup(id);
        return symbol_count++;
    } else {
        fprintf(stderr, "Erro: Tabela de símbolos cheia!\n");
        return -1; // Retorna um índice inválido
    }
}

/*
{INTEIRO}      { yylval = atoi(yytext); return T_INTEGER; }
{FLOAT}        { return T_FLOAT; }
{STRING_LITERAL} { return T_STRING; }
{CHAR_LITERAL} { return T_LITERAL_CHAR; }

{ID}           { yylval = get_symbol_position(yytext); if (yylval != -1) return T_ID; /* Ignora o ID se a tabela estiver cheia */ 

%}

%option noyywrap
%option yylineno

/* Definições de Expressões Regulares (apelidos) */
ASCII          (#000000)|(#02B931)|(#057262)|(#082B93)|(#0AE4C4)|(#0D9DF5)|(#105726)|(#131057)|(#15C988)|(#1882B9)|(#1B3BEA)|(#1DF51B)|(#20AE4C)|(#23677D)|(#2620AE)|(#28D9DF)|(#009300)|(#009F00)|(#00AB00)|(#00B700)|(#00C300)|(#00CF00)|(#00DB00)|(#00E700)|(#00F300)|(#00FF00)|(#46CEFA)|(#49882B)|(#4C415C)|(#4EFA8D)|(#51B3BE)|(#546CEF)|(#572620)|(#800000)|(#820000)|(#840000)|(#870000)|(#890000)|(#8C0000)|(#8E0000)|(#910000)|(#930000)|(#960000)|(#980000)|(#9A0000)|(#9D0000)|(#9F0000)|(#A20000)|(#A40000)|(#A70000)|(#A90000)|(#AC0000)|(#AE0000)|(#B10000)|(#B30000)|(#B50000)|(#B80000)|(#BA0000)|(#BD0000)|(#A0AE4B)|(#A3677C)|(#A620AD)|(#A8D9DE)|(#AB930F)|(#AE4C40)|(#BF0000)|(#C20000)|(#C40000)|(#C70000)|(#C90000)|(#CC0000)|(#CE0000)|(#D00000)|(#D30000)|(#D50000)|(#D80000)|(#DA0000)|(#DD0000)|(#DF0000)|(#E20000)|(#E40000)|(#E60000)|(#E90000)|(#EB0000)|(#EE0000)|(#F00000)|(#F30000)|(#F50000)|(#F80000)|(#FA0000)|(#FD0000)|(#F7D46B)|(#FA8D9C)|(#FD46CD)|(#FFFFFE)
ASCII_SEM_ASPAS (#000000)|(#02B931)|(#082B93)|(#0AE4C4)|(#0D9DF5)|(#105726)|(#131057)|(#15C988)|(#1882B9)|(#1B3BEA)|(#1DF51B)|(#20AE4C)|(#23677D)|(#2620AE)|(#28D9DF)|(#009300)|(#009F00)|(#00AB00)|(#00B700)|(#00C300)|(#00CF00)|(#00DB00)|(#00E700)|(#00F300)|(#00FF00)|(#46CEFA)|(#49882B)|(#4C415C)|(#4EFA8D)|(#51B3BE)|(#546CEF)|(#572620)|(#800000)|(#820000)|(#840000)|(#870000)|(#890000)|(#8C0000)|(#8E0000)|(#910000)|(#930000)|(#960000)|(#980000)|(#9A0000)|(#9D0000)|(#9F0000)|(#A20000)|(#A40000)|(#A70000)|(#A90000)|(#AC0000)|(#AE0000)|(#B10000)|(#B30000)|(#B50000)|(#B80000)|(#BA0000)|(#BD0000)|(#A0AE4B)|(#A3677C)|(#A620AD)|(#A8D9DE)|(#AB930F)|(#AE4C40)|(#BF0000)|(#C20000)|(#C40000)|(#C70000)|(#C90000)|(#CC0000)|(#CE0000)|(#D00000)|(#D30000)|(#D50000)|(#D80000)|(#DA0000)|(#DD0000)|(#DF0000)|(#E20000)|(#E40000)|(#E60000)|(#E90000)|(#EB0000)|(#EE0000)|(#F00000)|(#F30000)|(#F50000)|(#F80000)|(#FA0000)|(#FD0000)|(#F7D46B)|(#FA8D9C)|(#FD46CD)|(#FFFFFE)
ASCII_SEM_ASPA (#000000)|(#02B931)|(#057262)|(#082B93)|(#0AE4C4)|(#0D9DF5)|(#105726)|(#15C988)|(#1882B9)|(#1B3BEA)|(#1DF51B)|(#20AE4C)|(#23677D)|(#2620AE)|(#28D9DF)|(#009300)|(#009F00)|(#00AB00)|(#00B700)|(#00C300)|(#00CF00)|(#00DB00)|(#00E700)|(#00F300)|(#00FF00)|(#46CEFA)|(#49882B)|(#4C415C)|(#4EFA8D)|(#51B3BE)|(#546CEF)|(#572620)|(#800000)|(#820000)|(#840000)|(#870000)|(#890000)|(#8C0000)|(#8E0000)|(#910000)|(#930000)|(#960000)|(#980000)|(#9A0000)|(#9D0000)|(#9F0000)|(#A20000)|(#A40000)|(#A70000)|(#A90000)|(#AC0000)|(#AE0000)|(#B10000)|(#B30000)|(#B50000)|(#B80000)|(#BA0000)|(#BD0000)|(#A0AE4B)|(#A3677C)|(#A620AD)|(#A8D9DE)|(#AB930F)|(#AE4C40)|(#BF0000)|(#C20000)|(#C40000)|(#C70000)|(#C90000)|(#CC0000)|(#CE0000)|(#D00000)|(#D30000)|(#D50000)|(#D80000)|(#DA0000)|(#DD0000)|(#DF0000)|(#E20000)|(#E40000)|(#E60000)|(#E90000)|(#EB0000)|(#EE0000)|(#F00000)|(#F30000)|(#F50000)|(#F80000)|(#FA0000)|(#FD0000)|(#F7D46B)|(#FA8D9C)|(#FD46CD)|(#FFFFFE)
DIGITO         (#009300)|(#009F00)|(#00AB00)|(#00B700)|(#00C300)|(#00CF00)|(#00DB00)|(#00E700)|(#00F300)|(#00FF00)
MINUSCULO      (#BF0000)|(#C20000)|(#C40000)|(#C70000)|(#C90000)|(#CC0000)|(#CE0000)|(#D00000)|(#D30000)|(#D50000)|(#D80000)|(#DA0000)|(#DD0000)|(#DF0000)|(#E20000)|(#E40000)|(#E60000)|(#E90000)|(#EB0000)|(#EE0000)|(#F00000)|(#F30000)|(#F50000)|(#F80000)|(#FA0000)|(#FD0000)
MAIUSCULO      (#800000)|(#820000)|(#840000)|(#870000)|(#890000)|(#8C0000)|(#8E0000)|(#910000)|(#930000)|(#960000)|(#980000)|(#9A0000)|(#9D0000)|(#9F0000)|(#A20000)|(#A40000)|(#A70000)|(#A90000)|(#AC0000)|(#AE0000)|(#B10000)|(#B30000)|(#B50000)|(#B80000)|(#BA0000)|(#BD0000)
LETRA          {MINUSCULO}|{MAIUSCULO}
ALPHANUMERICO  {LETRA}|{DIGITO}
UNDERLINE         #AB930F
ESPACO           #000000
COMMENT_LINE     #014100
COMMENT_BLOCK    #f0b
EXCLAMACAO     #02B931
ASPAS          #057262   
ASPA           #131057
HASHTAG        #082B93
PERCENT        #0D9DF5
E_COMERCIAL    #105726
PARENTESIS_L   #15C988
PARENTESIS_R   #1882B9
ASTERISCO      #1B3BEA
MAIS           #1DF51B
VIRGULA        #20AE4C
MENOS          #23677D
PONTO          #2620AE
BARRA          #28D9DF
DOIS_PONTOS    #46CEFA
PONTO_E_VIRGULA #49882B
MENOR_QUE      #4C415C
IGUAL          #4EFA8D
MAIOR_QUE      #51B3BE
INTERROGACAO   #546CEF
ARROBA         #572620
COLCHETE_L     #A0AE4B
CONTRA_BARRA   #A3677C
COLCHETE_R     #A620AD
CIRCUNFLEXO    #A8D9DE
CHAVE_L        #F7D46B
PIPE           #FA8D9C
CHAVE_R        #FD46CD


/* Seção de Regras */
%%
[\t]+         { /* Ignorar tabulações */ }
({ESPACO})+       { /* Ignora espaços */ }
\n             { /* Apenas consome a nova linha, yylineno é incrementado automaticamente */ }
{COMMENT_LINE}[^\n]* {  }
{COMMENT_BLOCK}([^#]|(#+[^f])|(#+f[^0])|(#+f0[^b]))*{COMMENT_BLOCK} {  }

#006eff       { return T_IF; }
#ff0000       { return T_ELSE; }
#eaff00       { return T_WHILE; }
#03fcd7  { return T_INT_KEYWORD; }
#ff00c3 {return T_FLOAT_KEYWORD; }
#3f2c1e       { return T_RETURN; }
#ff006e {return T_CHAR_KEYWORD; }
#1900ff {return T_BOOL;}
#00ff04 {return T_STR;}
#ff9a00 {return T_FOR;}
#0f5a00 {return T_VOID;}
#ff00ff {return T_BREAK;}
#84ffce {return T_TRUE;}
#520000 {return T_FALSE;}
#d9d2d2  {return T_NULL;}

({DIGITO})+      {  return T_INTEGER; }
({DIGITO})+({PONTO})({DIGITO})+         { return T_FLOAT; }
({ASPAS})({ASCII_SEM_ASPAS})*({ASPAS}) { return T_STRING; }
({ASPA})(({ASCII_SEM_ASPA})|({CONTRA_BARRA})(({MINUSCULO})|({ASPA})|({CONTRA_BARRA})))({ASPA}) { return T_LITERAL_CHAR; }

(({LETRA})|({UNDERLINE}))((({LETRA})|({UNDERLINE}))|({DIGITO}))*     { yylval = get_symbol_position(yytext); if (yylval != -1) return T_ID; /* Ignora o ID se a tabela estiver cheia */ }

({IGUAL})({IGUAL})            { return T_OP_IGUALDADE; }
({EXCLAMACAO})({IGUAL})           { return T_OP_DIFERENTE; }
({MENOR_QUE})({IGUAL})           { return T_OP_MENOR_IGUAL; }
({MAIOR_QUE})({IGUAL})           { return T_OP_MAIOR_IGUAL; }
({MENOR_QUE})            { return T_OP_MENOR; }
({MAIOR_QUE})             { return T_OP_MAIOR; }
({MAIS})            { return T_OP_SOMA; }
({MENOS})           { return T_OP_SUB; }
({ASTERISCO})            { return T_OP_MULT; }
({BARRA})            { return T_OP_DIV; }
({IGUAL})            { return T_OP_ATRIBUICAO; }

({PONTO_E_VIRGULA})            { return T_PONTO_VIRGULA; }
({VIRGULA})            { return T_VIRGULA; }
({PARENTESIS_L})            { return T_PARENTESES_ESQ; }
({PARENTESIS_R})            { return T_PARENTESES_DIR; }
({CHAVE_L})             { return T_CHAVES_ESQ; }
({CHAVE_R})            { return T_CHAVES_DIR; }

.              {
                   fprintf(stderr, "Erro Léxico na linha %d: Caractere inesperado '%s'\n", yylineno, yytext);
                   return T_UNKNOWN;
               }

%%
/* Seção de Código do Usuário */

int main(int argc, char **argv) {
    if (argc > 1) {
        yyin = fopen(argv[1], "r");
        if (!yyin) {
            perror(argv[1]);
            return 1;
        }
    } else {
        // Permite ler da entrada padrão se nenhum arquivo for fornecido
        yyin = stdin;
    }

    int token_id;
    while ((token_id = yylex())) {
        // Usando switch para uma saída mais detalhada e correta
        switch (token_id) {
            // Palavras-chave
            case T_IF:            printf("Token: %d (T_IF)          | Lexema: %s\n", token_id, yytext); break;
            case T_ELSE:          printf("Token: %d (T_ELSE)        | Lexema: %s\n", token_id, yytext); break;
            case T_WHILE:         printf("Token: %d (T_WHILE)       | Lexema: %s\n", token_id, yytext); break;
            case T_INT_KEYWORD:   printf("Token: %d (T_INT_KEYWORD) | Lexema: %s\n", token_id, yytext); break;
            case T_FLOAT_KEYWORD: printf("Token: %d (T_FLOAT_KEYWORD)| Lexema: %s\n", token_id, yytext); break;
            case T_RETURN:        printf("Token: %d (T_RETURN)      | Lexema: %s\n", token_id, yytext); break;
            case T_CHAR_KEYWORD:  printf("Token: %d (T_CHAR_KEYWORD)| Lexema: %s\n", token_id, yytext); break;
            case T_BOOL:          printf("Token: %d (T_BOOL)        | Lexema: %s\n", token_id, yytext); break;
            case T_STR:           printf("Token: %d (T_STR)         | Lexema: %s\n", token_id, yytext); break;
            case T_FOR:           printf("Token: %d (T_FOR)         | Lexema: %s\n", token_id, yytext); break;
            case T_VOID:          printf("Token: %d (T_VOID)         | Lexema: %s\n", token_id, yytext); break;
            case T_BREAK:         printf("Token: %d (T_BREAK)         | Lexema: %s\n", token_id, yytext); break;
            case T_TRUE:          printf("Token: %d (T_TRUE)         | Lexema: %s\n", token_id, yytext); break;
            case T_FALSE:         printf("Token: %d (T_FALSE)         | Lexema: %s\n", token_id, yytext); break;
            case T_NULL:          printf("Token: %d (T_NULL)         | Lexema: %s\n", token_id, yytext); break;

            // Identificadores e Literais
            case T_ID:            printf("Token: %d (T_ID)          | Posição: %d, Lexema: %s\n", token_id, yylval, symbol_table[yylval]); break;
            case T_INTEGER:       printf("Token: %d (T_INTEGER)     | Lexema: %s\n", token_id, yytext); break;
            case T_FLOAT:         printf("Token: %d (T_FLOAT)       | Lexema: %s\n", token_id, yytext); break;
            case T_STRING:        printf("Token: %d (T_STRING)      | Lexema: %s\n", token_id, yytext); break;
            case T_LITERAL_CHAR:  printf("Token: %d (T_LITERAL_CHAR)| Lexema: %s\n", token_id, yytext); break;

            // Operadores
            case T_OP_IGUALDADE:  printf("Token: %d (T_OP_IGUALDADE)| Lexema: %s\n", token_id, yytext); break;
            case T_OP_DIFERENTE:  printf("Token: %d (T_OP_DIFERENTE)| Lexema: %s\n", token_id, yytext); break;
            case T_OP_MENOR:      printf("Token: %d (T_OP_MENOR)    | Lexema: %s\n", token_id, yytext); break;
            case T_OP_MAIOR:      printf("Token: %d (T_OP_MAIOR)    | Lexema: %s\n", token_id, yytext); break;
            case T_OP_MENOR_IGUAL:printf("Token: %d (T_OP_MENOR_IGUAL)| Lexema: %s\n", token_id, yytext); break;
            case T_OP_MAIOR_IGUAL:printf("Token: %d (T_OP_MAIOR_IGUAL)| Lexema: %s\n", token_id, yytext); break;
            case T_OP_SOMA:       printf("Token: %d (T_OP_SOMA)     | Lexema: %s\n", token_id, yytext); break;
            case T_OP_SUB:        printf("Token: %d (T_OP_SUB)      | Lexema: %s\n", token_id, yytext); break;
            case T_OP_MULT:       printf("Token: %d (T_OP_MULT)     | Lexema: %s\n", token_id, yytext); break;
            case T_OP_DIV:        printf("Token: %d (T_OP_DIV)      | Lexema: %s\n", token_id, yytext); break;
            case T_OP_ATRIBUICAO: printf("Token: %d (T_OP_ATRIBUICAO)| Lexema: %s\n", token_id, yytext); break;

            // Separadores
            case T_PONTO_VIRGULA:  printf("Token: %d (T_PONTO_VIRGULA)| Lexema: %s\n", token_id, yytext); break;
            case T_VIRGULA:        printf("Token: %d (T_VIRGULA)      | Lexema: %s\n", token_id, yytext); break;
            case T_PARENTESES_ESQ: printf("Token: %d (T_PARENTESES_ESQ)| Lexema: %s\n", token_id, yytext); break;
            case T_PARENTESES_DIR: printf("Token: %d (T_PARENTESES_DIR)| Lexema: %s\n", token_id, yytext); break;
            case T_CHAVES_ESQ:     printf("Token: %d (T_CHAVES_ESQ)   | Lexema: %s\n", token_id, yytext); break;
            case T_CHAVES_DIR:     printf("Token: %d (T_CHAVES_DIR)   | Lexema: %s\n", token_id, yytext); break;

            case T_UNKNOWN:
                // A mensagem de erro já foi impressa para stderr
                break;
            default:
                // Este caso não deve ocorrer se todos os tokens forem tratados
                printf("Token não reconhecido no main: %d\n", token_id);
                break;
        }
    }

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
    
    // Fecha o arquivo se ele foi aberto
    if (yyin != stdin) {
        fclose(yyin);
    }

    return 0;
}