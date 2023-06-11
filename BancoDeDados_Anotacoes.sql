/*Criando um banco novo
 **funciona tudo maiúsculo ou minúsculo
 
CREATE DATABASE Teste;

*/
/*a cada cod tem q comentar */


/*Visualizar a base de dados

SHOW DATABASES;

*/


/*Conectando um banco*/
/*ponto e virgula é opcional

USE Teste 

*/
/*clica relampago e dar refresh (setinha)*/


/*Criando tabela aluno*/
/*criar padrões - cd codigo;; dt data 
CREATE TABLE aluno(
	cd_aluno int not null,
    nome varchar(45),
    dt_nasc date,
    email varchar(45),
    telefone varchar(15),
    endereco varchar(100),
PRIMARY KEY (cd_aluno)
);
*/
/*clica relampago e dar refresh (setinha) e ver 
tabela dentro de teste*/


/*Criando tabela disciplina
CREATE TABLE disciplina(
	cd_disc int not null,
    nome varchar(45),
    modulo int,
    carga_horaria int,
PRIMARY KEY (cd_disc)
);
*/
/*clica relampago e dar refresh (setinha) e ver 
tabela dentro de teste*/


/*Criando tabela prof
CREATE TABLE professor(
	cd_prof int not null,
    nome varchar(45),
	telefone varchar(15),
    endereco varchar(100),
PRIMARY KEY (cd_prof)
);
*/
/*clica relampago e dar refresh (setinha) e ver 
tabela dentro de teste*/


/*criando tabela Boletim com chave estrangeira*/
/*
CREATE TABLE boletim(
    cd_aluno int not null,
    cd_disc int not null,
    nota1 float,
    nota2 float,
    ano_sem int,
PRIMARY KEY (cd_aluno, cd_disc),
FOREIGN KEY (cd_aluno)
	REFERENCES aluno (cd_aluno),
FOREIGN KEY (cd_disc)
	REFERENCES disciplina (cd_disc)
);
*/


/*ALTERAR TABELA - adc campo novo*/
/* !!! não tem parenteses ( ) */
/*
ALTER TABLE professor
	ADD salario float,
    ADD dt_cadastro date;
*/


/*adc depois da data de nasc status*/
/*
ALTER TABLE aluno
	ADD status varchar(15) not null after dt_nasc;
*/


/*modificar nome existente*/
/*
ALTER TABLE aluno
	MODIFY email varchar(80);
    */


/*excluir dt cadastro*/
/*
ALTER table aluno
	DROP status;
*/


/*rename - renomeia */


/*remover tabela toda*//*
DROP TABLE professor;
*/



/*criar índice para organizar aluno em prioridade ordenado em forma crescente*/
/*CREATE UNIQUE INDEX ix_nome  ON aluno (nome);*/

/*excluir index*/
/*
DROP INDEX ix_nome on aluno;
*/


/*VISÕES - diminuir tabelas ex: tabela aluno somente nome e email*/
/*CREATE VIEW v_alunos_discipl
AS SELECT *FROM aluno WHERE nome = 'Ana';
*/

/* ADC DADOS NA TABELA - TEM QUE SELECIONAR COM O SELECT PARA APARECER NA TABELA
select * from aluno;
insert into aluno (cd_aluno, nome, dt_nasc, email, telefone, endereco)
values (1, "Ana Elisa", "1999-09-05", "ana@gmail.com", 4899278473, "Av. Mauro")

DEPOIS RODAR    select * from aluno;    PARA VER A TABELA

insert into aluno (cd_aluno, nome, dt_nasc, email, telefone, endereco)
values (2, "Ana El", "1999-09-07", "ana@gmail.com", 4899278473, "Av. Mauro")

insert into aluno (cd_aluno, nome, dt_nasc, email, telefone, endereco)
values (4, "Ana44 Elisa", "1999-09-05", "ana@gmail.com", 4899278473, "Av. Mauro")

/*adc só alguns campos
insert into aluno (cd_aluno, dt_nasc)
values (8, "1999-09-05")
*/

/*altera todos os alunos para endereco rua 15
UPDATE aluno
SET endereco = "RuaXV",
*/

/*altera ´so um aluno para endereco rua 15
UPDATE aluno
SET endereco = "RuaXV"
WHERE cd_aluno = 2;
SELECT * from aluno
*/

/* update com AND
UPDATE aluno
SET endereco = "RuaXV 666877"
WHERE (cd_aluno = 2
	and nome = "Ana El");
*/
