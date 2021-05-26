:-dynamic(fact/1),
[forward, base_dados, base_conhecimento].

%:-assert(fact(preco_0_7)), assert(fact(idade_18_29)), assert(fact(apressado)), assert(fact('classificacao_>47')), assert(fact(carnes)), assert(fact(bebida_nao_incluida)), assert(fact(entregar)).

resultados(L):-
	fact(TIPO),
    	fact(PRECO:P2), 
	fact(DURACAO:P3), 
	fact(CLASSIFICACAO:P4), 
	fact(CATEGORIA), 
	fact(BEBIDA:P5), 
    	(pedido(TIPO, PRECO, DURACAO, CLASSIFICACAO, X, BEBIDA, OUTPUT), memberchk(CATEGORIA, X)),
	append([P], OUTPUT, L),
	P is (P2 + P3 + P4 + P5) / 4.

resultados(_).

consulta(C):-
    	demo,
    	findall(L, resultados(L), O1), list_to_set(O1, C).