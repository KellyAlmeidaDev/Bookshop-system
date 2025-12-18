/*Criação e habilitação de uso do BD*/
CREATE DATABASE IF NOT EXISTS `bookShop_BD`;
USE `bookShop_BD`;

/*Criação de tabelas*/

	/*Genero dos livros*/
CREATE TABLE `genero` (
	`id` INT NOT NULL AUTO_INCREMENT,
    `nome` VARCHAR(100) NOT NULL,
    PRIMARY KEY (`id`)
);
    
    /*Relação livro e seus generos*/
CREATE TABLE `livro_Generos`(
	`id_Livro` INT NOT NULL,
    `id_Genero` INT NOT NULL,
    PRIMARY KEY (`id_Livro`, `id_Genero`)
);

    /*Livros*/
CREATE TABLE `livro`(
	`codigo` INT NOT NULL AUTO_INCREMENT,
    `titulo` VARCHAR(255) NOT NULL,
    `ano_Publicacao` DATE NOT NULL,
    `preco` DECIMAL(9,2) NOT NULL,
    `quantidade` INT NOT NULL,
    `descricao` VARCHAR(255),
    PRIMARY KEY (`codigo`)
);

    /*Autores*/
CREATE TABLE `autor`(
	`id` INT NOT NULL AUTO_INCREMENT,
    `nome` VARCHAR(50) NOT NULL,
    `sobrenome` VARCHAR(100) NOT NULL,
    `email` VARCHAR(200),
    PRIMARY KEY(`id`)
);
    
    /*Relação autores e livros*/
CREATE TABLE `autor_livro`(
	`id_Autor` INT NOT NULL,
    `id_Livro` INT NOT NULL,
    PRIMARY KEY (`id_Autor`, `id_Livro`)
);
    
	/*Editora*/
CREATE TABLE `editora`(
	`id` INT NOT NULL AUTO_INCREMENT,
    `nome` VARCHAR(255) NOT NULL,
    `codigo_Endereco` INT NOT NULL,
    `email` VARCHAR(255),
    PRIMARY KEY (`id`)
);

    /*Acervo das editoras*/
CREATE TABLE `acervo_Editora`(
	`id_Editora` INT NOT NULL,
    `id_Livro` INT NOT NULL,
    PRIMARY KEY (`id_Editora`, `id_Livro`)
);
    
    /*Telefones*/
CREATE TABLE `telefone`(
	`destino_Contato` INT NOT NULL,
    `telefone` VARCHAR(45) NOT NULL,
    PRIMARY KEY(`destino_Contato`)
);
    
    /*Endereço*/
CREATE TABLE `endereco`(
	`codigo` INT NOT NULL AUTO_INCREMENT,
    `rua` VARCHAR(255) NOT NULL,
    `bairro` VARCHAR(255) NOT NULL,
    `numero` INT NOT NULL,
    `cidade` VARCHAR(255) NOT NULL,
    `cep` VARCHAR(8) NOT NULL,
    `complemento` VARCHAR(45) NOT NULL,
    `uf` VARCHAR(45) NOT NULL,
    PRIMARY KEY(`codigo`)
);
    
    /*Cliente*/
CREATE TABLE `cliente`(
	`id` INT NOT NULL AUTO_INCREMENT,
    `nome` VARCHAR(50) NOT NULL,
    `sobrenome` VARCHAR(100),
    `codigo_Endereco` INT NOT NULL,
    PRIMARY KEY(`id`)
);
    
    /*Pessoa física*/
CREATE TABLE `pessoa_Juridica`(
	`id_Pessoa` INT NOT NULL,
    `cnpj` CHAR(14),
    PRIMARY KEY(`id_Pessoa`)
);

    /*Pessoa juridica*/
CREATE TABLE `pessoa_Fisica`(
	`id_Pessoa` INT NOT NULL,
    `cpf` CHAR(11) NOT NULL,
    PRIMARY KEY (`id_Pessoa`)
);
    
    /*Venda*/
CREATE TABLE `venda`(
	`codigo` INT NOT NULL AUTO_INCREMENT,
    `id_Comprador` INT NOT NULL,
    `data` DATE NOT NULL,
    `valor` DECIMAL(9,2),
    `forma_Pagamento` VARCHAR(45) NOT NULL,
    `codigo_Encomenda` INT,
    PRIMARY KEY(`codigo`)
);
    
    /*Livros comprados*/
CREATE TABLE `livros_Comprados`(
	`codigo_Compra` INT NOT NULL,
    `codigo_Livro` INT NOT NULL,
    `quantidade` INT NOT NULL,
    PRIMARY KEY (`codigo_Compra`, `codigo_Livro`)
);
    
    /*encomenda*/
CREATE TABLE `encomenda`(
	`codigo` INT NOT NULL AUTO_INCREMENT,
    PRIMARY KEY(`codigo`)
);
    
    /*funcionario*/
CREATE TABLE `funcionario`(
	`id` INT NOT NULL AUTO_INCREMENT,
    `nome` VARCHAR(255) NOT NULL,
    `cpf` CHAR(11) NOT NULL,
    `senha` VARCHAR(20) NOT NULL,
    `administrador` BOOLEAN NOT NULL,
    `vendedor` BOOLEAN NOT NULL,
    `estoquista` BOOLEAN NOT NULL,
    PRIMARY KEY(`id`)
);
    
/*Relações entre tabelas*/
	
    /*Genero - livro genero*/
ALTER TABLE `livro_Generos` ADD CONSTRAINT `FK_id_Genero_lg` FOREIGN KEY (`id_Genero`) REFERENCES `genero`(`id`);
   /*livro genero - livro*/
ALTER TABLE `livro_Generos` ADD CONSTRAINT `FK_id_Livro_lg` FOREIGN KEY (`id_Livro`) REFERENCES `livro`(`codigo`);
    /*livro - autores livros*/
ALTER TABLE `autor_Livro` ADD CONSTRAINT `FK_id_Autor_al` FOREIGN KEY (`id_Autor`) REFERENCES `autor`(`id`);
    /*autores livros - autor*/
ALTER TABLE `autor_Livro` ADD CONSTRAINT `FK_id_Livro_al` FOREIGN KEY (`id_Livro`) REFERENCES `livro`(`codigo`);
    /*livro - acervo*/
ALTER TABLE `acervo_Editora` ADD CONSTRAINT `FK_id_Livro_a` FOREIGN KEY (`id_Livro`) REFERENCES `livro`(`codigo`);
    /*acervo - editora*/
ALTER TABLE `acervo_Editora` ADD CONSTRAINT `FK_id_Editora_a` FOREIGN KEY (`id_Editora`) REFERENCES `editora`(`id`);
    /*editora - lista contato telefone*/
ALTER TABLE `telefone` ADD CONSTRAINT `FK_destino_Contato_t` FOREIGN KEY (`destino_Contato`) REFERENCES `editora`(`id`);
    /*editora - endereco*/
ALTER TABLE `editora` ADD CONSTRAINT `FK_codigo_Endereco_e` FOREIGN KEY (`codigo_Endereco`) REFERENCES `endereco`(`codigo`);
    /*endereco - cliente*/
ALTER TABLE `cliente` ADD CONSTRAINT `FK_codigo_Endereco_c` FOREIGN KEY (`codigo_Endereco`) REFERENCES `endereco`(`codigo`);
    /*cliente - pessoa juridica*/
ALTER TABLE `pessoa_Juridica` ADD CONSTRAINT `FK_pessoa_Juridica_pj` FOREIGN KEY (`id_Pessoa`) REFERENCES `cliente`(`id`);
    /*cliente - pessoa física*/
ALTER TABLE `pessoa_Fisica` ADD CONSTRAINT `FK_pessoa_Fisica_pf` FOREIGN KEY (`id_Pessoa`) REFERENCES `cliente`(`id`);
    /*cliente - lista contato telefone*/
ALTER TABLE `telefone` ADD CONSTRAINT `FK_destino_Contato_t_c` FOREIGN KEY (`destino_Contato`) REFERENCES `cliente`(`id`);
    /*cliente - venda*/
ALTER TABLE `venda` ADD CONSTRAINT `FK_id_Comprador_v` FOREIGN KEY (`id_Comprador`) REFERENCES `cliente`(`id`);
    /*venda - encomenda*/
ALTER TABLE `venda` ADD CONSTRAINT `FK_codigo_Encomenda_v` FOREIGN KEY (`codigo_Encomenda`) REFERENCES `encomenda`(`codigo`);
    /*venda - livros comprados*/
ALTER TABLE `livros_Comprados` ADD CONSTRAINT `FK_codigo_Compra_lc` FOREIGN KEY (`codigo_Compra`) REFERENCES `venda`(`codigo`);
    /*livro contato telefone - funcionario*/
ALTER TABLE `livros_Comprados` ADD CONSTRAINT `FK_codigo_Livro_lc` FOREIGN KEY (`codigo_Livro`) REFERENCES `livro`(`codigo`);