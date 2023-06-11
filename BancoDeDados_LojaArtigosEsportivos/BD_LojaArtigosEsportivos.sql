CREATE DATABASE loja;

USE loja;

-- DDL

CREATE TABLE categoria_func (
	cd_categoria INT NOT NULL UNIQUE AUTO_INCREMENT,
	nome VARCHAR(50) NOT NULL, 
	descricao VARCHAR(100) NOT NULL,
	PRIMARY KEY (cd_categoria)
);


CREATE TABLE funcionario (
    cpf_func CHAR(11) NOT NULL UNIQUE, 
    nome VARCHAR(50) NOT NULL, 
    data_nasc DATE NOT NULL, 
    endereco VARCHAR(100) NOT NULL, 
    email VARCHAR(100) NOT NULL,
    telefone CHAR(11) NOT NULL,
    salario FLOAT NOT NULL,
    categoria INT NOT NULL,
    periodo VARCHAR(40),
    data_contrat DATE NOT NULL, 
    status_func VARCHAR(40),
    observacoes VARCHAR(150),
    PRIMARY KEY (cpf_func),
    FOREIGN KEY (categoria) REFERENCES categoria_func (cd_categoria)
);

CREATE TABLE funcionario_caixa (
	cpf_func CHAR(11) NOT NULL UNIQUE, 
	PRIMARY KEY (cpf_func),
	FOREIGN KEY (cpf_func) REFERENCES funcionario (cpf_func)
);

CREATE TABLE funcionario_atendente (
	cpf_func CHAR(11) NOT NULL UNIQUE, 
	PRIMARY KEY (cpf_func),
	FOREIGN KEY (cpf_func) REFERENCES funcionario (cpf_func)
);


CREATE TABLE categoria_prod (
	cd_categoria INT NOT NULL UNIQUE AUTO_INCREMENT,
	nome VARCHAR(50) NOT NULL,
	descricao VARCHAR(150) NOT NULL,
	PRIMARY KEY (cd_categoria)
);


CREATE TABLE produto (
    cd_produto INT NOT NULL UNIQUE AUTO_INCREMENT,
    cd_categoria INT NOT NULL, 
    nome_produto VARCHAR(100) NOT NULL,
    descricao VARCHAR(300) NOT NULL,
    preco FLOAT NOT NULL,
    qtd_estoque INT NOT NULL, 
    link_imagem VARCHAR(300),
    PRIMARY KEY (cd_produto),
    FOREIGN KEY (cd_categoria) REFERENCES categoria_prod (cd_categoria)
);


CREATE TABLE cliente (
    cpf_cliente CHAR(11) NOT NULL UNIQUE,
    nome VARCHAR(50) NOT NULL, 
    data_nasc DATE NOT NULL, 
    endereco VARCHAR(100) NOT NULL, 
    email VARCHAR(100) NOT NULL,
    telefone CHAR(11) NOT NULL, 
    observacoes VARCHAR(150),
    PRIMARY KEY (cpf_cliente)
);


CREATE TABLE config_cupom (
  cd_config INT NOT NULL UNIQUE AUTO_INCREMENT,
  tempo_desconto INT NOT NULL,
  valor_desconto FLOAT NOT NULL,
  PRIMARY KEY(cd_config)
);


CREATE TABLE venda (
  cd_venda INT NOT NULL UNIQUE AUTO_INCREMENT, 
  data_venda DATE NOT NULL,
  valor FLOAT NOT NULL,
  cupom INT,
  forma_pagamento VARCHAR(50) NOT NULL,
  cd_cliente CHAR(11) NOT NULL, 
  cd_caixa CHAR(11) NOT NULL,
  cd_atendente CHAR(11) NOT NULL,
  PRIMARY KEY (cd_venda),
  FOREIGN KEY (cd_cliente) REFERENCES cliente (cpf_cliente),
  FOREIGN KEY (cd_caixa) REFERENCES funcionario_caixa (cpf_func),
  FOREIGN KEY (cd_atendente) REFERENCES funcionario_atendente (cpf_func)
);



CREATE TABLE venda_produto (
  cd_venda INT NOT NULL,
  cd_prod INT NOT NULL, 
  qdt_prod INT NOT NULL,
  CONSTRAINT pk_venda_produto PRIMARY KEY (cd_venda, cd_prod),
  FOREIGN KEY (cd_venda) REFERENCES venda (cd_venda),
  FOREIGN KEY (cd_prod) REFERENCES produto (cd_produto)
); -- DML 

INSERT INTO categoria_func VALUES
    (1, "Atendente", "Responsável pela recepção e atendimento direto ao cliente"), 
    (2, "Caixa", "Responsável pelos pagamentos"),
    (3, "Gerente", "Gerente de loja"),
    (4, "Serviços Gerais", "Serviços Gerais de Limpeza e Almoxarifado"),
    (5, "Outro", "Outras funções");


INSERT INTO funcionario VALUES 
("00972750929", "Juliana Hachmann", "1986-08-28", "Serv Ant Thiago, 510", "juliana@gmail.com", "48998345454", 1300.50, 1, "Matutino", "2022-12-09", "Ativo", " "),
("05794792874", "Ana Elisa Zanon", "1997-07-04", "Mauro Ramos, 56", "anaz@gmail.com", "48968344454", 1300.50, 1, "Vespertino", "2022-12-09", "Ativo", " "),
("08796512357", "Marcos Elio", "1996-12-12", "Mauro Ramos, 193", "marcos@gmail.com", "48996652332", 2500.87, 2, "Matutino", "2022-12-10", "Ativo", " ");


INSERT INTO funcionario_caixa VALUES 
("08796512357");


INSERT INTO funcionario_atendente VALUES 
("00972750929"), 
("05794792874");


INSERT INTO categoria_prod (nome, descricao) VALUES 
("Basquete", "Artigos para todas as modalidades de Basquete"),
("Tênis", "Artigos para Tênis de Quadra"),
("Corrida", "Artigos para todas as modalidades de Corrida"); 


INSERT INTO produto VALUES 
(1, 1, "Bola de Basquete Spalding Streetball", "Possuindo a qualidade Spalding em cada detalhe, a bola de basquete tem matéria prima de borracha, circunferência de 76 cm e pressão de 8 psi", 99.99, 50, "https://imgcentauro-a.akamaihd.net/900x900/966449CD/bola-de-basquete-spalding-streetball-img.jpg"),
(2, 3, "Pochete Asics Perso com Porta Celular", "A alça é regulável e o design da pochete permite usá-la de forma confortável na hora da corrida ou caminhada", 49.99, 20, "https://imgcentauro-a.akamaihd.net/900x900/97175502A4/pochete-asics-perso-com-porta-celular-img.jpg"),
(3, 2, "Raquete de Tênis Wilson Advantage XL L2 - Adulto", "Perfeita para você que ama jogar com os amigos em quadra e se destacar nas partidas é a Raquete de Tênis Wilson Advantage XL L2 - Adulto ", 319.99, 20, "https://imgcentauro-a.akamaihd.net/900x900/97897006/raquete-de-tenis-wilson-advantage-xl-l2-adulto-img.jpg");


INSERT INTO cliente VALUES 
("51921141441", "Thaís Santos Martins", "1953-10-24", "Serv Nunes, 520", "thaismartins@gmail.com", "48992848088", " "), 
("50520976541", "André Cardoso Ribeiro", "1991-01-12", "Av Pequeno Príncipe, 1234", "andreribeiro@hotmail.com", "48984213971", " "),
("85525514540", "Luana Cunha", "1982-07-30", "Av Hercílio Luz, 45", "luanacunha@yahoo.com.br", "48988535899", " ");


INSERT INTO config_cupom VALUES 
(1, 3, 0.05);


INSERT INTO venda VALUES 
(1, "2022-12-10", 99.99, 0, "Dinheiro", "51921141441", "08796512357", "00972750929"),
(2, "2022-12-11", 319.99, 0, "Débito", "85525514540", "08796512357", "05794792874"),
(3, "2022-12-12", 519.96, 0, "Crédito", "50520976541", "08796512357", "05794792874");


INSERT INTO venda_produto VALUES
(1, 1, 1),
(2, 3, 1),
(3, 1, 1),
(3, 2, 2),
(3, 3, 1);

-- Visualizações

CREATE VIEW View_Compras AS SELECT cliente.nome AS Cliente,  venda.data_venda AS Data_da_Compra, venda.valor AS Valor, venda.forma_pagamento AS Forma_de_Pagamento FROM cliente INNER JOIN venda ON cliente.cpf_cliente = venda.cd_cliente;

SELECT * FROM View_Compras;

CREATE VIEW Produtos_Por_Venda AS SELECT cliente.nome AS Cliente, venda.cd_venda AS CD_Venda, venda.data_venda AS Data, produto.nome_produto AS Produto, produto.preco AS Preco_Unitario, venda_produto.qdt_prod AS Quantidade FROM cliente INNER JOIN venda ON cliente.cpf_cliente = venda.cd_cliente INNER JOIN venda_produto ON venda.cd_venda = venda_produto.cd_venda INNER JOIN produto ON venda_produto.cd_prod = produto.cd_produto;

SELECT * FROM Produtos_Por_Venda WHERE CD_Venda = 3;

CREATE VIEW Vendas_Func AS SELECT funcionario.cpf_func AS CPF, funcionario.nome AS Funcionario, venda.valor AS Valor_Venda, venda.data_venda AS Data, venda.cd_venda AS CD_Venda, cliente.nome AS Cliente FROM funcionario INNER JOIN venda ON funcionario.cpf_func = venda.cd_atendente INNER JOIN cliente ON venda.cd_cliente = cliente.cpf_cliente;

SELECT * FROM Vendas_Func WHERE cpf = "05794792874" AND data >= "2022-12-01" AND data < "2023-01-01"; 
