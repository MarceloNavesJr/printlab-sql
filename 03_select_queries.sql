-- 03_select_queries.sql
-- Consultas de exemplo no banco PrintLab

-- 1) Listar todos os clientes ordenados por nome
SELECT
    id_cliente,
    nome,
    email,
    telefone,
    cpf
FROM cliente
ORDER BY nome;

-- 2) Listar pedidos com o nome do cliente e status
SELECT
    p.id_pedido,
    c.nome     AS nome_cliente,
    p.data_solicitacao,
    p.data_entrega_prevista,
    p.status
FROM pedido p
JOIN cliente c ON c.id_cliente = p.id_cliente
ORDER BY p.data_solicitacao DESC;

-- 3) Listar produções com material, impressora, técnico e cliente relacionados
SELECT
    pr.id_producao,
    pr.data_inicio,
    pr.data_fim,
    pr.tempo_estimado,
    pr.tempo_real,
    m.tipo_material,
    m.cor,
    i.modelo         AS impressora,
    t.nome           AS tecnico,
    c.nome           AS cliente
FROM producao pr
JOIN material   m ON m.id_material   = pr.id_material
JOIN impressora i ON i.id_impressora = pr.id_impressora
JOIN tecnico    t ON t.id_tecnico    = pr.id_tecnico
JOIN pedido     p ON p.id_pedido     = pr.id_pedido
JOIN cliente    c ON c.id_cliente    = p.id_cliente
ORDER BY pr.data_inicio;

-- 4) Buscar todos os arquivos 3D de um pedido específico (ex: pedido 1)
SELECT
    a.id_arquivo,
    a.nome_arquivo,
    a.formato,
    a.id_pedido
FROM arquivo_3d a
WHERE a.id_pedido = 1;

-- 5) Contar quantos pedidos cada cliente possui
SELECT
    c.nome AS cliente,
    COUNT(p.id_pedido) AS total_pedidos
FROM cliente c
LEFT JOIN pedido p ON p.id_cliente = c.id_cliente
GROUP BY c.nome
ORDER BY total_pedidos DESC, c.nome
LIMIT 10;
