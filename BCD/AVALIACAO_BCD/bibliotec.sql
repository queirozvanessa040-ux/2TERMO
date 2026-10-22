-- Active: 1788435080880@@127.0.0.1@3306@biblioteca_som2
-- SISTEMA - GERENCIAMENTE DE BIBLIOTECA

-- FASE 1 - DDL: CRIAÇÃO E ESTRUTURA
DROP DATABASE IF EXISTS biblioteca_som2;

CREATE DATABASE IF NOT EXISTS biblioteca_som2;

USE biblioteca_som2;

CREATE TABLE Usuario (
    Id_Usuario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(120) NOT NULL UNIQUE,
    telefone VARCHAR(20),
    ativo BOOLEAN DEFAULT TRUE
);

CREATE TABLE Livro (
    Id_Livro INT PRIMARY KEY AUTO_INCREMENT,
    Titulo VARCHAR(150) NOT NULL,
    Autor VARCHAR(120) NOT NULL,
    Isbn CHAR(13) NOT NULL UNIQUE,
    Ano_publicacao INT,
    Quantidade_Disponivel INT CHECK (Quantidade_Disponivel >= 0)
);

ALTER TABLE Livro ADD COLUMN Editora VARCHAR(100);

CREATE TABLE Emprestimo (
    Id_Emprestimo INT PRIMARY KEY AUTO_INCREMENT,
    Id_Usuario INT NOT NULL,
    Id_Livro INT NOT NULL,
    Data_Emprestimo DATETIME DEFAULT CURRENT_TIMESTAMP,
    Data_Prevista DATE NOT NULL,
    Data_Devolucao DATE,
    Status_Emprestimo VARCHAR(20) DEFAULT 'ABERTO' CHECK (Status_Emprestimo IN ('ABERTO', 'DEVOLVIDO', 'ATRASADO')),
    
    CONSTRAINT fk_Emprestimo_Usuario FOREIGN KEY (Id_Usuario) REFERENCES Usuario (Id_Usuario) ON DELETE RESTRICT,
    CONSTRAINT fk_Emprestimo_Livro FOREIGN KEY (Id_Livro) REFERENCES Livro (Id_Livro) ON DELETE RESTRICT
);

-- FASE 2 - DML: MANIPULAÇÃO DE DADOS
INSERT INTO Usuario (nome, email, telefone, ativo) VALUES
('Marilia Rita','marilrita@email', '19999123456', TRUE),
('Ricardo Moreira', 'ricardo@email', '19999789012', TRUE),
('Anasthacia Silva', 'nastachia@email', '19999345678', TRUE),
('Guilherme Anjos', 'guilherme@email', NULL, TRUE);

INSERT INTO Livro (titulo, autor, Isbn, Ano_publicacao, Quantidade_Disponivel, Editora) VALUES 
('Percy Jackson (O Ladrão de Raios)', 'Rick Riordan', '9788580575392', 2005, 30, 'Intrínseca'),
('Diários do Vampiro (O Despertar - Vol. 1)', 'L. J. Smith', '9788501086150', 1991, 27, 'Galera Record'),
('Diário de um Banana 1', 'Jeff Kinney', '9788576831303', 2007, 16, 'V&R'),
('Shadowhunters (Cidade dos Ossos - Vol. 1)', 'Cassandra Clare', '9788501087140', 2007, 45, 'Galera Record'),
('A Hipótese do Amor', 'Ali Hazelwood', '9786555653304', 2021, 9, 'Arqueiro'),
('It: A Coisa', 'Stephen King', '9788560280940', 1986, 20, 'Suma');

INSERT INTO Emprestimo (Id_Usuario, Id_Livro, Data_Prevista, Status_Emprestimo) VALUES
(1, 1, '2026-11-05', 'ABERTO'),
(2, 5, '2026-11-05', 'ABERTO'), 
(3, 3, '2026-11-05', 'ATRASADO');


SELECT * FROM Usuario WHERE nome LIKE '%Guilherme Anjos%';
UPDATE usuario
SET telefone = '19999901234'
WHERE nome = 'Guilherme Anjos';

UPDATE Livro 
SET Quantidade_Disponivel = Quantidade_Disponivel + 2 
WHERE Ano_publicacao >= 2020;

INSERT INTO Usuario (nome, email, telefone, ativo) VALUES ('Usuario Teste', 'teste@email.com', '19999999999', TRUE);
DELETE FROM Usuario WHERE email = 'teste@email.com';

-- FASE 3 - DQL: CONSULTE E ANÁLISE

SELECT Titulo, Autor, Quantidade_Disponivel
FROM Livro;

SELECT * 
FROM Livro 
WHERE Quantidade_Disponivel > 2 
ORDER BY Quantidade_Disponivel DESC;

SELECT *
FROM Livro  
WHERE Titulo LIKE '%Diário%';

SELECT *
FROM Livro 
WHERE Ano_publicacao BETWEEN 2015 AND 2025;

SELECT
    COUNT(*) AS Total_Livros,
    SUM(Quantidade_Disponivel) AS Total_Estoque,
    AVG(Quantidade_Disponivel) AS Media,
    MIN(Quantidade_Disponivel) AS Menor_Estoque,
    MAX(Quantidade_Disponivel) AS Maior_Estoque
FROM Livro;

SELECT
    E.Id_Emprestimo,
    U.nome AS Nome_Usuario,
    L.Titulo AS Titulo_Livro,
    E.Data_Emprestimo,
    E.Status_Emprestimo
FROM Emprestimo E
INNER JOIN Usuario U ON E.Id_Usuario = U.Id_Usuario
INNER JOIN Livro L ON E.Id_Livro = L.Id_Livro;

SELECT
    E.Id_Emprestimo,
    U.nome AS Nome_Usuario,
    L.Titulo AS Titulo_Livro,
    E.Data_Emprestimo,
    E.Status_Emprestimo
FROM Emprestimo E
INNER JOIN Usuario U ON E.Id_Usuario = U.Id_Usuario
INNER JOIN Livro L ON E.Id_Livro = L.Id_Livro
WHERE E.Status_Emprestimo = 'ABERTO';

SELECT 
    U.nome AS Nome_Usuario,
    COUNT(E.Id_Emprestimo) AS Total_Emprestimos
FROM Emprestimo E
INNER JOIN Usuario U ON E.Id_Usuario = U.Id_Usuario
GROUP BY U.Id_Usuario, U.nome
ORDER BY Total_Emprestimos DESC;

SELECT 
    U.nome AS Nome_Usuario,
    COUNT(E.Id_Emprestimo) AS Total_Emprestimos
FROM Usuario U
LEFT JOIN Emprestimo E ON U.Id_Usuario = E.Id_Usuario
GROUP BY U.Id_Usuario, U.nome
ORDER BY Total_Emprestimos DESC;

-- FASE 4 - TCL, TRANSAÇÕES E INTEGRIDADE
START TRANSACTION;
INSERT INTO Emprestimo (Id_Usuario, Id_Livro, Data_Prevista, Status_Emprestimo) 
VALUES (4, 2, '2026-11-15', 'ABERTO');
UPDATE Livro 
SET Quantidade_Disponivel = Quantidade_Disponivel - 1 
WHERE Id_Livro = 2;
SELECT * FROM Emprestimo WHERE Id_Emprestimo = 4;
SELECT * FROM Livro WHERE Id_Livro = 2;
COMMIT;

START TRANSACTION;
UPDATE Livro 
SET Quantidade_Disponivel = 99
WHERE Id_Livro = 2;
SELECT * FROM Livro WHERE Id_Livro = 1;
ROLLBACK;

START TRANSACTION;
UPDATE Livro
SET Titulo = 'O Mar dos Monstros',
    Quantidade_Disponivel = 20;
SELECT * FROM Livro WHERE Id_Livro = 1;
SELECT * FROM Livro WHERE Id_Livro = 3;


-- 24 Não feita :')

START TRANSACTION;






START TRANSACTION;


-- DESAFIO FINAL

-- Constraint.
-- Constraint.
-- Constraint.
-- Integridade Referencial.
-- Integridade Referencial.
-- Transação.
-- Regra da Aplicação.
















































