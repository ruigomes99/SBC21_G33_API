attribute(sexo, [masculino, feminino]).
attribute(idade, [0-17, 18-40, 41-100]).
attribute(dieta, [saudavel, nao_saudavel]).
attribute(tempo, [tempo_pouco, tempo_medio, tempo_alto]).
attribute(preco, [preco_baixo, preco_medio, preco_alto]).
attribute(categorias, [carnes, portuguesa, churrasco, hamburguer, fast_food, vegetariana, italiana, massa, marisco, japonesa, peixe, sushi, sobremesa, pizza, salada]).
attribute(classificacao, [classificacao_boa, classificacao_media, classificacao_baixo]).

:- dynamic example/2.

example(no, [sexo=masculino, idade='0-17', dieta=saudavel, tempo=tempo_pouco, preco=preco_baixo, categorias=carnes, classificacao=classificacao_boa]).
example(no, [sexo=masculino, idade='18-40', dieta=saudavel, tempo=tempo_pouco, preco=preco_medio, categorias=portuguesa, classificacao=classificacao_media]).
example(no, [sexo=masculino, idade='41-100', dieta=saudavel, tempo=tempo_pouco, preco=preco_alto, categorias=churrasco, classificacao=classificacao_baixo]).
example(yes, [sexo=masculino, idade='0-17', dieta=nao_saudavel, tempo=tempo_medio, preco=preco_baixo, categorias=hamburguer, classificacao=classificacao_boa]).
example(yes, [sexo=masculino, idade='18-40', dieta=nao_saudavel, tempo=tempo_baixo, preco=preco_baixo, categorias=fast_food, classificacao=classificacao_media]).
example(no, [sexo=masculino, idade='41-100', dieta=nao_saudavel, tempo=tempo_medio, preco=preco_medio, categorias=vegetariana, classificacao=classificacao_baixo]).
example(yes, [sexo=masculino, idade='0-17', dieta=saudavel, tempo=tempo_alto, preco=preco_medio, categorias=italiana, classificacao=classificacao_media]).
example(yes, [sexo=masculino, idade='18-40', dieta=saudavel, tempo=tempo_alto, preco=preco_alto, categorias=massa, classificacao=classificacao_media]).
example(yes, [sexo=masculino, idade='41-100', dieta=saudavel, tempo=tempo_alto, preco=preco_alto, categorias=marisco, classificacao=classificacao_boa]).
example(no, [sexo=masculino, idade='0-17', dieta=nao_saudavel, tempo=tempo_pouco, preco=preco_baixo, categorias=japonesa, classificacao=classificacao_boa]).
example(no, [sexo=masculino, idade='18-40', dieta=nao_saudavel, tempo=tempo_pouco, preco=preco_baixo, categorias=peixe, classificacao=classificacao_media]).
example(no, [sexo=masculino, idade='41-100', dieta=nao_saudavel, tempo=tempo_pouco, preco=preco_baixo, categorias=sushi, classificacao=classificacao_baixo]).
example(no, [sexo=masculino, idade='0-17', dieta=saudavel, tempo=tempo_baixo, preco=preco_baixo, categorias=sobremesa, classificacao=classificacao_boa]).
example(no, [sexo=masculino, idade='18-40', dieta=saudavel, tempo=tempo_medio, preco=preco_medio, categorias=pizza, classificacao=classificacao_media]).
example(yes, [sexo=masculino, idade='41-100', dieta=saudavel, tempo=tempo_baixo, preco=preco_baixo, categorias=salada, classificacao=classificacao_media]).
example(yes, [sexo=masculino, idade='0-17', dieta=nao_saudavel, tempo=tempo_alto, preco=preco_alto, categorias=carnes, classificacao=classificacao_boa]).
example(yes, [sexo=masculino, idade='18-40', dieta=nao_saudavel, tempo=tempo_alto, preco=preco_alto, categorias=portuguesa, classificacao=classificacao_boa]).
example(yes, [sexo=masculino, idade='41-100', dieta=nao_saudavel, tempo=tempo_medio, preco=preco_baixo, categorias=churrasco, classificacao=classificacao_media]).
example(no, [sexo=masculino, idade='0-17', dieta=saudavel, tempo=tempo_pouco, preco=preco_alto, categorias=hamburguer, classificacao=classificacao_media]).
example(no, [sexo=masculino, idade='18-40', dieta=saudavel, tempo=tempo_medio, preco=preco_baixo, categorias=fast_food, classificacao=classificacao_media]).
example(yes, [sexo=masculino, idade='41-100', dieta=saudavel, tempo=tempo_alto, preco=preco_medio, categorias=vegetariana, classificacao=classificacao_baixo]).
example(no, [sexo=feminino, idade='0-17', dieta=nao_saudavel, tempo=tempo_medio, preco=preco_alto, categorias=italiana, classificacao=classificacao_boa]).
example(no, [sexo=feminino, idade='18-40', dieta=nao_saudavel, tempo=tempo_pouco, preco=preco_baixo, categorias=massa, classificacao=classificacao_media]).
example(no, [sexo=feminino, idade='41-100', dieta=nao_saudavel, tempo=tempo_alto, preco=preco_alto, categorias=marisco, classificacao=classificacao_boa]).
example(yes, [sexo=feminino, idade='0-17', dieta=saudavel, tempo=tempo_medio, preco=preco_alto, categorias=japonesa, classificacao=classificacao_boa]).
example(yes, [sexo=feminino, idade='18-40', dieta=saudavel, tempo=tempo_alto, preco=preco_medio, categorias=peixe, classificacao=classificacao_boa]).
example(yes, [sexo=feminino, idade='41-100', dieta=saudavel, tempo=tempo_medio, preco=preco_alto, categorias=sushi, classificacao=classificacao_boa]).
example(yes, [sexo=feminino, idade='0-17', dieta=nao_saudavel, tempo=tempo_baixo, preco=preco_medio, categorias=sobremesa, classificacao=classificacao_boa]).
example(yes, [sexo=feminino, idade='18-40', dieta=nao_saudavel, tempo=tempo_medio, preco=preco_medio, categorias=pizza, classificacao=classificacao_media]).
example(no, [sexo=feminino, idade='41-100', dieta=nao_saudavel, tempo=tempo_alto, preco=preco_baixo, categorias=salada, classificacao=classificacao_baixo]).
example(no, [sexo=feminino, idade='0-17', dieta=saudavel, tempo=tempo_pouco, preco=preco_baixo, categorias=carnes, classificacao=classificacao_boa]).
example(no, [sexo=feminino, idade='18-40', dieta=saudavel, tempo=tempo_medio, preco=preco_medio, categorias=portuguesa, classificacao=classificacao_media]).
example(no, [sexo=feminino, idade='41-100', dieta=saudavel, tempo=tempo_pouco, preco=preco_medio, categorias=churrasco, classificacao=classificacao_media]).
example(yes, [sexo=feminino, idade='0-17', dieta=nao_saudavel, tempo=tempo_medio, preco=preco_baixo, categorias=hamburguer, classificacao=classificacao_boa]).
example(yes, [sexo=feminino, idade='18-40', dieta=nao_saudavel, tempo=tempo_baixo, preco=preco_baixo, categorias=fast_food, classificacao=classificacao_media]).
example(no, [sexo=feminino, idade='41-100', dieta=nao_saudavel, tempo=tempo_medio, preco=preco_alto, categorias=vegetariana, classificacao=classificacao_baixo]).
example(yes, [sexo=feminino, idade='0-17', dieta=saudavel, tempo=tempo_medio, preco=preco_baixo, categorias=italiana, classificacao=classificacao_boa]).
example(yes, [sexo=feminino, idade='18-40', dieta=saudavel, tempo=tempo_alto, preco=preco_alto, categorias=massa, classificacao=classificacao_media]).
example(yes, [sexo=feminino, idade='41-100', dieta=saudavel, tempo=tempo_alto, preco=preco_medio, categorias=marisco, classificacao=classificacao_baixo]).
example(no, [sexo=feminino, idade='0-17', dieta=nao_saudavel, tempo=tempo_pouco, preco=preco_medio, categorias=japonesa, classificacao=classificacao_boa]).
example(no, [sexo=feminino, idade='18-40', dieta=nao_saudavel, tempo=tempo_medio, preco=preco_alto, categorias=peixe, classificacao=classificacao_media]).
example(no, [sexo=feminino, idade='41-100', dieta=nao_saudavel, tempo=tempo_alto, preco=preco_alto, categorias=sushi, classificacao=classificacao_baixo]).

