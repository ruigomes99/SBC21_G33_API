:-[search].
:- dynamic goal/3.

% -- Estados:
initial([restaurante]). 
goal(X):- goal1(G1), member(G1,X), goal2(G2), member(G2,X).

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
s(L1,L2):- last(L1,ClienteA), viagem(ClienteA,ClienteB,_), append(L1,[ClienteB],L2). 

% soma do tempo dos pares
somatempo([_],0).
somatempo([Cliente1,Cliente2|R],Tempototal):- 
	viagem(Cliente1,Cliente2,D), 
	somatempo([Cliente2|R],DR),
	Tempototal is D+DR.

% verifica qual é o lucro total
totallucro([], 0).
totallucro([H|T], Lucrototal) :- encomendas(H,L), egoal(G), member(H,G) -> totallucro(T, Rest), Lucrototal is L + Rest; 
	totallucro(T, Lucrototal).
   	
%soma dos tempos de entrega
somaentrega([], 0).
	somaentrega([H|T], Tempoentrega) :- egoal(G), member(H,G) -> somaentrega(T, Rest), Tempoentrega is 1 + Rest; 
	somaentrega(T, Tempoentrega).

% Metodo de execução
run(Method):- search(Method,Par,S),
	write('metodo:'),write(Method),writepar(Par),nl,
	last(S,LS),
              	write('solucao:'),write(LS),nl,
	length(LS,N),N1 is N-1,write('passos para solucao:'),write(N1),nl,
       	somatempo(LS,Tempototal), somaentrega(LS,Tempoentrega), Soma is Tempototal + Tempoentrega, write('Tempo:'),write(Soma),nl,
	totallucro(LS,Lucrototal), write('Lucro:'),write(Lucrototal).

% write parameter (if any):
writepar(X):- integer(X),write(' par:'),write(X). % write X
writepar(_). % do not write X

% Exemplos de execução
q1:- run(depthfirst).
q2:- run(iterativedeepening).
q3:- run(breadthfirst).
