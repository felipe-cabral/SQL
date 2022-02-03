SELECT * FROM alugueis;
SELECT * FROM atores;
SELECT * FROM atuacoes;
SELECT * FROM clientes;
SELECT * FROM filmes;

# =======  AGRUPAMENTOS  =======#

-- CASE 1. Você deverá começar fazendo uma análise para descobrir o preço médio de aluguel dos filmes.
select avg (preco_aluguel) from filmes; -- 2,21

/* Agora que você sabe o preço médio para se alugar filmes, você deverá ir além na sua análise e 
-- descobrir qual é o preço médio para cada gênero de filme.	
-- Você seria capaz de mostrar os gêneros de forma ordenada, de acordo com a média?*/
select genero, 
	avg(preco_aluguel) as preco_medio,
	count(*) as qtd_filmes
from filmes
group by genero;


-- CASE 2. Para cada filme, descubra a classificação média, o número de avaliações e a quantidade de vezes que cada filme foi alugado.
-- Ordene essa consulta a partir da avaliacao_media, em ordem decrescente.

select
	id_filme,
    avg(nota) as avaliacao_media,
    count(nota) as num_avaliacoes,
    count(*) as num_alugueis
from alugueis
group by id_filme
order by avaliacao_media desc;

-- CASE 3. Você deve alterar a consulta DO CASE 1 e considerar os 2 cenários abaixo:
-- Cenário 1: Fazer a mesma análise, mas considerando apenas os filmes com ANO_LANCAMENTO igual a 2011.
select genero, 
	avg(preco_aluguel) as preco_medio,
	count(*) as qtd_filmes
from filmes
where ano_lancamento = 2003
group by genero;

-- Cenário 2: Fazer a mesma análise, mas considerando apenas os filmes dos gêneros com mais de 10 filmes.
select genero, 
	avg(preco_aluguel) as preco_medio,
	count(*) as qtd_filmes
from filmes
group by genero
having qtd_filmes >= 10;

-- CASE 4. Selecione a tabela de Atuações. Observe que nela, existem apenas os ids dos filmes e ids dos atores.
-- Você seria capaz de completar essa tabela com as informações de títulos dos filmes e nomes dos atores?
select * from atuacoes;
select * from filmes;
select * from atores;
select * from alugueis;
select * from clientes;

select 
	atuacoes.*,
	filmes.titulo,
    atores.nome_ator
from atuacoes
left join filmes
on atuacoes.id_filme = filmes.id_filme
left join atores
on atuacoes.id_ator = atores.id_ator;

 -- CASE 5. Média de avaliações dos clientes
select
	clientes.nome_cliente,
    avg(alugueis.nota) as avaliacao_media
from alugueis
left join clientes
on alugueis.id_cliente = clientes.id_cliente
group by clientes.nome_cliente;

-- CASE 6. Você precisará fazer uma análise de desempenho dos filmes. Para isso, uma análise comum é identificar quais filmes
-- têm uma nota acima da média. Você seria capaz de fazer isso?
select
	filmes.titulo,
	avg(alugueis.nota) as avaliacao_media
from alugueis
left join filmes
on filmes.id_filme = alugueis.id_filme
group by filmes.titulo
having avaliacao_media >= (select avg(nota) from alugueis);


create view resultados as
SELECT
	titulo,
    COUNT(*) AS num_alugueis,
    AVG(nota) AS media_nota,
    SUM(preco_aluguel) AS receita_total
FROM alugueis
LEFT JOIN filmes
ON alugueis.id_filme = filmes.id_filme
GROUP BY titulo
ORDER BY num_alugueis DESC;