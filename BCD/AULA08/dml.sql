-- BANCO DE DADOS - SMARTCOFFE - DML

DROP DATABASE IF EXISTS SMARTCOFFE_DML_VANESSA;

CREATE DATABASE IF NOT EXISTS SMARTCOFFE_DML_VANESSA;

USE SMARTCOFFE_DML_VANESSA;

CREATE TABLE cliente (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(120) UNIQUE,
    telefone VARCHAR(15),
    cidade VARCHAR(60) NOT NULL,
    ativo BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE categoria (
    id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(60) NOT NULL UNIQUE
);

CREATE TABLE produto (
    id_produto INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    ativo BOOLEAN NOT NULL DEFAULT TRUE,
    id_categoria INT NOT NULL,
    CONSTRAINT fk_produto_categoria FOREIGN KEY(id_categoria)
    REFERENCES categoria (id_categoria)
);

CREATE TABLE pedido (
    id_pedido INT PRIMARY KEY AUTO_INCREMENT,
    data_pedido DATETIME NOT NULL,
    status ENUM('ABERTO', 'PREPARANDO', 'FINALIZADO', 'CANCELADO') NOT NULL,
    valor_total DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    id_cliente INT NOT NULL,
    CONSTRAINT fk_pedido_cliente FOREIGN KEY (id_cliente)
    REFERENCES cliente(id_cliente)
);

CREATE TABLE item_pedido (
    id_item INT PRIMARY KEY AUTO_INCREMENT,
    id_pedido INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10,2) NOT NULL,
    observacao VARCHAR(150),
    CONSTRAINT fk_item_pedido FOREIGN KEY (id_pedido)
    REFERENCES pedido (id_pedido),
    CONSTRAINT fk_item_produto FOREIGN KEY (id_produto)
    REFERENCES produto (id_produto)
);

CREATE TABLE forma_pagamento (
    id_forma_pagamento INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(40) NOT NULL UNIQUE
);

CREATE TABLE pagamento (
    id_pagamento INT PRIMARY KEY AUTO_INCREMENT,
    id_pedido INT NOT NULL,
    id_forma_pagamento INT NOT NULL,
    valor DECIMAL(10,2) NOT NULL,
    data_pagamento DATETIME,
    CONSTRAINT fk_pagamento_pedido FOREIGN KEY (id_pedido)
    REFERENCES pedido (id_pedido),
    CONSTRAINT fk_pagamento_forma_pagamento FOREIGN KEY (id_forma_pagamento) 
    REFERENCES forma_pagamento (id_forma_pagamento)
);

-- INSERINDO DADOS NO BD --

INSERT INTO cliente (nome, email, telefone, cidade, ativo) VALUES
('Luiz Felipe', 'luiz@email', '199999999999901', 'Limeira', TRUE),
('Maria Eduarda', 'maria@email.com', '19999999999902', 'Limeira', TRUE),
('Mateus Silva', 'mateus@email.com', '199999999999903', 'Limeira', TRUE),
('Matheus Silva', 'matheus@email.com', '199999999999904', 'Limeira', TRUE),
('Nicolas Filipe', 'nicolas@email.com', '199999999999905', 'Limeira', TRUE),
('Otavio Correia', 'otavio@email.com', '199999999999906', 'Conchal', TRUE),
('Pedro Miranda', 'pedro@email.com', '199999999999907', 'Limeira', TRUE),
('Rafael Viera', 'rafael@email.com', NULL, 'Limeira', TRUE),
('Rebecca', 'rebecca@email.com', NULL, 'Limeira', TRUE),
('Rennan Campos', 'rennan@email.com', '199999999999908', 'Americana', TRUE),
('Samira Emly Dalosto', 'samira@email.com', '199999999999909', 'Limeira', TRUE),
('Sophia Carolina', 'sophia@email.com', '199999999999910', 'Limeira', TRUE),
('Stefany Santana', 'stefany@email.com', '199999999999911', 'Campinas', FALSE),
('Vanessa Queiroz', 'vanessa@email.com', '199999999999912', 'Limeira', TRUE),
('Vinicius Henrique', 'vincius@email.com', '199999999999913', 'Limeira', TRUE),
('Vinicius Oliveira', 'viniciusO@email.com', '199999999999914', 'Chicago', TRUE);

INSERT INTO categoria (nome) VALUES
('Café'),('Bebidas Quentes'),('Bebidas Geladas'),('Doces'),('Salgados'),('Combo');

INSERT INTO produto (nome, preco, ativo, id_categoria) VALUES
('Café com Leite', 6.50, TRUE, 1),
('Chocolate Quente', 7.00, TRUE, 2),
('Suco de Maracuja', 7.50, TRUE, 3),
('Bolo de Cenoura', 7.50, TRUE, 4),
('Empada de Frango', 6.50, TRUE, 5);

INSERT INTO pedido (data_pedido, status, valor_total, id_cliente) VALUES 
(NOW(), 'ABERTO', 6.50, 1),
(NOW(), 'CANCELADO', 7.50, 3),
(NOW(), 'PREPARANDO', 7.00, 2),
(NOW(), 'FINALIZADO', 7.50, 4),
(NOW(), 'ABERTO', 6.50, 5);

INSERT INTO item_pedido 
(id_pedido, id_produto, quantidade, preco_unitario, observacao) VALUES
(1, 1, 1, 6.50, 'Sem açúcar'),
(2, 3, 3, 7.50, 'Com pouco gelo'),
(3, 2, 4, 7.00, NULL),
(4, 4, 10, 7.50, NULL),
(5, 1, 2, 6.50, 'Bem quente');

INSERT INTO forma_pagamento (descricao) VALUES 
('Dinheiro'),
('Pix'),
('Cartão de Crédito'),
('Cartão de Débito');

INSERT INTO pagamento 
(id_pedido, id_forma_pagamento, valor, data_pagamento) VALUES
(1, 1, 6.50, NOW()),
(2, 2, 7.50, NOW()),
(3, 3, 7.00, NOW()),
(4, 4, 7.50, NOW()),
(5, 1, 6.50, NOW());

---------------------------------------------------
-- EXEMPLO NOVO DE INSERÇÃO DE DADOS PORÉM COM RECUPERAÇÃO DO ÚLTIMO ID
INSERT INTO pedido(data_pedido, status_pedido, valor_total, id_cliente)
VALUES (NOW(), 'ABERTO', 0.00, 1);
SET @pedido = LAST_INSERT_ID();
SELECT @pedido;

----------------------------------------------------

-- ATUALIZÇÕES E MODIFICAÇÕES DE DADOS --
 -- EX 1
UPDATE cliente
SET telefone = '1999988803'
WHERE id_cliente = 9; 

-- EX 2
UPDATE produto
SET preco = 1.00
-- NUNCA REALIZAR UM UPDATE SEM --- WHERE 😧😩😰

-- EX 3
UPDATE cliente
SET telefone = '1997777701',
    cidade = 'Valinhos'
WHERE id_cliente = 11;

-- EX 4: Ajustes de valores
UPDATE produto
SET preco = preco * 1.05
WHERE id_categoria = 1;

-- EX 5: Ajustes de atualizações condicionais
UPDATE produto
SET preco = CASE 
    WHEN preco <= 20 THEN preco * 1.20  
    ELSE  preco * 1.05
END
WHERE ativo = TRUE;

--------------------------------------
-- APAGAR DADOS DO BD

-- EX 1: Apagar um cliente específico
DELETE FROM cliente
WHERE id_cliente = 11;

-- EX 2: Apagar todos os clientes inativos
DELETE FROM cliente
WHERE ativo = FALSE;

-- EX 3: Apagar todos os clientes de uma cidade específica
DELETE FROM cliente
WHERE cidade = 'Chicago';

-- EX 4: Exclusão lógica
UPDATE cliente
SET ativo = FALSE
WHERE id_cliente = 10;

-- DESAFIOS DML
-- PARTE A

-- 1. CADASTRE DOIS NOVOS CLIENTES


-- 2

-- 3

-- 4

-- 5

-- 6



SELECT * FROM produto;

-- TRANSAÇÕES - SEGURANÇA PARA DML --

START TRANSACTION;
UPDATE produto
SET preco = preco * 2.80
WHERE id_categoriA = 1;

SELECT id_produto, nome, preco
FROM produto
WHERE id_categoria = 1;

-- DESFAZ O QUE FIZEMOS ERRADO OU VOLTA UMA TRANSAÇÃO
ROLLBACK;
-- VALIDA O PROCEDIMENTO DE TRANSAÇÃO
COMMIT;

START TRANSACTION;
UPDATE cliente SET cidade = 'Limeira' WHERE id_cliente = 181;
SELECT * FROM cliente WHERE id_cliente = 181;
COMMIT;

-- PROCEDIMENTO DE UMA COMPRA
-- PASSO 1: Cadastrar o cliente
INSERT INTO cliente (nome, email, telefone, cidade, ativo) VALUES (
'Sonia Bernardes', 'sonia.bern@gmail.com', '199999999999915', 'Limeira', TRUE);
SET @cliente_compra = LAST_INSERT_ID();

-- PASSO 2: Criar o pedido para este cliente (FALTAVA ESSE BLOCO!)
INSERT INTO pedido (data_pedido, status, valor_total, id_cliente)
VALUES (NOW(), 'ABERTO', 0.00, @cliente_compra);
SET @pedido_compra = LAST_INSERT_ID(); -- Aqui a variável ganha um valor real!

-- PASSO 3: INSERINDO ITENS (Agora o @pedido_compra não será NULL)
-- Nota: mudei o id_produto de 9 para 5, pois sua tabela só vai até o produto 5.
INSERT INTO item_pedido (id_pedido, id_produto, quantidade, preco_unitario)
VALUES (@pedido_compra, 4, 1, 13.00), (@pedido_compra, 5, 1, 9.00);

-- PASSO 4 - ATUALIZANDO TOTAL E STATUS
UPDATE pedido
SET valor_total = 22.00,
    status = 'PREPARANDO'
WHERE id_pedido = @pedido_compra;

-- PASSO 5 - REGISTRAR PAGAMENTO
INSERT INTO pagamento (id_pedido, id_forma_pagamento, valor, data_pagamento)
VALUES (@pedido_compra, 2, 22.00, NOW());

-- PASSO 6 - CONSULTAR PEDIDO E RESULTADO
SELECT p.id_pedido,
       c.nome AS cliente,
       p.status AS Status Pedido,
       p.valor_total AS Compra_Total
FROM pedido p
JOIN cliente c ON c.id_cliente = p.id_cliente
WHERE p.id_pedido = @pedido_compra;

-- PASSO 7 - RELATÓRIO
SELECT nome FROM cliente WHERE id_cliente = @cliente_compra;
SELECT nome FROM cliente WHERE id_cliente = 181;

-- PASSO 2
SELECT * FROM pedido WHERE id_pedido = @pedido_compra;