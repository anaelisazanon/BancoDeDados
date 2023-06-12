Criar tabela:


CREATE TABLE `mydb`.`pessoas` ( 
	`id` INT NOT NULL AUTO_INCREMENT , 
	`nome` VARCHAR(255) NOT NULL , 
	`email` VARCHAR(150) NOT NULL , 
	PRIMARY KEY (`id`)
) ENGINE = InnoDB;


Inserir valores:

INSERT INTO `pessoas` 
	(`id`, `nome`, `email`) 
VALUES 
	(NULL, 'nome um', 'um@email');

INSERT INTO `pessoas` 
	(`nome`, `email`) 
VALUES 
	('nome cinco', 'cinco@email');


1. Listar todos os dados da tabela pessoa
	SELECT * FROM `pessoas`

2. Listar nome e e-mail em ordem descendente de e-mail
	SELECT nome, email FROM `pessoas` ORDER BY email DESC;
	
3. Listar nome e telefone das pessoas que tem telefone
	SELECT pessoas.nome, telefone.telefone FROM `pessoas`,`telefone` where pessoas.id = telefone.idpessoa;

4. Listar nome e telefone de todas as pessoas
	Mesmo

5. Listar nome das pessoas que não tem telefone
	SELECT pessoas.nome FROM `pessoas` where pessoas.id NOT IN (SELECT telefone.idpessoa FROM telefone);

6. Alterar o nome das pessoas para os colegas de classe
	UPDATE pessoas SET nome="Bruno" WHERE id=5;

7. Listar nome das pessoas que não tem telefone em ordem descendente (nome)
	SELECT pessoas.nome FROM `pessoas` where pessoas.id NOT IN (SELECT telefone.idpessoa FROM telefone) ORDER BY pessoas.nome DESC;
	
8. Listar nome e email das pessoas que não tem telefone
	SELECT pessoas.nome, pessoas.email FROM `pessoas` where pessoas.id NOT IN (SELECT telefone.idpessoa FROM telefone);	

9. Acrescentar o prefixo (48) e o algarismo 9 aos telefones
	UPDATE telefone set telefone=CONCAT('(48)9',telefone);

10. Deletar as pessoas que não tem telefone

	DELETE FROM pessoas WHERE id NOT IN (SELECT idpessoa FROM telefone);
