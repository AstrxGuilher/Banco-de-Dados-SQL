-- ----------------------------------------------------------
-- Para inserir novos registros na banco
-- INSERT INTO Tabela (Campos) VALUES (Valores);

INSERT INTO engenheiros (nome, crea, salario, cpf) 
	VALUES ('Silva marques','1233214',8000.00, '15858459874');

INSERT INTO engenheiros (nome, crea, salario, cpf) VALUES
	('Jose Tristao','1244214',8000.00, '15858448674'),
	('Renan Jose','1233984',8000.00, '15638459874'),
	('Gabriel marques','1159214',8000.00, '15858459333');

-- ----------------------------------------------------------
-- ISSO vai dar um problema!
insert into engenheiros values 
	(8000.00,'Maria Joaquina','1884214','66958448674');
insert into engenheiros values 
	('cirilo',8000.00 ,'9884214', '88958448674');


-- ----------------------------------------------------------
-- Vamos ajustar esse erro com um update
-- UPDATE Tabela SET Coluna = ValorNovo WHERE Condição;

Update engenheiros
	set crea = '9884214', salario = 8000.00
	WHERE cpf = '88958448674';

Update engenheiros
	set nome = 'Cirilo Joaquim'
	where  cpf = '88958448674';

Update engenheiros
	set crea = '1884214', salario=8000.00
	where nome like '%Maria Joaquina%';

-- ----------------------------------------------------------
-- Para apagar registrs da minha base
-- DELETE FROM Tabela WHERE Condição; 

delete from engenheiros where crea = '9884214'; 

-- ----------------------------------------------------------
-- Inserindo dados na table projeto
-- ----------------------------------------------------------

insert into projetos (id, duracao, descricao, projeto_filho) values
	(1, 100,'Construção ponte vila madalena',null);
	
insert into projetos (duracao, descricao, projeto_filho) values
	(50,'Construção casa da tia rosinha',null),
	(200,'Reforma da praça tia maria',1);

-- ----------------------------------------------------------
-- Inserindo dados na table atuacoes
-- ----------------------------------------------------------

insert into atuacoes (engenheiro_id, projeto_id, funcao, qtd_horas) values
	('1159214',1,'Gerenciar Materiais',10);

insert into atuacoes (funcao,engenheiro_id,projeto_id,qtd_horas) values
	('Gerenciar Materiais','1244214',2,20),
	('Gerenciar Materiais','1244214',3,30),
	('Gerenciar compras','1233214',3,15);

-- ----------------------------------------------------------
-- Apagando Registros
-- ----------------------------------------------------------
delete from engenheiros where crea = '1233984';
delete from atuacoes where engenheiro_id = '1884214';
delete from engenheiros where crea = '1159214';

/* Ao tentar apargar o registro com id 1159214, temos um erro 
   de violação de restrição de chave estrangeira.
   Para resolver teria que apagar quem usa a chave, e depois,
   apagar este registro. O mesmo ocorrerá para a linha abaixo,
   pois existem atuações que dependem do projeto com id 1. */

delete from projetos where id = 1;
 
/* Como Resolver?
   Se realmente for necessário fazer a exclusão desses registros,
   você deverá remover primeiro quem utiliza eles, no caso, 
   atuações, para depois remover o projeto de id 1 ou o 
   engenheiro com crea 1159214 */