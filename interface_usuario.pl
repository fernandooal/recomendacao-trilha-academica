% ==============================================================================
% Interface com o usuário e fluxo de execução.
% ==============================================================================

% ------------------------------------------------------------------------------
% Importação do motor de inferência, que já importa a base de conhecimento.
% ------------------------------------------------------------------------------

:- [motor_inferencia].

% ------------------------------------------------------------------------------
% Predicado principal que inicia a execução do sistema.
% Responsabilidades:
% 1. Limpa respostas de execuções anteriores.
% 2. Apresenta o sistema ao usuário.
% 3. Inicia o questionário.
% 4. Coleta as respostas.
% 5. Chama o motor de inferência para obter as recomendações.
% 6. Exibe os resultados formatados.
% 7. Limpa as respostas ao final da execução.
% ------------------------------------------------------------------------------

iniciar :-
    retractall(resposta(_, _)), % Garante que não há respostas pré-existentes
    nl,
    writeln('Sistema Especialista para Recomendação de Trilha Acadêmica'),
    writeln(' '),
    writeln('Responda às perguntas com ''s'' (sim) ou ''n'' (não).'),
    nl,
    faz_perguntas, % Inicia o questionário
    findall(resposta(N, R), resposta(N, R), Respostas), % Coleta as respostas
    recomenda(Respostas, Recomendacoes), % Gera a lista de recomendações
    exibe_resultado(Recomendacoes), % Exibe o resultado final
    retractall(resposta(_, _)). % Limpa as respostas para a próxima execução

% ------------------------------------------------------------------------------
% Predicado que controla o fluxo do questionário.
% Itera sobre todas as perguntas cadastradas na base de conhecimento.
% ------------------------------------------------------------------------------

faz_perguntas :-
    forall(pergunta(N, Texto, _), pergunta_usuario(N, Texto)).

% ------------------------------------------------------------------------------
% Predicado que exibe uma pergunta e processa a resposta do usuário.
% ------------------------------------------------------------------------------

pergunta_usuario(N, Texto) :-
    format('~w~n', [Texto]),
    read_resposta(Resposta),
    assertz(resposta(N, Resposta)).

% ------------------------------------------------------------------------------
% Predicado para ler e validar a resposta do usuário (s/n).
% Garante que apenas 's' ou 'n' sejam aceitos.
% ------------------------------------------------------------------------------

read_resposta(Resposta) :-
    write('Resposta (s/n): '),
    read_line_to_string(user_input, Linha),
    string_lower(Linha, RespostaStr), % Converte para minúsculas
    ( (RespostaStr = "s" ; RespostaStr = "sim") -> Resposta = s
    ; (RespostaStr = "n" ; RespostaStr = "nao") -> Resposta = n
    ; writeln('Resposta inválida. Por favor, digite ''s'' ou ''n''.'),
      read_resposta(Resposta)
    ).

% ------------------------------------------------------------------------------
% Predicado para exibir o resultado final de forma clara e organizada.
% ------------------------------------------------------------------------------

exibe_resultado([]) :-
    nl,
    writeln('Não foi possível gerar uma recomendação com base nas suas respostas.'),
    nl.

exibe_resultado(Recomendacoes) :-
    nl,
    writeln('Resultado da sua Avaliação: '),
    nl,
    imprime_recomendacoes(Recomendacoes).

% ------------------------------------------------------------------------------
% Predicados auxiliares para imprimir a lista de recomendações.
% ------------------------------------------------------------------------------

imprime_recomendacoes([]).
imprime_recomendacoes([(Trilha, Percentual, Detalhes)|Resto]) :-
    format('Trilha: ~w~n', [Trilha]),
    trilha(Trilha, Descricao),
    format('Descrição: ~w~n', [Descricao]),
    format('Compatibilidade: ~2f%~n', [Percentual]),
    imprime_justificativa(Detalhes),
    nl,
    writeln('------------------------------------------------------------------'),
    nl,
    imprime_recomendacoes(Resto).

% ------------------------------------------------------------------------------
% Predicado para imprimir a justificativa, explicando a pontuação.
% ------------------------------------------------------------------------------

imprime_justificativa([]) :-
    writeln('Justificativa: Nenhuma característica correspondente foi identificada.').

imprime_justificativa(Detalhes) :-
    writeln('Justificativa: Sua pontuação foi baseada no seu interesse em:'),
    imprime_detalhes(Detalhes).

imprime_detalhes([]).
imprime_detalhes([Caracteristica-Peso|Resto]) :-
    format('- ~w (Relevância: ~w/5)~n', [Caracteristica, Peso]),
    imprime_detalhes(Resto).