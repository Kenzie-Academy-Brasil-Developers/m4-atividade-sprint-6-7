CREATE DATABASE m4_atividades;

/* \c m4_atividades */

/*
"name" - texto com no máximo 150 caracteres.
"email" - texto com no máximo 250 caracteres.
"module" - texto com 2 caracteres.
"score" - número inteiro.
"active" - booleano.
Todas as colunas devem ser obrigatórias.
*/

CREATE TABLE students (
    "id" SERIAL PRIMARY KEY,
    "name" VARCHAR(150) NOT NULL,
    "email" VARCHAR(250) NOT NULL,
    "module" CHAR(2) NOT NULL,
    "score" INTEGER NOT NULL,
    "active" BOOLEAN NOT NULL
);

/*
Estudante 1: Enzo, enzo@email.com, módulo M3, score 85, ativo
Estudante 2: Valentina, valentina@email.com, módulo M4, score 97, ativo
Estudante 3: Osvaldo, osvaldo@email.com, módulo M5, score 65, inativo
*/

INSERT INTO students ("name", "email", "module", "score", "active") 
VALUES ('Enzo', 'enzo@email.com', 'M3', 85, TRUE),
('Valentina', 'valentina@email.com', 'M4', 97, TRUE),
('Osvaldo', 'osvaldo@email.com', 'M5', 65, FALSE)
RETURNING *;

SELECT * FROM students WHERE score > 79;

SELECT * FROM students WHERE active = FALSE;

UPDATE students SET active = TRUE WHERE id = 3 RETURNING *;

DELETE FROM students WHERE id = 1;