# PrintLab – Banco de Dados de Impressão 3D

Este repositório contém os scripts SQL referentes ao projeto de banco de dados **PrintLab**, desenvolvido como parte da Experiência Prática IV de Modelagem de Banco de Dados.

O mini-mundo representa uma oficina de impressão 3D que gerencia clientes, pedidos, arquivos 3D enviados, produções, materiais, impressoras e técnicos.

##  Estrutura do Repositório

- `01_create_tables.sql`  
  Criação de todas as tabelas do banco de dados, com chaves primárias, chaves estrangeiras e tipos de dados.

- `02_insert_data.sql`  
  Comandos `INSERT` para povoar as tabelas principais com dados de exemplo.

- `03_select_queries.sql`  
  Consultas `SELECT` com `JOIN`, `WHERE`, `ORDER BY`, `LIMIT` e agregações.

- `04_update_delete.sql`  
  Comandos `UPDATE` e `DELETE` com condições, respeitando a integridade referencial.

##  Tecnologias Utilizadas

- Banco de Dados: **PostgreSQL**
- Ferramenta sugerida: **PGAdmin** ou qualquer cliente SQL compatível.

##  Como Executar os Scripts

1. Criar um banco de dados, por exemplo:

   ```sql
   CREATE DATABASE printlab_db;
