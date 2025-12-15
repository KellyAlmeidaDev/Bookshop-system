# 📚 Bookshop System

> **Status do Projeto:** Em Desenvolvimento

## Apresentação

O **Bookshop System** é uma ferramenta de gestão desenvolvida para livrarias, com o propósito de otimizar a organização de vendas, o controle de estoque e o gerenciamento de dados essenciais ao negócio, como registros de livros, clientes e transações.

## Objetivo

O principal objetivo do sistema é atuar como um centralizador de informações, garantindo registros seguros e íntegros. O projeto visa:
* **Organização de Vendas:** Registrar detalhadamente vendas e encomendas, atualizando o estoque automaticamente.
* **Gestão de Cadastros:** Manter o controle de livros, autores, editoras, clientes e funcionários.
* **Segurança e Permissões:** Filtrar o acesso às funcionalidades com base no tipo de usuário (Estoquista, Vendedor, Administrador), garantindo que apenas o Administrador visualize o fluxo de caixa geral.

## Tecnologias

Este projeto está sendo desenvolvido para ambientes *desktop* e utiliza as seguintes tecnologias:

| Categoria | Tecnologia | Detalhes |
| :---: | :---: | :--- |
| **Back-end** | C# (C sharp) | Linguagem de programação principal para a lógica de negócio do sistema. |
| **Banco de Dados** | MySQL | Sistema de banco de dados relacional escolhido para manipulação e abrigo das informações cadastradas. |
| **Plataforma** | Desktop | Sistema projetado para ser executado em computadores pessoais. |

## Como Testar (Configuração do Banco de Dados)

O sistema depende de um banco de dados relacional **MySQL** para armazenar todos os dados. Para testar o projeto, você deve configurar o *schema* do banco de dados seguindo os passos abaixo:

1.  **Localize o Script:** O projeto contém um script SQL de criação do banco de dados (comumente na pasta `db` ou `scripts`) que define todas as tabelas e relações necessárias.
2.  **Abra seu Cliente MySQL:** Utilize uma ferramenta de gerenciamento de banco de dados como **MySQL Workbench**, DBeaver ou o cliente de linha de comando (`CLI`).
3.  **Execute o Script:** Conecte-se ao seu servidor MySQL, abra o arquivo SQL de criação do banco de dados e execute todo o seu conteúdo.

Após a execução bem-sucedida, a estrutura do banco de dados estará pronta para ser utilizada pela aplicação desenvolvida em C#.

---
*Este projeto está em desenvolvimento e novas funcionalidades e melhorias serão incorporadas em futuras versões.*
