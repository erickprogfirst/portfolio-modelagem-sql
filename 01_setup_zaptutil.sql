-- Garante que estamos usando o banco correto
USE db_zaptutil;

-- 1. Tabela de Clientes
CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    cpf VARCHAR(14) UNIQUE,
    data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- 2. Tabela de Produtos (Catálogo e Estoque)
CREATE TABLE produtos (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    sku VARCHAR(50) NOT NULL UNIQUE, -- Código único de controle
    nome VARCHAR(150) NOT NULL,
    descricao TEXT,
    preco DECIMAL(10, 2) NOT NULL, -- DECIMAL é ideal para dinheiro
    quantidade_estoque INT NOT NULL DEFAULT 0,
    ativo BOOLEAN DEFAULT TRUE
);

-- 3. Tabela de Pedidos (A "Capa" da venda)
CREATE TABLE pedidos (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    data_pedido DATETIME DEFAULT CURRENT_TIMESTAMP,
    status_pedido ENUM('Pendente', 'Pago', 'Enviado', 'Cancelado') DEFAULT 'Pendente',
    valor_total DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

-- 4. Tabela de Itens do Pedido (A relação entre Pedido e Produto)
CREATE TABLE itens_pedido (
    id_pedido INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10, 2) NOT NULL, -- Guarda o preço exato no momento da compra
    PRIMARY KEY (id_pedido, id_produto),
    FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido),
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);