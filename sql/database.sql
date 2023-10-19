CREATE DATABASE m4_employees;

CREATE TABLE employees (
    "id" SERIAL PRIMARY KEY,
    "name" VARCHAR(200) NOT NULL,
    "email" VARCHAR(200) NOT NULL
);

CREATE TABLE contracts (
    "id" SERIAL PRIMARY KEY,
    "startedAt" DATE NOT NULL,
    "expiresAt" DATE NOT NULL,
    "employeeId" INTEGER UNIQUE NOT NULL,
    FOREIGN KEY ("employeeId") REFERENCES employees("id") ON DELETE CASCADE
);

CREATE TABLE skills (
    "id" SERIAL PRIMARY KEY,
    "name" VARCHAR(100) NOT NULL,
    "employeeId" INTEGER NOT NULL,
    FOREIGN KEY ("employeeId") REFERENCES employees("id") ON DELETE CASCADE
);

INSERT INTO employees ("name", "email") VALUES ('Alex', 'alex@email.com') RETURNING *;

INSERT INTO contracts ("startedAt", "expiresAt", "employeeId") 
VALUES ('2023-10-19', '2028-10-19', 1);

INSERT INTO contracts ("startedAt", "expiresAt", "employeeId") 
VALUES ('2023-10-19', '2028-10-19', 2);

INSERT INTO skills ("name", "employeeId") VALUES
('React', 1), ('Node', 1), ('SQL', 1) RETURNING *;

INSERT INTO skills ("name", "employeeId") VALUES
('React', 2);