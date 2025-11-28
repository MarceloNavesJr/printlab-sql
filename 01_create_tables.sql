-- 01_create_tables.sql
-- Banco de dados PrintLab - PostgreSQL

-- Apague as tabelas se já existirem (para facilitar testes)
DROP TABLE IF EXISTS producao;
DROP TABLE IF EXISTS arquivo_3d;
DROP TABLE IF EXISTS pedido;
DROP TABLE IF EXISTS cliente;
DROP TABLE IF EXISTS material;
DROP TABLE IF EXISTS impressora;
DROP TABLE IF EXISTS tecnico;

-- Tabela CLIENTE
CREATE TABLE cliente (
    id_cliente      INT PRIMARY KEY,
    nome            VARCHAR(100) NOT NULL,
    email           VARCHAR(100) NOT NULL,
    telefone        CHAR(15)     NOT NULL,
    cpf             CHAR(11)     NOT NULL UNIQUE
);

-- Tabela PEDIDO
CREATE TABLE pedido (
    id_pedido              INT PRIMARY KEY,
    data_solicitacao       DATE        NOT NULL,
    data_entrega_prevista  DATE,
    status                 VARCHAR(30) NOT NULL,
    id_cliente             INT         NOT NULL,
    CONSTRAINT fk_pedido_cliente
        FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);

-- Tabela ARQUIVO_3D
CREATE TABLE arquivo_3d (
    id_arquivo   INT PRIMARY KEY,
    nome_arquivo VARCHAR(100) NOT NULL,
    formato      VARCHAR(10)  NOT NULL,
    id_pedido    INT          NOT NULL,
    CONSTRAINT fk_arquivo_pedido
        FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido)
);

-- Tabela MATERIAL
CREATE TABLE material (
    id_material   INT PRIMARY KEY,
    tipo_material VARCHAR(50) NOT NULL,
    cor           VARCHAR(20) NOT NULL,
    diametro      NUMERIC(4,2) NOT NULL
);

-- Tabela IMPRESSORA
CREATE TABLE impressora (
    id_impressora      INT PRIMARY KEY,
    modelo             VARCHAR(100) NOT NULL,
    fabricante         VARCHAR(100) NOT NULL,
    status_operacional VARCHAR(50)  NOT NULL
);

-- Tabela TECNICO
CREATE TABLE tecnico (
    id_tecnico    INT PRIMARY KEY,
    nome          VARCHAR(100) NOT NULL,
    especialidade VARCHAR(100) NOT NULL
);

-- Tabela PRODUCAO
CREATE TABLE producao (
    id_producao   INT PRIMARY KEY,
    tempo_estimado INT       NOT NULL,
    tempo_real     INT,
    data_inicio    DATE      NOT NULL,
    data_fim       DATE,
    id_material    INT       NOT NULL,
    id_impressora  INT       NOT NULL,
    id_tecnico     INT       NOT NULL,
    id_pedido      INT       NOT NULL UNIQUE,
    CONSTRAINT fk_producao_material
        FOREIGN KEY (id_material) REFERENCES material(id_material),
    CONSTRAINT fk_producao_impressora
        FOREIGN KEY (id_impressora) REFERENCES impressora(id_impressora),
    CONSTRAINT fk_producao_tecnico
        FOREIGN KEY (id_tecnico) REFERENCES tecnico(id_tecnico),
    CONSTRAINT fk_producao_pedido
        FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido)
);
