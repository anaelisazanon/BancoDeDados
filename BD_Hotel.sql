/*2 - SISTEMA DE CONTROLE DE HOTEL
Um hotel mantém o cadastro de seus clientes com RG, nome, sexo, endereço, e-mail e telefones de contato. 
Os clientes podem reservar quartos do hotel para uma determinada data e por certa quantidade de dias. 
Os quartos são cadastrados com número, andar, tipo, descrição e preço. 
Para os quartos já ocupados pelos clientes, 
é mantida a data e hora de entrada e de saída do quarto, isto é, existe um registro diferenciado de quartos reservados e quartos ocupados. 
Para um cliente ficar cadastrado é suficiente que tenha feito uma reserva alguma vez embora não tenha ocupado efetivamente o quarto. 
Os clientes que ocupam um quarto do hotel podem
solicitar determinados serviços que são registrados associados ao quarto ocupado para posterior cobrança. 
Cada serviço deve ser cadastrado com um código, tipo (bebida, comida, entre outros), descrição do serviço e valor a ser pago.
*/
CREATE DATABASE Hotel;
USE Hotel;
CREATE TABLE cliente(
	cd_cliente int not null,
    rg varchar(15) not null,
    nome varchar(45) not null,
    sexo varchar(45),
    endereco varchar(100),
    email varchar(40) not null,
	telefone varchar(40) not null,
PRIMARY KEY (cd_cliente)
);
CREATE TABLE reserva(
	cd_reserva int not null,
    data_reserva date,
    dias int,
    cd_cliente int not null,
    cd_quarto int not null,
PRIMARY KEY (cd_matricula),
FOREIGN KEY (cd_cliente)
	REFERENCES cliente (cd_cliente),
FOREIGN KEY (cd_quarto)
	REFERENCES quarto (cd_quarto)
);
CREATE TABLE quarto(
	cd_quarto int not null,
    numero int,
    andar int,
    tipo varchar(15) not null,
    descricao varchar(40) not null,
    preco float,
PRIMARY KEY (cd_quarto)
);
CREATE TABLE ocupados (
	cd_ocupados int not null,
    data_quarto date,
    hora_entrada time,
    hora_saida time,
    cd_quarto int not null,
    cd_cliente int not null,
PRIMARY KEY (cd_ocupados),
FOREIGN KEY (cd_quarto)
	REFERENCES quarto (cd_quarto),
FOREIGN KEY (cd_cliente)
	REFERENCES cliente (cd_cliente)
);

CREATE TABLE servicos (
	cd_servicos int not null,
    tipo varchar(40) not null,
    descricao varchar(40) not null,
    valor float,
    cd_quarto int not null,
    cd_cliente int not null,
PRIMARY KEY (cd_servicos),
FOREIGN KEY (cd_quarto)
	REFERENCES quarto (cd_quarto),
FOREIGN KEY (cd_cliente)
	REFERENCES cliente (cd_cliente)
);


