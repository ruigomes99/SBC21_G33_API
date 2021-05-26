:-[comum].

%Destino
%destino(cliente3).

% Função de avaliação
eval(Solucao, Totaleval):- tempo(Solucao,Totaltempo), entrega(Solucao,Totalentrega),
	Totaleval is Totaltempo + Totalentrega.

% S is the solution
runB1:- 	initial(S0), 
	% 100 iterations, reporta a cada 20 iterações (puro hill climbing)
	time(hill_climbing(S0,[100,20,0,min],S)),
	eval(S,Totaleval),
        write('sol:'),write(S),nl,write('tempo:'),write(Totaleval),nl.