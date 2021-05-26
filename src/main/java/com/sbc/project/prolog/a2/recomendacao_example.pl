:- [preprocess, bd], dynamic(example/2).

% the goal is to classify recomendacao

attribute(sexo,  [ masculino, feminino ]).
attribute(idade, [ 0-17, 18-40, 41-100 ]).
attribute(dieta, [ saudavel, nao_saudavel ]).
attribute(tempo, [ tempo_pouco, tempo_medio, tempo_alto ]).
attribute(preco, [ preco_baixo, preco_medio, preco_alto ]).
attribute(categorias, [ carnes, portuguesa, churrasco, hamburguer, fast_food, vegetariana, italiana, massa, marisco, japonesa, peixe, sushi, sobremesa, pizza, salada ]).
attribute(classificacao, [ classificacao_boa, classificacao_media, classificacao_baixo ]).

% lets preprocess the data:
createfile:- 
	preprocess, % build all examples
	tell('recomendacao_example2.pl'),
        listing(attribute/2),
        listing(example/2),
        told.
