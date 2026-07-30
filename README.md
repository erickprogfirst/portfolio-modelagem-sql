ZaptUtil - Modelagem Relacional para E-commerce
Este repositório contém a arquitetura de banco de dados desenvolvida para o ZaptUtil, uma plataforma real de e-commerce. O objetivo deste projeto é demonstrar a estruturação lógica e física de um sistema de vendas, garantindo a integridade financeira das transações, o controle rigoroso de estoque e a preparação dos dados para futuras análises de Business Intelligence (BI), como integrações com Power BI.

Autor: Erickson Fernandes

Arquitetura do Banco de Dados
O modelo foi projetado para sustentar as operações fundamentais de uma loja virtual, traduzindo regras de negócio complexas em estruturas relacionais sólidas.

Abaixo está o Diagrama Entidade-Relacionamento (ERD) gerado via Engenharia Reversa:

Regras de Negócio Aplicadas

Integridade Financeira Histórica: A tabela itens_pedido armazena o preco_unitario exato no momento da compra. Isso garante que flutuações futuras no preço do catálogo de produtos não alterem o histórico de faturamento da empresa.

Controle de Status Rígido: Utilização do tipo de dado ENUM na tabela pedidos para restringir as atualizações de status a estágios reais da operação ('Pendente', 'Pago', 'Enviado', 'Cancelado'), evitando inconsistências por falha humana ou de sistema.

Gestão de Catálogo e Estoque: Centralização dos dados físicos dos produtos, permitindo o controle exato de disponibilidade antes da efetivação de novas vendas.

Tecnologias Utilizadas

MySQL Server 8.0: Motor do banco de dados relacional.

MySQL Workbench: Criação de scripts, execução e engenharia reversa para modelagem visual.

Linguagem SQL: Utilização de comandos DDL (criação de estrutura) e DML (manipulação e inserção de dados).

Git e GitHub: Versionamento de código e documentação de portfólio.

Estrutura do Repositório

01_setup_zaptutil.sql: Script de criação do banco de dados.

02_tabelas_zaptutil.sql: Script DDL com a modelagem das tabelas e chaves estrangeiras.

03_insercao_dados.sql: Script DML contendo a carga inicial de dados para simulação de vendas e testes.