:-[auxiliar,hill].

% Pior solução inicial
initial([restaurante,cliente1,cliente2,cliente5,cliente3,cliente4,restaurante]).

%Seed aleatória
:- set_random(seed(12345)). % set initial random seed

% caminho(Origem,Destino,Tempo, Custo)
caminho(restaurante,cliente1,5,1).
caminho(restaurante,cliente4,7,1).
caminho(cliente1,cliente2,5,1).
caminho(cliente1,cliente4,5,1).
caminho(cliente1,cliente5,5,1).
caminho(cliente2,cliente3,3,1).
caminho(cliente2,cliente4,2,1).
caminho(cliente2,cliente5,2,1).
caminho(cliente3,cliente4,4,1).
caminho(cliente3,cliente5,5,1).

caminho(cliente1,restaurante,5,1).
caminho(cliente4,restaurante,7,1).
caminho(cliente2,cliente1,5,1).
caminho(cliente4,cliente1,5,1).
caminho(cliente5,cliente1,5,1).
caminho(cliente3,cliente2,3,1).
caminho(cliente4,cliente2,2,1).
caminho(cliente5,cliente2,2,1).
caminho(cliente4,cliente3,4,1).
caminho(cliente5,cliente3,5,1).

% encomendas(Cliente, Lucro)
encomendas(cliente1, 5).
encomendas(cliente2, 6).
encomendas(cliente3, 7).
encomendas(cliente4, 8).
encomendas(cliente5, 9).

% Fazer a simetria do caminho
viagem(ClienteA,ClienteB,Tempo,Custo):-(caminho(ClienteA,ClienteB,Tempo,Custo);caminho(ClienteB,ClienteA,Tempo,Custo)).

% soma do lucro
lucro([_],0).
lucro([_,Cliente|R],Totallucro):- 
	encomendas(Cliente,Lucro), destino(D), member(Cliente,D) -> lucro([Cliente|R],LR), Totallucro is Lucro+LR; 
	lucro([Cliente|R],Totallucro).

% soma dos custos
custo([_],0).
custo([ClienteA,ClienteB|R],Totalcusto):- 
	viagem(ClienteA,ClienteB,_,Custo),
	custo([ClienteB|R],CR),
	Totalcusto is Custo+CR.

% soma dos tempos
tempo([_],0).
tempo([ClienteA,ClienteB|R],Totaltempo):- 
	viagem(ClienteA,ClienteB,Tempo,_),
	tempo([ClienteB|R],TR),
	Totaltempo is Tempo+TR.

%soma dos tempos de entrega
entrega([], 0).
entrega([Cliente|T], Totalentrega) :- 
	destino(D), member(Cliente,D) -> entrega(T, Rest), Totalentrega is 1 + Rest; 
	entrega(T, Totalentrega).

% Retorna o cliente com maior possibilidade de lucro
maior_lucro(Cliente) :-
   	encomendas(Cliente, W), \+ (encomendas(_, W1), W1 > W).

maior_lucro_plus(Cliente, Atual):- 
	encomendas(Atual, AtualLucro), encomendas(Cliente, W), \+ (encomendas(_, W1), W1 > W, W1 < AtualLucro).

list_maior_lucro(MaiorAtual, Lista) :-
    findall(Clientes, maior_lucro_plus(Clientes, MaiorAtual), Lista).

% change: switch 2 adjacent cities at random position:	
change(S1,S2):-
	length(S1,L),
	random_between(1,L,P1),
        	change(S1,P1,L,S2).

change(S1,P1,L,S2):- % general case, normal switch
	P1>2, P1<L, % normal switch
	nth1(P1,S1,City1),
	P2 is P1-1,
	nth1(P2,S1,City2),
	replace_list(S1,P1,City2,S11),
	replace_list(S11,P2,City1,S2).

change(S1,1,L,S2):- % P1 is 1
	P2 is L-1, % last non repeated city
        nth1(1,S1,City1),
	nth1(P2,S1,City2),
	replace_list(S1,1,City2,S11),
	replace_list(S11,P2,City1,S12),
	replace_list(S12,L,City2,S2). % last

change(S1,2,L,S2):- % P1 is 2
	P2 is 1, % first element
        nth1(2,S1,City1),
	nth1(P2,S1,City2),
	replace_list(S1,2,City2,S11),
	replace_list(S11,P2,City1,S12),
	replace_list(S12,L,City1,S2). % last

change(S1,L,L,S2):- % P1 is L
	P2 is L-1, % last non repeated city
        nth1(L,S1,City1),
	nth1(P2,S1,City2),
	replace_list(S1,L,City2,S11),
	replace_list(S11,P2,City1,S12),
	replace_list(S12,1,City2,S2). % last