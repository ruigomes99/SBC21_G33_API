:-[search].

% -- Estados:
initial(restaurante).

% --- base de conhecimento:
% caminho(Origem,Destino,Tempo)
caminho(restaurante,cliente1,5).
caminho(restaurante,cliente4,7).
caminho(cliente1,cliente2,5).
caminho(cliente1,cliente4,5).
caminho(cliente1,cliente5,5).
caminho(cliente2,cliente3,3).
caminho(cliente2,cliente4,2).
caminho(cliente2,cliente5,2).
caminho(cliente3,cliente4,4).
caminho(cliente3,cliente5,5).

% encomendas(Cliente, Lucro)
encomendas(cliente1, 5).
encomendas(cliente2, 6).
encomendas(cliente3, 7).
encomendas(cliente4, 8).
encomendas(cliente5, 9).

% Fazer a simetria do caminho
viagem(ClienteA,ClienteB,Tempo):-(caminho(ClienteA,ClienteB,Tempo);caminho(ClienteB,ClienteA,Tempo)).

% Transição de estdos: s(ClienteA,ClienteB)
% há uma transição entre o ClienteA e ClienteB se poder fazer uma viagem entre N1 e N2
s(ClienteA,ClienteB):- viagem(ClienteA,ClienteB,_).

% soma do tempo dos pares
somatempo([_],1).
somatempo([Cliente1,Cliente2|R],Tempototal):- 
	viagem(Cliente1,Cliente2,Tempo),
	somatempo([Cliente2|R],TempoR),
	Tempototal is Tempo + TempoR.

% verifica qual é o lucro total
totallucro([C],Lucrototal):- encomendas(C,P), Lucrototal is P.
totallucro([_,Y|Z],Lucrototal) :- totallucro([Y|Z],Lucrototal).


% Metodo de execução
run(Method):- search(Method,Par,S),
	write('metodo:'),write(Method),writepar(Par),nl,
              	write('solucao:'),write(S),nl,
	length(S,N),N1 is N-1,write('passos para solucao:'),write(N1),nl,
       	somatempo(S,Tempototal),write('Tempo:'),write(Tempototal),nl,
	totallucro(S,Lucrototal),write('Lucro:'),write(Lucrototal).

% write parameter (if any):
writepar(X):- integer(X),write(' par:'),write(X). % write X
writepar(_). % do not write X

% Exemplos de execução
q1:- run(depthfirst).
q2:- run(iterativedeepening).
q3:- run(breadthfirst).
