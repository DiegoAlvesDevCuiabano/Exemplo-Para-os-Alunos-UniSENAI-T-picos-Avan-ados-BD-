-- ============================================================
-- AULA 3 | SUBCONSULTAS — Query dentro de Query
-- Tópicos Avançados de Banco de Dados | UniSENAI 2026/1
-- ============================================================
-- O resultado de um SELECT vira dado pra outro SELECT.
-- WHERE col IN (SELECT ...)  → filtra por lista
-- FROM (SELECT ...) AS alias → tabela virtual (precisa de alias!)
-- HAVING AVG(x) > (SELECT ...) → compara com valor escalar
-- ============================================================

USE faculdade;

-- Alunos matriculados na turma 1 (BD I)
SELECT nome FROM alunos
WHERE id IN (SELECT aluno_id FROM matriculas WHERE turma_id = 1);

-- Matrículas com média acima da média geral
SELECT matricula_id, ROUND(AVG(nota), 2) AS media
FROM notas
GROUP BY matricula_id
HAVING AVG(nota) > (SELECT AVG(nota) FROM notas);

-- Maior média entre todas as matrículas
-- ⚠️ Subconsulta no FROM precisa de alias (AS medias). Sem alias = erro no MariaDB.
SELECT MAX(media) AS maior_media FROM (
    SELECT AVG(nota) AS media FROM notas GROUP BY matricula_id
) AS medias;

-- Professores que dão aula em turmas do semestre 2026/1
SELECT nome FROM professores
WHERE id IN (SELECT professor_id FROM turmas WHERE semestre = '2026/1');

-- Alunos que NÃO têm nenhuma matrícula ativa
SELECT nome FROM alunos
WHERE id NOT IN (SELECT aluno_id FROM matriculas WHERE status = 'ativa');
