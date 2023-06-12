CREATE DATABASE imobiliaria;
USE imobiliaria;
CREATE TABLE vendedor(
	cdvendedor int not null,
    nmvendedor varchar(40),
    nmendereco varchar(40),
    nrcpf float(11),
    nmcidade varchar(20),
    nmbairro varchar(20),
    sgestado char(2),
    telefone varchar(20),
    email varchar(80),
PRIMARY KEY (cdvendedor)
);
CREATE TABLE faixa_imovel(
	cdfaixa int not null,
    nmfaixa varchar(30),
    vlminimo float(14,2),
    vlmaximo float(14,2),
PRIMARY KEY (cdfaixa)
);
CREATE TABLE comprador(
	cdcomprador int not null,
	nmcomprador varchar(40),
    nmendereco varchar(40),
    nrcpf float(11),
    nmcidade varchar(20),
    nmbairro varchar(20),
    sgestado char(2),
    telefone varchar(20),
    email varchar(80),
PRIMARY KEY (cdcomprador)
);
CREATE TABLE estado(
	sgestado char(2),
    nmestado varchar(20),
PRIMARY KEY (sgestado)
);
CREATE TABLE cidade(
	cdcidade int,
    nmcidade varchar(20),
    sgestado char(2),
PRIMARY KEY (cdcidade),
FOREIGN KEY (sgestado)
	REFERENCES estado (sgestado)
);
CREATE TABLE bairro(
	cdbairro int,
    nmbairro varchar(20),
    cdcidade int,
    sgestado char(2),
PRIMARY KEY (cdbairro),
FOREIGN KEY (cdcidade)
	REFERENCES cidade (cdcidade),
FOREIGN KEY (sgestado)
	REFERENCES estado (sgestado)
);
CREATE TABLE imovel(
	cdimovel int not null,
    cdvendedor int,
    cdbairro int,
    cdcidade int,
    sgestado char(2),
    nmendereco varchar(40),
    nrareautil float(10,2),
    nrareatotal float(10,2),
    dsimovel varchar(300),
    vlpreco float (16,2),
    nrofertas int,
    stvendido char(1),
    dtlancto date,
    imovel_indicado int,
PRIMARY KEY (cdimovel),
FOREIGN KEY (cdvendedor)
	REFERENCES vendedor (cdvendedor),
FOREIGN KEY (cdbairro)
	REFERENCES bairro (cdbairro),
FOREIGN KEY (cdcidade)
	REFERENCES cidade (cdcidade),
FOREIGN KEY (sgestado)
	REFERENCES bairro (sgestado)
);
CREATE TABLE oferta(
	cdcomprador int,
    cdimovel int,
    vloferta float(16,2),
    dtoferta date,
PRIMARY KEY (cdimovel),
FOREIGN KEY (cdimovel)
	REFERENCES imovel (cdimovel),   
FOREIGN KEY (cdcomprador)
	REFERENCES comprador (cdcomprador)
);

/* Escreva a sintaxe para as seguintes solicitações: Obs: Para consultar os dados execute o comando:
select * from tabela.
a) Inclua 3 linhas na tabela ESTADO (SC,RJ,SP).*/
SELECT * FROM estado;
insert into estado (sgestado, nmestado)
	values("SC", "Santa Catarina");
INSERT INTO estado (sgestado, nmestado)
	values("RJ", "Rio de Janeiro");
INSERT INTO estado (sgestado, nmestado)
	values("SP", "São Paulo");

/*b) Inclua 3 linhas na tabela CIDADE (1-Jlle,2-Rio de Janeiro,3-São Paulo).*/
SELECT * FROM cidade;
insert into cidade (cdcidade, nmcidade, sgestado)
	values("1", "Jlle", "SC");
SELECT * FROM cidade;
insert into cidade (cdcidade, nmcidade, sgestado)
	values("2", "Rio de Janeiro", "RJ");
SELECT * FROM cidade;
insert into cidade (cdcidade, nmcidade, sgestado)
	values("3", "São Paulo", "SP");

/*c) Inclua 3 linhas na tabela BAIRRO (1-Centro, 2-Glória, 3-Bom Retiro).*/
SELECT * FROM bairro;
INSERT INTO bairro (cdbairro, nmbairro, cdcidade, sgestado)
	VALUES ("1", "Centro", "3", "SP");
SELECT * FROM bairro;
INSERT INTO bairro (cdbairro, nmbairro, cdcidade, sgestado)
	VALUES ("2", "Glória", "3", "SP");
SELECT * FROM bairro;
INSERT INTO bairro (cdbairro, nmbairro, cdcidade, sgestado)
	VALUES ("3", "Bom Retiro", "3", "SP");

/*d) Inclua 3 linhas na tabela VENDEDOR (1,2,3).*/
SELECT * FROM vendedor;
INSERT INTO vendedor (cdvendedor)
	VALUES ("1"),("2"),("3");

/*e) Inclua 3 linhas na tabela IMOVEL (1,2,3).*/
SELECT * FROM imovel;
INSERT INTO imovel (cdimovel)
	VALUES("1"), ("2"), ("3");

/*f) Inclua 3 linhas na tabela COMPRADOR2 (1,2,3).*/
SELECT * FROM comprador;
INSERT INTO comprador (cdcomprador)
	VALUES("1"), ("2"), ("3");

/* g) Inclua 3 linhas na tabela de OFERTA (1,2,3).*/
SELECT * FROM oferta;
INSERT INTO oferta (cdimovel, cdcomprador)
	VALUES("1","1"), ("2","2"), ("3","3");

/*h) Aumente o preço de venda dos imóveis em 10%.*/
UPDATE imovel
SET vlpreco = 100000
WHERE cdimovel = 2;
SELECT * from imovel;

UPDATE imovel
SET vlpreco = vlpreco - (vlpreco * 0.10)
WHERE cdimovel = 2;
SELECT * from imovel;

/*i) Abaixe o preço de venda dos imóveis do vendedor ‘1’ em 5%.*/
UPDATE imovel
SET cdvendedor = 900000
WHERE cdvendedor = 1;
SELECT * from imovel;

UPDATE imovel
SET vlpreco = vlpreco - (vlpreco * 0.05)
WHERE cdvendedor = 1;
SELECT * from imovel;

/*j) Aumente em 5% o valor das ofertas do comprador ‘2’.*/
UPDATE oferta
SET vloferta = 900000
WHERE cdcomprador = 2;
SELECT * from oferta;

UPDATE oferta
SET vloferta = vloferta + (vloferta * 0.05)
WHERE cdcomprador = 2;
SELECT * from oferta;

/*k) Altere o endereço do comprador ‘3’ para ‘R Ananás, 45’ e o estado para ‘RJ’.*/
UPDATE comprador
SET nmendereco = "R Ananás, 45"
WHERE cdcomprador = 3;
SELECT * from comprador;
UPDATE comprador
SET sgestado = "RJ"
WHERE cdcomprador = 3;
SELECT * from comprador;

/*l) Altere a oferta do comprador ‘2’ no imóvel ‘2’ para 101.000.*/
UPDATE oferta
SET vloferta = "101.000"
WHERE cdcomprador = 2
AND cdimovel =2;
SELECT * from comprador;
    
/*m) Exclua a oferta do comprador ‘1’ no imóvel ‘1’.*/
DELETE FROM oferta
WHERE cdcomprador = 1
AND cdimovel = 1;

/*n) Exclua a cidade 3 do Estado SP.*/
UPDATE cidade
SET sgestado = "SC"
WHERE cdcidade = 3;
SELECT * from cidade;
