:-[comum].

%Destino
%destino(cliente3).

% Função de avaliação
eval(Solucao, Totaleval):- lucro(Solucao,Totallucro),custo(Solucao,Totalcusto), tempo(Solucao,Totaltempo), entrega(Solucao,Totalentrega),
	TS is Totallucro - Totalcusto, TT is Totaltempo + Totalentrega,
	Totaleval is TS*0.8 + (20-TT)*0.2.

% S is the solution
runC1:- 	initial(S0), 
	% 100 iterations, reporta a cada 20 iterações (puro hill climbing)
	time(hill_climbing(S0,[100,20,0,max],S)),
	eval(S,Totaleval),
        write('sol:'),write(S),nl,write('lucro:'),write(Totaleval),nl.