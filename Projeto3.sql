-- Criação de Base de Dados simples para uma escola de idiomas
-- Criando a Base de Dados
-- create database escolaidiomas;
use escolaidiomas;

-- Criando 3 tabelas e inserindo informações
create table cursos(
	id_curso int,
	nome_curso varchar(50),
	valor_curso decimal(10,2)
    );
    insert into cursos
	values (1,'Inglês',1200),
			(2,'Espanhol', 1000),
            (3,'Francês',900);

create table alunos(
	id_aluno int,
	nome_aluno varchar(50),
	email varchar(50)
    );
insert into alunos
	values (1,'Eliane','eliane@gmail.com'),
			(2,'João','j.123@hotmail.com'),
            (3,'Pedro','pedrinho@gmail.com');

create table vendas(
id_venda int,
data_venda date,
id_curso int,
id_aluno int
);
insert into vendas
values
	(1, '2022-01-10', 1, 1),
    (2, '2022-01-10', 2, 1),
    (3, '2022-01-10', 3, 1),
    (4, '2022-01-13', 1, 2),
    (5, '2022-01-21', 2, 3);

-- O valor do curso de Francês foi reajustado de R$900 para R$750.
update cursos
set valor_curso = 750
where id_curso = 3;

-- A compra do cliente 'Pedro' foi reembolsada e por isso ela deve ser excluída do controle de vendas.
delete from vendas
where id_venda = 5;
select * from vendas;

-- Excluindo a tabela vendas e em seguida o banco de dados escolaidiomas.
drop table vendas;
drop database escolaidiomas;
