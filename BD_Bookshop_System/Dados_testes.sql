/*DADOS TESTES!!!*/
/*Uso do banco de dados*/
USE `bookShop_BD`;

/*cadastros de endereço*/
INSERT INTO `endereco` (`rua`, `bairro`, `numero`, `cidade`, `cep`, `complemento`, `uf`) VALUES
('Rua das Flores', 'Jardim América', 105, 'São Paulo', '01001000', 'Apto 12', 'SP'),
('Av. Central', 'Centro', 2500, 'Rio de Janeiro', '20002001', 'Sala 501', 'RJ'),
('Travessa da Saudade', 'Vila Nova', 45, 'Belo Horizonte', '30130100', 'Casa', 'MG'),
('Rua do Comércio', 'Santa Efigênia', 88, 'Porto Alegre', '90010100', 'Loja', 'RS'),
('Av. Brasil', 'Liberdade', 300, 'Salvador', '40010000', 'Prédio Comercial', 'BA');

/*Cadastro editoras*/
INSERT INTO `editora` (`nome`, `codigo_Endereco`, `email`) VALUES
('Editora Aurora', 2, 'contato@aurora.com.br'),
('Casa do Saber', 4, 'sac@casadosaber.com');

/*Cadastro cliente*/
INSERT INTO `cliente` (`nome`, `sobrenome`, `codigo_Endereco`) VALUES
('João', 'Silva', 1),
('Maria', 'Oliveira', 3);

/*Cadastro de pessoa física*/
INSERT INTO `pessoa_Fisica` (`id_Pessoa`, `cpf`) VALUES
(1, '12345678901');

/*Cadastro de pessoa jurídica*/
INSERT INTO `pessoa_Juridica` (`id_Pessoa`, `cnpj`) VALUES
(2, '00012345678901');

/*Cadastro autor*/
INSERT INTO `autor` (`nome`, `sobrenome`, `email`) VALUES
('Ana', 'Souza', 'ana.souza@email.com'),
('Carlos', 'Ferreira', 'carlos.f@email.com'),
('Mariana', 'Almeida', 'mari.almeida@email.com');

/*Cadastro de livro*/
INSERT INTO `livro` (`titulo`, `ano_Publicacao`, `preco`, `quantidade`, `descricao`) VALUES
('O Enigma do Tempo', '2020-05-15', 59.90, 15, 'Uma jornada épica através do espaço-tempo.'),
('Amor em Duas Cidades', '2018-10-20', 39.50, 25, 'Um romance clássico sobre reencontros.'),
('A Torre de Cristal', '2023-01-10', 85.00, 10, 'O primeiro volume da saga de Fantasia Celta.'),
('Python para Iniciantes', '2022-03-01', 120.99, 30, 'Guia completo para começar a programar em Python.'),
('Segredos da Noite', '2019-07-25', 45.00, 5, 'Um thriller psicológico com reviravoltas surpreendentes.');

/*Cadastro dos generos*/
INSERT INTO `genero` (`nome`) VALUES
('Ficção Científica'),
('Romance'),
('Fantasia'),
('Suspense'),
('Programação');

/*Cadastro de telefone*/
INSERT INTO `telefone` (`destino_Contato`, `telefone`) VALUES
(1, '11987654321'), 
(2, '5130001234'); 

/*Cadastro funcionario*/
INSERT INTO `funcionario` (`nome`, `cpf`, `senha`, `administrador`, `vendedor`, `estoquista`) VALUES
('Pedro', '11122233344', 'admin123', 1, 0, 0), 
('Luisa', '55566677788', 'venda456', 0, 1, 0); 

/*Cadastro encomenda*/
INSERT INTO `encomenda` (`codigo`) VALUES
(NULL); 

/*Cadastro venda*/
INSERT INTO `venda` (`id_Comprador`, `data`, `valor`, `forma_Pagamento`, `codigo_Encomenda`) VALUES
(1, '2025-12-10', 165.40, 'Cartão de Crédito', NULL), 
(2, '2025-12-11', 120.99, 'Boleto', 1); 

/*Relação livro genero*/
INSERT INTO `livro_Generos` (`id_Livro`, `id_Genero`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 5),
(5, 4),
(1, 3); 

/*Relação de autor e livro*/
INSERT INTO `autor_livro` (`id_Autor`, `id_Livro`) VALUES
(1, 1),
(2, 2),
(3, 3),
(2, 4),
(1, 5);

/*Relação acervo_Editora*/
INSERT INTO `acervo_Editora` (`id_Editora`, `id_Livro`) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 4),
(2, 5);

/*Relação de livros comprados*/
INSERT INTO `livros_Comprados` (`codigo_Compra`, `codigo_Livro`, `quantidade`) VALUES
(1, 1, 2), 
(1, 2, 1), 
(2, 4, 1); 

