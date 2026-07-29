USE db_zaptutil;

-- 1. Inserindo Clientes
INSERT INTO clientes (nome, email, cpf) VALUES
('Ana Oliveira', 'ana.oliveira@email.com', '11122233344'),
('Carlos Santos', 'carlos.santos@email.com', '55566677788'),
('Mariana Costa', 'mariana.costa@email.com', '99900011122');

-- 2. Inserindo Produtos (Simulando o catálogo do e-commerce)
INSERT INTO produtos (sku, nome, descricao, preco, quantidade_estoque) VALUES
('ZPT-001', 'Fone de Ouvido Bluetooth', 'Fone com cancelamento de ruído', 299.90, 50),
('ZPT-002', 'Cabo USB-C Turbo', 'Cabo reforçado de 2 metros', 45.00, 150),
('ZPT-003', 'Carregador Portátil 10000mAh', 'Powerbank de carga rápida', 120.50, 30);

-- 3. Registrando os Pedidos
-- Pedido 1 (Ana comprou 1 fone e 2 cabos) -> Valor Total = 299.90 + 90.00 = 389.90
INSERT INTO pedidos (id_cliente, status_pedido, valor_total) VALUES
(1, 'Pago', 389.90);

-- Pedido 2 (Carlos comprou 1 powerbank) -> Valor Total = 120.50
INSERT INTO pedidos (id_cliente, status_pedido, valor_total) VALUES
(2, 'Enviado', 120.50);

-- 4. Registrando os Itens de cada Pedido
-- Itens do Pedido 1 (Referente à Ana)
INSERT INTO itens_pedido (id_pedido, id_produto, quantidade, preco_unitario) VALUES
(1, 1, 1, 299.90), -- 1 Fone
(1, 2, 2, 45.00);  -- 2 Cabos

-- Itens do Pedido 2 (Referente ao Carlos)
INSERT INTO itens_pedido (id_pedido, id_produto, quantidade, preco_unitario) VALUES
(2, 3, 1, 120.50); -- 1 Powerbank