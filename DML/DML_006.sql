-- ============================================================
-- AULA 3 | GROUP BY — Agrupar e Calcular
-- Tópicos Avançados de Banco de Dados | UniSENAI 2026/1
-- ============================================================
-- GROUP BY colapsa linhas em grupos.
-- Cada grupo vira UMA linha no resultado.
-- Toda coluna no SELECT que NAO é agregação precisa estar no GROUP BY.
-- ============================================================

USE faculdade;

-- Quantos alunos por status de matrícula?
SELECT status, COUNT(*) AS total
FROM matriculas
GROUP BY status;

-- Média de nota por tipo de avaliação
SELECT avaliacao, ROUND(AVG(nota), 2) AS media
FROM notas
GROUP BY avaliacao;

-- Quantas matrículas cada turma tem?
SELECT turma_id, COUNT(*) AS total_matriculas
FROM matriculas
GROUP BY turma_id
ORDER BY total_matriculas DESC;

-- Nota máxima e mínima por matrícula
SELECT matricula_id, MIN(nota) AS menor, MAX(nota) AS maior, ROUND(AVG(nota), 2) AS media
FROM notas
GROUP BY matricula_id;

-- Quantidade de presenças por aluno
SELECT aluno_id, COUNT(*) AS total_presencas
FROM presencas
GROUP BY aluno_id
ORDER BY total_presencas DESC;
