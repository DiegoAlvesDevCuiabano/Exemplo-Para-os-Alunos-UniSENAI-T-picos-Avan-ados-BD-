-- ============================================================
-- AULA 3 | UNIQUE + COMMENT — Integridade e Documentação
-- Tópicos Avançados de Banco de Dados | UniSENAI 2026/1
-- ============================================================
-- UNIQUE cria índice B-Tree automaticamente (InnoDB/MariaDB).
-- COMMENT documenta intenção direto no catálogo do banco.
-- ============================================================

USE faculdade;

-- Ver os índices que o UNIQUE criou automaticamente
SHOW INDEX FROM alunos;
describe alunos;

-- Provocando o banco: tentativa de CPF duplicado
-- ❌ Deve dar: Duplicate entry '100.000.000-01' for key 'cpf'
INSERT INTO alunos (nome, cpf, email, data_nascimento)
VALUES ('Teste Duplicado', '100.000.000-01', 'x@x.com', '2000-01-01');

-- Provocando o banco: tentativa de email duplicado
-- ❌ Deve dar: Duplicate entry para a key 'email'
INSERT INTO alunos (nome, cpf, email, data_nascimento)
VALUES ('Teste Email', '999.999.999-99', 'joao.santos@aluno.uni.br', '2000-01-01');

-- ============================================================
-- COMMENT — Documentação viva
-- ============================================================

-- Comentário na tabela
ALTER TABLE alunos COMMENT = 'Cadastro de alunos. CPF e email sao unicos.';

-- Comentário em coluna
ALTER TABLE alunos MODIFY ativo BOOLEAN NOT NULL DEFAULT TRUE
COMMENT 'FALSE = aluno desligado ou transferido';

-- Consultar comentários de tabelas
SELECT TABLE_NAME, TABLE_COMMENT
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_SCHEMA = 'faculdade';

-- Consultar comentários de colunas
SHOW FULL COLUMNS FROM alunos;
