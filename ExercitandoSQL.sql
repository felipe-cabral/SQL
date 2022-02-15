-- create schema banco;

select * from categorias;
select * from clientes;
select * from locais;
select * from lojas;
select * from pedidos;
select * from produtos;

select 
	nome, sobrenome, email
    from clientes
	order by nome, sobrenome;
    
select *
	from clientes
    order by Renda_Anual desc;
    
select Nome, Sobrenome, Email, Data_Nascimento
from clientes
order by Data_Nascimento desc;

select * from clientes
	where Sexo = 'F';
select * from clientes
	where Sexo = 'm';
    
select * from produtos
	where Preco_Unit > 2000;
    
select * from pedidos
	where Data_Venda = '2019-03-10';
    
select sum(Receita_Venda) as 'Receita Total' from pedidos;

select count(Sexo) as 'Quantidade Clientes' from clientes
	where Sexo = 'm';
select count(Sexo) as 'Quantidade Clientes' from clientes
	where Sexo = 'f';	
    
select avg(Renda_Anual) as 'Média de Renda Anual' from clientes;

select min(Preco_Unit) as 'Preco Unitario Minimo' from produtos;
select max(Preco_Unit) as 'Preco Unitario Minimo' from produtos;

select ID_Produto, sum(Receita_Venda) as 'Total Vendido'
from pedidos
group by ID_Produto;

select Marca_Produto, count(Marca_Produto) as 'Qtd Produtos'
from produtos
group by Marca_produto;

select Escolaridade, count(Escolaridade) as 'Escolaridade'
from clientes
group by Escolaridade;

select Loja, sum(Receita_Venda) as 'Receita Total'
from pedidos
inner join lojas on pedidos.id_loja = lojas.id_loja
group by Loja;

select pedidos.ID_Loja, Loja, Data_Venda, Receita_Venda
from pedidos
inner join lojas on pedidos.ID_Loja = lojas.ID_Loja;

select
	Nome_Produto as 'Nome Produto',
	Marca_Produto as 'Marca',
    Preco_Unit as 'Preço Unitário'
from produtos;

select * from lojas limit 5;

select 
	Loja as 'Nome da Loja',
    Endereco as 'Endereço',
    Num_Funcionarios as 'Qtd. Funcionários',
    Telefone as 'Numero para contato'
from lojas
order by Num_Funcionarios;

select * from clientes
order by nome, Sobrenome;

select * from produtos where Preco_Unit >= 200;
select * from produtos where Marca_Produto = 'Dell';

select sum(Custo_Venda) as 'Custo Total' from pedidos;
select count(Loja) as 'Qtd Lojas' from lojas;
select avg(Custo_Venda) as 'Custo Médio' from pedidos;

select 
	min(Num_Funcionarios) as 'Minimo Funcionários',
    max(Num_Funcionarios) as 'Máximo Funcionarios'
from lojas;

select Sexo, count(Sexo) as 'Qtd gênero'
from clientes
group by Sexo;

select Categoria, count(*) as 'Qtd Produtos'
from produtos
inner join categorias on produtos.ID_Categoria = categorias.ID_Categoria
group by Categoria;

-- Faça um agrupamento para descobrir a soma total de receita por Loja.
select Loja, sum(Receita_Venda) as 'Venda Total'
from lojas
inner join pedidos on lojas.ID_Loja = pedidos.ID_Loja
group by Loja;