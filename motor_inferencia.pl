% ==============================================================================
% Motor de Inferência
% ==============================================================================

% ------------------------------------------------------------------------------
% calcula_pontuacao(Trilha, Respostas, Pontuacao, Detalhes)
% Retorna a soma da pontuação e também os detalhes (Caracteristica-Peso).
% ------------------------------------------------------------------------------

calcula_pontuacao(Trilha, Respostas, Pontuacao, Detalhes) :-
    findall(Caracteristica-Peso,
        ( member(resposta(N, s), Respostas),
          pergunta(N, _, Caracteristica),
          perfil(Trilha, Caracteristica, Peso)
        ),
        Pares),
    pairs_values(Pares, Pesos),
    sum_list(Pesos, Pontuacao),
    Detalhes = Pares.

% ------------------------------------------------------------------------------
% pontuacao_maxima(Trilha, Max)
% Calcula a soma maxima possível da trilha (se o usuário dissesse "s" para tudo).
% ------------------------------------------------------------------------------

pontuacao_maxima(Trilha, Max) :-
    findall(Peso,
        perfil(Trilha, _, Peso),
        Pesos),
    sum_list(Pesos, Max).

% ------------------------------------------------------------------------------
% compatibilidade(Trilha, Respostas, Percentual, Detalhes)
% Calcula a compatibilidade comparando os pontos obtidos através das perguntas 
% com o maximo que pode ser obtido, retornando o valor em % e os detalhes da trilha.
% ------------------------------------------------------------------------------

compatibilidade(Trilha, Respostas, Percentual, Detalhes) :-
    calcula_pontuacao(Trilha, Respostas, Pontuacao, Detalhes),
    pontuacao_maxima(Trilha, Max),
    ( Max > 0 ->
        Percentual is (Pontuacao / Max) * 100
    ;   Percentual = 0 ).

% ------------------------------------------------------------------------------
% recomenda(Respostas, Recomendacoes)
% Retorna uma lista ordenada: (Trilha, Percentual, Detalhes).
% ------------------------------------------------------------------------------

recomenda(Respostas, Recomendacoes) :-
    findall((Trilha, Percentual, Detalhes),
        ( trilha(Trilha, _),
          compatibilidade(Trilha, Respostas, Percentual, Detalhes)
        ),
        Lista),
    sort(2, @>=, Lista, Recomendacoes).
