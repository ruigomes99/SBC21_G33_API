:-[comum].

% Função de avaliação
eval(Solucao, Totaleval):- lucro(Solucao,Totallucro),custo(Solucao,Totalcusto),
	Totaleval is Totallucro - Totalcusto.

% S is the solution
runA2(S, Totaleval, L):- 
	maior_lucro(Cliente), 
	list_maior_lucro(Cliente, L),
	assert(destino(L)),
	initial(S0), 
	% 100 iterations, reporta a cada 20 iterações (puro hill climbing)
	time(hill_climbing(S0,[100,20,0,max],S)),
	eval(S,Totaleval),
        	write('sol:'),write(S),nl,write('lucro:'),write(Totaleval),nl,write('Encomendas a selecionar: '),write(L),nl.