-- 02_insert_data.sql
-- Inserts de dados para o banco PrintLab

-- CLIENTES
INSERT INTO cliente (id_cliente, nome, email, telefone, cpf) VALUES
(1, 'Ana Silva',      'ana.silva@example.com',      '(11)90000-0001', '12345678901'),
(2, 'Bruno Souza',    'bruno.souza@example.com',    '(11)90000-0002', '23456789012'),
(3, 'Carla Pereira',  'carla.pereira@example.com',  '(11)90000-0003', '34567890123'),
(4, 'Diego Martins',  'diego.martins@example.com',  '(11)90000-0004', '45678901234'),
(5, 'Eduarda Lopes',  'eduarda.lopes@example.com',  '(11)90000-0005', '56789012345');

-- MATERIAIS
INSERT INTO material (id_material, tipo_material, cor, diametro) VALUES
(1, 'PLA',  'Branco', 1.75),
(2, 'PLA',  'Preto',  1.75),
(3, 'ABS',  'Azul',   1.75),
(4, 'PETG', 'Vermelho', 1.75);

-- IMPRESSORAS
INSERT INTO impressora (id_impressora, modelo, fabricante, status_operacional) VALUES
(1, 'Ender 3 V2',     'Creality',  'Ativa'),
(2, 'Prusa MK3S+',    'Prusa',     'Ativa'),
(3, 'Anycubic Kobra', 'Anycubic',  'Em manutenção');

-- TECNICOS
INSERT INTO tecnico (id_tecnico, nome, especialidade) VALUES
(1, 'Lucas Andrade',  'Impressão FDM'),
(2, 'Mariana Costa',  'Calibração e manutenção'),
(3, 'Rafael Lima',    'Modelagem 3D e impressão');

-- PEDIDOS
INSERT INTO pedido (id_pedido, data_solicitacao, data_entrega_prevista, status, id_cliente) VALUES
(1, '2025-10-01', '2025-10-05', 'CONCLUIDO', 1),
(2, '2025-10-02', '2025-10-06', 'EM PRODUCAO', 2),
(3, '2025-10-03', '2025-10-08', 'PENDENTE', 3),
(4, '2025-10-04', '2025-10-09', 'CONCLUIDO', 1),
(5, '2025-10-05', '2025-10-10', 'CANCELADO', 4),
(6, '2025-10-06', '2025-10-11', 'EM PRODUCAO', 5),
(7, '2025-10-07', '2025-10-12', 'PENDENTE', 2);

-- ARQUIVOS 3D
INSERT INTO arquivo_3d (id_arquivo, nome_arquivo, formato, id_pedido) VALUES
(1, 'suporte_celular',   'STL', 1),
(2, 'chaveiro_logo',     'STL', 1),
(3, 'miniatura_carro',   'OBJ', 2),
(4, 'organizadores_gaveta', 'STL', 3),
(5, 'case_controle',     'STL', 4),
(6, 'prototipo_engrenagem', 'OBJ', 6),
(7, 'peça_personalizada',   'STL', 7);

-- PRODUCOES
INSERT INTO producao (
    id_producao, tempo_estimado, tempo_real, data_inicio, data_fim,
    id_material, id_impressora, id_tecnico, id_pedido
) VALUES
(1, 240, 230, '2025-10-01', '2025-10-02', 1, 1, 1, 1),
(2, 360, NULL, '2025-10-02', NULL,         2, 2, 2, 2),
(3, 180, NULL, '2025-10-03', NULL,         1, 1, 3, 3),
(4, 300, 290, '2025-10-04', '2025-10-05',  3, 2, 1, 4),
(5, 200, NULL, '2025-10-06', NULL,         4, 3, 2, 6),
(6, 150, NULL, '2025-10-07', NULL,         2, 1, 3, 7);
