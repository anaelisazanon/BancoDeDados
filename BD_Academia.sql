/*1 - CONTROLE DE ACADEMIA DE GINÁSTIA
Uma academia de ginástica deseja manter um controle do seu funcionamento e para isso deseja adquirir um sistema informatizado. 
A academia possui alunos que são organizados em turmas que são associadas a um tipo específico de atividade. 
As informações sobre uma turma são número (quantidade) de alunos, horário da aula, duração da aula, data inicial, data final e tipo de atividade. 
Cada turma é orientada por um único instrutor para o qual são cadastrados o nome, RG, data de nascimento, titulação, endereço e todos os telefones possíveis para sua localização. 
Um instrutor pode orientar várias turmas que podem ter atividades diferentes entre si. 
Os dados cadastrados dos alunos são código de matrícula, data de matrícula, nome, endereço, telefone, data de nascimento, altura e peso (massa corpórea). 
Caso um aluno desejar realizar atividades diferentes, pode-se matricular em diversas turmas. 
Para cada matrícula, é mantido um registro das ausências do aluno. 
Para cada turma, há um aluno monitor que auxilia o instrutor da turma, sendo que um aluno pode ser monitor no máximo em uma turma
*/
CREATE DATABASE Academia;
USE Academia;
CREATE TABLE instrutor(
	cd_instrutor int not null,
    nome varchar(45) not null,
    rg varchar(15) not null,
    dt_nascimento varchar(45),
    titulacao varchar(45),
    endereco varchar(100),
    telefone varchar(40) not null,
PRIMARY KEY (cd_instrutor)
);
CREATE TABLE aluno(
	cd_matricula int not null,
    dt_matricula date,
    dt_nascimento varchar(45),
    nome varchar(45) not null,
    endereco varchar(100),
    telefone varchar(40) not null,
    altura float,
    peso float,
PRIMARY KEY (cd_matricula)
);
ALTER TABLE aluno
	add email varchar(100) not null
    after telefone;
CREATE TABLE atividade(
	cd_atividade int not null,
    descricao varchar (100) not null,
PRIMARY KEY (cd_atividade)
);
CREATE TABLE turma(
	cd_turma int not null,
    qtd_alunos int,
    hora time not null,
    duracao float not null,
    dt_ini date not null,
    dt_fim date not null,
    cd_atividade int not null,
    cd_instrutor int not null,
    cd_matricula int not null,
PRIMARY KEY (cd_turma),
FOREIGN KEY (cd_atividade)
	REFERENCES atividade (cd_atividade),
FOREIGN KEY (cd_instrutor)
	REFERENCES instrutor (cd_instrutor),
FOREIGN KEY (cd_matricula)
	REFERENCES aluno (cd_matricula)
);
CREATE TABLE turma_aluno (
  cd_turma_aluno INT NOT NULL,
  cd_matricula INT NOT NULL,
  faltas INT NULL,
  PRIMARY KEY (cd_turma_aluno),
  FOREIGN KEY (cd_matricula)
	REFERENCES aluno (cd_matricula)
);




