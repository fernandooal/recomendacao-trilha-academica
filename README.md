# recomendacao-trilha-academica

Testes básicos sobre a Base de Conhecimento.
Com o SWI-Prolog instalado, abra o terminal e digite: `swipl` ou carregue os códigos diretamente no web site: https://swish.swi-prolog.org/

Para carregar a base de conhecimento, utilize o comando:
```
?- [base_conhecimento].
```

Para testar as trilhas acadêmicas, utilize o comando:
```
?- trilha(X, Y).
```
Se teclar `;` após o resultado, irá carregar a próxima trilha acadêmica (X) com sua descrição (Y). Se teclar `enter` após o resultado, irá parar e mostrar apenas o resultado encontrado.

Para testar o perfil, utilize o comando:
```
?- perfil(nome_da_trilha, Caracteristica, Peso).
```
Substitua `nome_da_trilha` pelo nome da trilha acadêmica que deseja consultar. Se teclar `;` após o resultado, irá carregar a próxima característica (Caracteristica) com seu peso (Peso). Se teclar `enter` após o resultado, irá parar e mostrar apenas o resultado encontrado.

Para testar as perguntas, utilize o comando:
```
?- pergunta(N, Pergunta, Caracteristica).
```
Substitua `N` pelo número da pergunta que deseja consultar. 
Se não substituir `N`, irá listar todas as perguntas com suas características.
Processo de listagem é o mesmo, teclar `;` para próxima pergunta e `enter` para parar.

Para contar o número de trilhas acadêmicas cadastradas, utilize o comando:
```
?- findall(X, trilha(X, _), Trilhas), length(Trilhas, N).
```
Trilhas mostrará uma lista com o nome de todas as trilhas acadêmicas cadastradas.
O resultado `N` será o número de trilhas acadêmicas cadastradas.

Listar todos os fatos de um tipo:
```
?- listing(trilha/2).
?- listing(perfil/3).
?- listing(pergunta/3).
```
O número após a barra indica o número de argumentos do fato.

