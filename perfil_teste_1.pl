% Perfil 1: Lógico e Analítico
% Esperado: inteligencia_artificial ou ciencia_de_dados

resposta(1, s).  % matemática
resposta(2, s).  % programação
resposta(3, s).  % problemas complexos
resposta(4, s).  % pensamento lógico
resposta(5, s).  % pesquisa científica
resposta(12, s). % inglês técnico

teste(Recomendacoes) :-
    findall(resposta(ID, R), resposta(ID, R), ListaRespostas),
    recomenda(ListaRespostas, Recomendacoes).
