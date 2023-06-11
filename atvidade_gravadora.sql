CREATE DATABASE gravadora;
SHOW DATABASES;
USE gravadora;

/*a) Criar a tabela GRAVADORA, onde a chave primária é o campo 'codigo da gravadora'; */
CREATE TABLE gravadora(
	codigo_gravadora int NOT NULL,
    nome_gravadora varchar(60) NOT NULL,
    endereco varchar(60) NOT NULL,
    telefone varchar(20) NOT NULL,
    contato varchar(20) NOT NULL,
    url varchar(80) NOT NULL,
PRIMARY KEY (codigo_gravadora)
);

/*b) Criar a tabela FAIXA, onde as chaves primárias são os campos 'codigo_musica' e 'codigo_cd',
e estes mesmos campos deverão ser chaves estrangeiras para a tabela CD e MUSICA.*/
CREATE TABLE faixa(
	codigo_musica int not null,
    codigo_cd int not null,
    numero_faixa int,
PRIMARY KEY (codigo_musica, codigo_cd),
FOREIGN KEY (codigo_musica)
	REFERENCES musica (codigo_musica),
FOREIGN KEY (codigo_cd)
	REFERENCES cd (codigo_cd)
);
CREATE TABLE cd(
	codigo_cd int NOT NULL,
    codigo_gravadora int NOT NULL,
    nome_cd varchar(60),
    preco_venda float(16,2),
    data_lancamento date,
    cd_indicado int,
PRIMARY KEY (codigo_cd)
);
CREATE TABLE musica(
	codigo_musica int NOT NULL,
    nome_musica varchar(60),
    duracao float (6,2),
PRIMARY KEY (codigo_musica)
);

/*c) Na tabela CD, incluir um novo campo 'Ano', como não nulo, do tipo inteiro;*/
ALTER TABLE cd
	ADD ano int not null; 

/*d) Na tabela MUSICA_AUTOR, incluir um novo campo ‘participacao', como não nulo e do tipo
caracter(40);*/
CREATE TABLE autor (
	codigo_autor int not null,
    nome_autor varchar(60),
PRIMARY KEY (codigo_autor)
);
CREATE TABLE musica_autor(
	codigo_musica int not null,
    codigo_autor int not null,
PRIMARY KEY (codigo_musica, codigo_autor),
FOREIGN KEY (codigo_musica)
	REFERENCES musica (codigo_musica),
FOREIGN KEY (codigo_autor)
	REFERENCES autor (codigo_autor)
);
ALTER TABLE musica_autor
	ADD participacao char(40) not null;
    
/*e) Na tabela GRAVADORA, alterar o tamanho da coluna 'endereco' para caracter(100);*/
ALTER TABLE gravadora
	MODIFY endereco char(100);

/*f) Na tabela MUSICA, alterar o tipo de dado da coluna 'duracao' como caracter(8).*/
ALTER TABLE musica
	MODIFY duracao char(8);
    
/*g) Na tabela GRAVADORA, excluir a coluna ‘url’.*/
ALTER TABLE gravadora
	DROP url;

/*h) Altere a tabela CD, para incluir a chave estrangeira 'codigo_gravadora' da tabela
GRAVADORA.*/
ALTER TABLE cd
	ADD FOREIGN KEY (codigo_gravadora) 
		references gravadora (codigo_gravadora);
        
/*i) Na tabela FAIXA, modifique o nome da coluna 'numero_faixa' por 'faixa‘.*/
ALTER TABLE faixa
	RENAME COLUMN numero_faixa to faixa;

/*j) Modifique o nome da tabela CD_CATEGORIA para CATEGORIA.*/
CREATE TABLE cd_categoria(
	codigo_categoria int not null,
    menor_preco float(14,2),
    maior_preco float(14,2),
PRIMARY KEY (codigo_categoria)
);
ALTER TABLE cd_categoria
RENAME to categoria;

/*k) Exclua a tabela CATEGORIA.*/
DROP TABLE categoria;

/*l) Na tabela CD, inclua um índice por 'codigo_gravadora' e 'data_lançamento‘.*/
CREATE INDEX codigo_gravadora_idx ON cd (codigo_gravadora);
CREATE INDEX data_lancamento_idx ON cd (data_lancamento);

/*m) Na tabela GRAVADORA, inclua um índice por 'nome_gravadora';*/
CREATE INDEX nome_gravadora_idx ON gravadora (nome_gravadora);


