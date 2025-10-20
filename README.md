# C0DEFF

## Como usar

1. Instale o Flex e o GCC no seu sistema.
2. Clone este repositório para o seu ambiente local.
3. Navegue para a pasta do repositório.
4. Execute o comando `flex scanner_c.l` para gerar o arquivo C do scanner.
   Você pode usar `flex scanner_c_full.l` se quiser uma visualização mais detalhada de cada token.
5. Compile o arquivo gerado com o comando `gcc lex.yy.c -o scanner`.
6. Execute o scanner com `./scanner hex.lang` para analisar o arquivo de teste `hex.lang`.
   Você pode substituir `hex.lang` por qualquer outro arquivo de código-fonte que deseja analisar.

## Arquivos de teste

- `hex.lang`: Um arquivo de exemplo contendo código-fonte para testar o scanner.
- `potencia.hex.lang`: Arquivo de exemplo contendo código-fonte que demonstra a função de potência.
- `busca-seq.hex.lang`: Arquivo de exemplo contendo código-fonte que demonstra a busca sequencial num vetor predeterminado.
- `fibonacci.hex.lang`: Arquivo de exemplo contendo código-fonte que demonstra o cálculo da média de qualquer valor da sequência de Fibonacci.

## Exemplos de tokenizações

- `result.tok`: Saída do scanner para o arquivo `hex.lang`.
- `potencia.tok`: Saída do scanner para o arquivo `potencia.hex.lang`.
- `busca-seq.tok`: Saída do scanner para o arquivo `busca-seq.hex.lang`.
- `fibonacci.tok`: Saída do scanner para o arquivo `fibonacci.hex.lang`.
