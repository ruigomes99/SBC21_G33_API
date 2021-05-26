% faixa etaria
if 'idade_0_17' then 'idade_adolescente'.
if 'idade_18_29' then 'idade_jovemAdulto'.
if 'idade_30_100' then 'idade_adulto'.

if 'preco_0_7' then 'preco_baixo':1.
if 'preco_>7_12' then 'preco_medio':1.
if 'preco_>12' then 'preco_alto':1.

if 'classificacao_<=45' then 'classificacao_boa':0.38.
if 'classificacao_46_47' then 'classificacao_muito_boa':0.49.
if 'classificacao_>47' then 'classificacao_excelente':0.67.

if 'bebida_incluida' then 'com_bebida':1.
if 'bebida_nao_incluida' then 'sem_bebida':1.

if 'indiferente' then 'tempo_pouco':1.
if 'indiferente' then 'tempo_medio':1.
if 'indiferente' then 'tempo_alto':1.
if 'paciente' then 'tempo_alto':0.80.
if 'paciente' then 'tempo_medio':0.20.
if 'apressado' and ('idade_adulto' or 'idade_jovemAdulto') then 'tempo_pouco':0.80.
if 'apressado' and ('idade_adulto' or 'idade_jovemAdulto') then 'tempo_medio':0.20.
if 'apressado' and 'idade_adolescente' then 'tempo_pouco':0.20.
if 'alegre' and 'idade_adolescente' then 'tempo_alto':0.20.
if 'alegre' and 'idade_adolescente' then 'tempo_medio':0.50.
if 'alegre' and 'idade_adolescente' then 'tempo_baixo':0.30.
if 'alegre' and ('idade_jovemAdulto' or 'idade_adulto') then 'tempo_medio':0.70.
if 'alegre' and ('idade_jovemAdulto' or 'idade_adulto') then 'tempo_alto':0.30.