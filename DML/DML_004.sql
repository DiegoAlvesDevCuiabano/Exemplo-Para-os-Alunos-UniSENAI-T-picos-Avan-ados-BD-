-- ============================================================
-- AULA 3 | UNION + UNION ALL — Juntar Resultados
-- Tópicos Avançados de Banco de Dados | UniSENAI 2026/1
-- ============================================================
-- UNION: junta e REMOVE duplicatas (mais lento, faz DISTINCT)
-- UNION ALL: junta e MANTÉM tudo (mais rápido)
-- Regra: mesmo número de colunas e tipos compatíveis.
-- ============================================================

USE faculdade;

-- Lista unificada: professores + alunos
SELECT nome, 'Professor' AS tipo FROM professores
UNION ALL
SELECT nome, 'Aluno' AS tipo FROM alunos;

-- Todos os emails sem repetição
SELECT email FROM professores
UNION
SELECT email FROM alunos;

-- Mini-relatório de matrículas por status
SELECT 'Ativas' AS status, COUNT(*) AS total FROM matriculas WHERE status = 'ativa'
UNION ALL
SELECT 'Trancadas', COUNT(*) FROM matriculas WHERE status = 'trancada'
UNION ALL
SELECT 'Canceladas', COUNT(*) FROM matriculas WHERE status = 'cancelada';

-- Contagem de registros por tabela (validação rápida)
SELECT 'professores' AS tabela, COUNT(*) AS total FROM professores
UNION ALL SELECT 'alunos',      COUNT(*) FROM alunos
UNION ALL SELECT 'disciplinas', COUNT(*) FROM disciplinas
UNION ALL SELECT 'turmas',      COUNT(*) FROM turmas
UNION ALL SELECT 'matriculas',  COUNT(*) FROM matriculas
UNION ALL SELECT 'notas',       COUNT(*) FROM notas
UNION ALL SELECT 'presencas',   COUNT(*) FROM presencas;
