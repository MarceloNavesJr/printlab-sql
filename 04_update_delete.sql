-- 04_update_delete.sql
-- Exemplos de UPDATE e DELETE no banco PrintLab

-- ======================
-- COMANDOS DE UPDATE
-- ======================

-- 1) Atualizar o status de um pedido de 'PENDENTE' para 'EM PRODUCAO'
UPDATE pedido
SET status = 'EM PRODUCAO'
WHERE id_pedido = 3;

-- 2) Atualizar o status operacional de uma impressora
UPDATE impressora
SET status_operacional = 'Em manutenção'
WHERE id_impressora = 2;

-- 3) Registrar o tempo real e a data de término de uma produção concluída
UPDATE producao
SET tempo_real = 240,
    data_fim   = '2025-10-08'
WHERE id_producao = 3;

-- ======================
-- COMANDOS DE DELETE
-- ======================

-- 1) Excluir arquivos 3D de um pedido cancelado (ex: pedido 5)
DELETE FROM arquivo_3d
WHERE id_pedido = 5;

-- 2) Excluir produções associadas a um pedido cancelado (se houver)
DELETE FROM producao
WHERE id_pedido = 5;

-- 3) Excluir o próprio pedido cancelado
DELETE FROM pedido
WHERE id_pedido = 5;
