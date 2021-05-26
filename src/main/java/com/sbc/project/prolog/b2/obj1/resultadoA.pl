:-[comum].

%Destino
%destino(cliente3).

% Função de avaliação
eval(Solucao, Totaleval):- lucro(Solucao,Totallucro),custo(Solucao,Totalcusto),
	Totaleval is Totallucro - Totalcusto.

% S is the solution
runA1:- 	initial(S0), 
	% 100 iterations, reporta a cada 20 iterações (puro hill climbing)
	time(hill_climbing(S0,[100,20,0,max],S)),
	eval(S,Totaleval),
        write('sol:'),write(S),nl,write('lucro:'),write(Totaleval),nl.