% Perfil 2: Criativo e Visual
% Esperado: desenvolvimento_web ou similar

resposta(1, n).  % matemática
resposta(3, n).  % problemas complexos
resposta(6, s).  % comunicação
resposta(7, s).  % design visual
resposta(8, s).  % criatividade
resposta(10, s). % trabalho em equipe

teste(Recomendacoes) :-
    findall(resposta(ID, R), resposta(ID, R), ListaRespostas),
    recomenda(ListaRespostas, Recomendacoes).
