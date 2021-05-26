:-[satisfy,induce_ifthen,recomendacao_example2,recomendacao_ifthen].

learn_rules:-
	learn(no),  % negative examples
	learn(yes), % positive examples
        % save new rules:
	tell('recomendacao_ifthen.pl'),
	listing(<==),
	told.

q1(Class):- classify([sexo=feminino,categorias=sushi,tempo=tempo_medio,idade=41-100,preco=preco_alto,classificacao=classificacao_baixo,dieta=saudavel],Class).
q2(Class):- classify([sexo=feminino,categorias=massa,tempo=tempo_alto,idade=18-40,preco=preco_alto,classificacao=classificacao_media,dieta=saudavel],Class).
q3(Class):- classify([sexo=feminino,categorias=sushi],Class).
q4(Class):- classify([sexo=masculino,categorias=hamburguer,tempo=tempo_medio,idade=0-17,preco=preco_baixo,classificao=classificao_boa,dieta=nao_saudavel],Class).
q5(Class):- classify([sexo=feminino,idade=41-100,dieta=nao_saudavel,tempo=tempo_medio,preco=preco_alto,categorias=vegetariana,classificacao=classificacao_baixo], Class).
