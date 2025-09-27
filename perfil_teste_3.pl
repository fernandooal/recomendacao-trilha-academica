% Perfil 3: Infraestrutura e Sistemas
% Esperado: redes_e_infraestrutura ou seguranca_da_informacao

resposta(1, s).  % matemática
resposta(2, s).  % programação
resposta(4, s).  % pensamento lógico
resposta(9, s).  % atenção a detalhes
resposta(11, s). % trabalho autônomo
resposta(12, s). % inglês técnico

teste(Recomendacoes) :-
    findall(resposta(ID, R), resposta(ID, R), ListaRespostas),
    recomenda(ListaRespostas, Recomendacoes).
% Testes OK