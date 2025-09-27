% profiletestinterface.pl
% Interface interativa para testar perfis simulados

:- dynamic carregado/1.

% Início do menu interativo
iniciar_testes :-
    writeln('=== Testador de Perfis (Modo Simulado) ==='),
    writeln('1. Rodar perfil_teste_1.pl'),
    writeln('2. Rodar perfil_teste_2.pl'),
    writeln('3. Rodar perfil_teste_3.pl'),
    writeln('0. Sair'),
    write('Escolha: '), read(Opcao),
    tratar_opcao(Opcao).

% Trata a escolha do usuário
tratar_opcao(0) :-
    writeln('Encerrando...'), !.

tratar_opcao(N) :-
    between(1, 3, N),
    format('\nExecutando perfil_teste_~w.pl...\n', [N]),
    executar_teste_simulado(N),
    nl, iniciar_testes.

tratar_opcao(_) :-
    writeln('Opção inválida. Tente novamente.'),
    iniciar_testes.

% Executa o teste correspondente ao perfil selecionado
executar_teste_simulado(N) :-
    format(atom(Arquivo), 'perfil_teste_~w.pl', [N]),
    descarregar_anterior,
    consult(Arquivo),
    asserta(carregado(Arquivo)),
    teste(Recomendacoes),
    (   Recomendacoes == []
    ->  writeln('Nenhuma trilha recomendada.')
    ;   exibir_resultados(Recomendacoes)
    ).

% Remove o arquivo de teste anterior da memória
descarregar_anterior :-
    carregado(ArquivoAnterior), !,
    unload_file(ArquivoAnterior),
    retract(carregado(ArquivoAnterior)).

descarregar_anterior.  % Se não houver nada carregado, segue normalmente

% Exibe os resultados formatados
exibir_resultados([]).  % fim da recursão sem mensagem

exibir_resultados([(Trilha, Percentual, Caracteristicas) | Resto]) :-
    format('~nTrilha: ~w (~2f%)', [Trilha, Percentual]),
    writeln('\nCaracterísticas contribuíram:'),
    listar_caracteristicas(Caracteristicas),
    exibir_resultados(Resto).

% Lista características e pesos
listar_caracteristicas([]).  % evita impressão redundante

listar_caracteristicas([C-P | R]) :-
    format(' - ~w (peso ~w)~n', [C, P]),
    listar_caracteristicas(R).