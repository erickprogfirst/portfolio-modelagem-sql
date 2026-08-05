USE db_zaptutil;

-- Relatório 1: Histórico completo de compras detalhado (Ideal para cruzar no Power BI)
-- Aqui usamos o JOIN para costurar as 4 tabelas e descobrir QUEM comprou O QUÊ.
SELECT 
    c.nome AS Cliente,
    c.cpf AS CPF,
    p.id_pedido AS Num_Pedido,
    p.data_pedido AS Data_da_Compra,
    prod.nome AS Produto,
    i.quantidade AS Qtd,
    i.preco_unitario AS Preco_Pago,
    (i.quantidade * i.preco_unitario) AS Total_do_Item,
    p.status_pedido AS Status
FROM clientes c
JOIN pedidos p ON c.id_cliente = p.id_cliente
JOIN itens_pedido i ON p.id_pedido = i.id_pedido
JOIN produtos prod ON i.id_produto = prod.id_produto
ORDER BY p.data_pedido DESC;


-- Relatório 2: Faturamento Total e Ticket Médio por Cliente
-- Usamos o GROUP BY para somar os valores agrupados por pessoa.
SELECT 
    c.nome AS Cliente,
    COUNT(p.id_pedido) AS Total_de_Pedidos,
    SUM(p.valor_total) AS Valor_Total_Gasto,
    AVG(p.valor_total) AS Ticket_Medio
FROM clientes c
JOIN pedidos p ON c.id_cliente = p.id_cliente
GROUP BY c.id_cliente, c.nome
ORDER BY Valor_Total_Gasto DESC;