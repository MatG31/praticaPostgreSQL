CREATE TABLE cursos (
	id SERIAL PRIMARY KEY,
	nome VARCHAR(45),
	carga_horaria INTEGER,
	professor VARCHAR(20),
	ultima_atualizacao DATE,
	turma CHAR(1)
);

CREATE TABLE alunos(
	id SERIAL PRIMARY KEY,
	nome VARCHAR(20)
)

INSERT INTO cursos (nome, carga_horaria, professor, ultima_atualizacao, turma) 
	VALUES ('APIs com Express', 10, 'Claudomiro', '25-04-2025', 'B');

INSERT INTO cursos (nome, carga_horaria, professor, ultima_atualizacao, turma) 
	VALUES ('Responsividade com Angular', 7, 'Bethania', '10-02-2024', 'A');

SELECT * FROM cursos;

UPDATE cursos SET professor = 'Josefina' WHERE id = 2;

SELECT nome AS "Nome do curso:" FROM cursos WHERE carga_horaria >= 10 AND turma = 'B';

INSERT INTO cursos (id, nome, carga_horaria, professor, ultima_atualizacao, turma) 
	VALUES (2,'Como explodir uma bomba', 500, 'Robersvaldo', '10-09-1910', 'Z');

CREATE TABLE aluno_curso (
	aluno_id INTEGER,
	curso_id INTEGER,
	
	PRIMARY KEY (aluno_id, curso_id),

	FOREIGN KEY (aluno_id)
		REFERENCES alunos(id)
		ON DELETE CASCADE
		ON UPDATE CASCADE,

	FOREIGN KEY (curso_id)
		REFERENCES cursos(id)
		ON UPDATE CASCADE
);

SELECT * FROM aluno_curso;
SELECT * FROM alunos;

INSERT INTO alunos(nome) VALUES ('Armando');

INSERT INTO aluno_curso(aluno_id, curso_id) VALUES (3, 3);

INSERT INTO aluno_curso(aluno_id, curso_id) VALUES (3, 1);

INSERT INTO alunos(nome) VALUES ('Zoraida');
INSERT INTO cursos(nome) VALUES ('Azure');

SELECT alunos.nome AS "Aluno", cursos.nome AS "Curso", alunos.id AS "ID Aluno"
FROM alunos 
	JOIN aluno_curso ON alunos.id = aluno_curso.aluno_id
	JOIN cursos ON cursos.id = aluno_curso.curso_id;

SELECT alunos.nome AS "Aluno", cursos.nome AS "Curso" FROM alunos
	LEFT JOIN aluno_curso ON alunos.id = aluno_curso.aluno_id
	LEFT JOIN cursos ON cursos.id = aluno_curso.curso_id;

SELECT alunos.nome AS "Aluno", cursos.nome AS "Curso" FROM alunos
	RIGHT JOIN aluno_curso ON alunos.id = aluno_curso.aluno_id
	RIGHT JOIN cursos ON cursos.id = aluno_curso.curso_id;

SELECT alunos.nome AS "Aluno", cursos.nome AS "Curso" FROM alunos
	FULL JOIN aluno_curso ON alunos.id = aluno_curso.aluno_id
	FULL JOIN cursos ON cursos.id = aluno_curso.curso_id;

SELECT alunos.nome AS "Aluno", cursos.nome AS "Curso" FROM alunos
	CROSS JOIN cursos;

SELECT * FROM aluno_curso;

DELETE FROM aluno_curso WHERE aluno_id = 3;

DROP TABLE aluno_curso;

UPDATE alunos SET id = 10 WHERE id = 3;

SELECT alunos.nome AS "Aluno", cursos.nome AS "Curso", alunos.id AS "ID Aluno"
FROM alunos 
	FULL JOIN aluno_curso ON alunos.id = aluno_curso.aluno_id
	FULL JOIN cursos ON cursos.id = aluno_curso.curso_id
ORDER BY alunos.nome DESC;

SELECT * FROM alunos ORDER BY id LIMIT 3 OFFSET 1;

SELECT * FROM cursos;

UPDATE cursos SET carga_horaria = 15 WHERE id = 3;

SELECT SUM(carga_horaria) FROM cursos;
SELECT ROUND(AVG(carga_horaria), 1) FROM cursos;

SELECT * FROM alunos;

INSERT INTO alunos (nome) VALUES ('Juvenal');

SELECT DISTINCT alunos.nome FROM alunos ORDER BY nome; 

SELECT alunos.nome, COUNT(nome) FROM alunos GROUP BY nome ORDER BY nome;

SELECT cursos.nome, COUNT(alunos.id)
	FROM cursos
	LEFT JOIN aluno_curso ON cursos.id = aluno_curso.curso_id
	LEFT JOIN alunos ON aluno_curso.aluno_id = alunos.id
	GROUP BY cursos.nome
	HAVING COUNT(alunos.id) = 0
	ORDER BY cursos.nome;

INSERT INTO aluno_curso(aluno_id, curso_id) VALUES (2, 2);

SELECT *
	FROM cursos
	LEFT JOIN aluno_curso ON cursos.id = aluno_curso.curso_id
	LEFT JOIN alunos ON aluno_curso.aluno_id = alunos.id;




