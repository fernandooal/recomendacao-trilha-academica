% Arquivo central de testes para o Sistema Especialista

:- [base_conhecimento].
:- [motor_inferencia].

% Utilitário para carregar e executar teste de perfil
executa_teste(ArquivoPerfil, Recomendacoes) :-
    consult(ArquivoPerfil),
    teste(Recomendacoes).

% Lista auxiliar de perguntas (substitui todas_perguntas/1 localmente)
todas_perguntas(IDs) :-
    findall(ID, pergunta(ID, _, _), IDs).

% Lista auxiliar de trilhas
todas_trilhas(Trilhas) :-
    findall(T, trilha(T, _), Trilhas).

% Testes OK