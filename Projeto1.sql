-- COMANDOS DE SELECAO
-- Explorando a DB
select * from hashtagmovie.alugueis ; -- 578 alugueis
select * from hashtagmovie.atores ; -- 145 atores
select * from hashtagmovie.atuacoes; -- 213 atuacoes
select * from hashtagmovie.clientes; -- 123 clientes
select * from hashtagmovie.filmes; -- 71 filmes

-- Limitando a visualização com LIMIT
select * from hashtagmovie.filmes
limit 10;

select * from hashtagmovie.clientes
limit 50;

-- Verificando se há todos os generos esperados na tabela
select distinct genero from hashtagmovie.filmes; -- 7 generos de filmes

select distinct estado from hashtagmovie.clientes; -- Empresa atua em 11 estados, há espaço para expansão para mais 16 estados

-- Ordenacao dos clientes por data de nascimento
SELECT * FROM hashtagmovie.atores
ORDER BY ano_nascimento DESC;

-- Ordenacao dos clientes por ordem alfabética.
SELECT * FROM hashtagmovie.clientes
ORDER BY nome_cliente;

-- Encontrando o cliente mais antigo da base de dados
SELECT * FROM hashtagmovie.clientes
ORDER BY data_criacao_conta
limit 1;

-- Encontrando os 5 filmes mais longos
SELECT * FROM hashtagmovie.filmes
order by duracao desc
limit 5;

# Descobrir quantos filmes de comédia há na base da empresa
select * from hashtagmovie.filmes
where genero = "comédia"; # 10 filmes de comédia

-- Descobrir quantos filmes ha no banco de dados lancados no ano de 2008
select * from hashtagmovie.filmes
where ano_lancamento = 2003; -- 8 filmes

-- Encontrar flimes de Drama com duração maior que duas horas
select * from hashtagmovie.filmes
where genero = 'Drama' and duracao > 120; -- 15 filmes

-- Listar atores de nacionalidades especificas
select * from hashtagmovie.atores
where nacionalidade in ('Canadá','Austrália','Irlanda do Norte'); -- 14 atores

-- Listar filmes com duração entre 90 e 100 minutos
select * from hashtagmovie.filmes
where duracao between 90 and 100; -- 16 filmes

# Operacoes matematicas com os dados

select count(id_aluguel)
from hashtagmovie.alugueis; -- 578 alugueis

select count(nota)
from hashtagmovie.alugueis; -- 328 notas

# 2. O setor de catálogo precisa saber quantos gêneros de filmes existem na empresa atualmente.
select count( distinct genero)
from hashtagmovie.filmes; -- 7 generos

-- Quantos minutos no total a empresa possui de filmes catalogados?
select sum(duracao)
from hashtagmovie.filmes; -- 8592 minutos

-- 4. Qual é a duração em minutos do filme mais longo disponível no catálogo? E qual a duração do filme mais curto?
select 
	max(duracao),
	min(duracao)
from hashtagmovie.filmes; -- Mais longo 200 min, mais curto 91 minutos

-- 5. Qual é a média de satisfação dos clientes da empresa em relação aos filmes alugados?
select 
	avg(nota)
	from hashtagmovie.alugueis; -- Media de 7,94 de satisfacao
