-- Active: 1788435080880@@127.0.0.1@3306@desafios_dml_vanessa
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

-- ============================================================
-- AULA 08 - ATIVIDADE PRÁTICA DE DML
-- Nome: _______________________________________________
-- Turma: ______________________ Data: _________________
-- Base: DESAFIOS_DML_VANESSA
-- ============================================================
CREATE DATABASE IF NOT EXISTS DESAFIOS_DML_VANESSA;
USE DESAFIOS_DML_VANESSA;

DROP DATABASE IF EXISTS DESAFIOS_DML_VANESSA;

-- IMPORTANTE:
-- Para toda questão de UPDATE ou DELETE, escreva primeiro um SELECT
-- com o mesmo WHERE para validar os registros afetados.

-- PARTE A - INSERT

-- 1. Cadastre dois novos clientes com dados diferentes.
INSERT INTO cliente (nome, email, telefone, cidade, ativo) VALUES
('Felipe Moreira', 'felipe@email', '199999998899901', 'Limeira', TRUE),
('Janaína Castros', 'janaina@email.com', '1999999988902', 'Santa Barbara', TRUE),
('Mariucia Silva', 'mariucia@email.com', '1999999988903', 'Campinas', TRUE);

-- 2. Cadastre a categoria 'Especiais da Casa'.
INSERT INTO categoria (id_categoria, nome) 
VALUES (3, 'ESPECIAIS DA CASA');

-- 3. Localize o id da categoria criada e cadastre três produtos nela.
-- anotação: SET @categoria_especial = SELECT id_categoria FROM categoria WHERE nome = 'Especiais da Casa');
INSERT INTO produto (nome, preco, ativo, id_categoria) VALUES
('Milkshake de Chocolate', 13.50, TRUE, 3),
('Maria Mole', 4.90, TRUE, 2),
('Empado de Camarão', 12.00, TRUE, 3);

-- UTILIZAR O SET ANTES DA TAREFA AJUDA A ARMAZENAR O VALOR DA DEFINIÇÃO ATRIBUIDA E PODE SER REUTILAZDA DEPOIS.
SET @categoria_especial = (SELECT id_categoria FROM categoria WHERE nome = 'Especiais da Casa');
INSERT INTO produto (nome, preco, ativo, id_categoria) VALUES
('Sorvete Fit', 8.00, TRUE, @categoria_especial);

-- 4. Cadastre um terceiro cliente sem telefone.
INSERT INTO cliente (nome, email, telefone, cidade, ativo) VALUES
('Rui Carlos', 'rui@email', NULL, 'Limeira', TRUE);

-- 5. Crie um novo pedido para um dos clientes cadastrados.
-- INSERT INTO pedido (data_pedido, status, id_cliente) VALUES
-- (NOW(), 'ABERTO', 1);

-- SELECT * FROM pedido;

SET @cliente_atividade = (SELECT id_cliente FROM cliente WHERE email = 'felipe@email');
INSERT INTO pedido (data_pedido, status, valor_total, id_cliente) VALUES
(NOW(), 'ABERTO', 0.00, @cliente_atividade);

SET @pedido_atividade = LAST_INSERT_ID();
INSERT INTO item_pedido (id_pedido, id_produto, quantidade, preco_unitario)
VALUES (@pedido_atividade, 3, 1, 12.00), (@pedido_atividade, 1, 1, 13.50);

-- 6. Use LAST_INSERT_ID() para guardar o id do pedido em @pedido_atividade
--    e insira pelo menos dois itens nesse pedido.
INSERT INTO pedido (data_pedido, status, valor_total, id_cliente) VALUES
(NOW(), 'ABERTO', 0.00, 1);
SET @pedido = LAST_INSERT_ID();
SELECT @pedido;

INSERT INTO item_pedido (id_pedido, id_produto, quantidade, preco_unitario, observacao)
VALUES
(@pedido, 1, 1, 13.50, 'Sem obrigação de chantilly'),
(@pedido, 3, 1, 12.00, 'Com pouco açúcar');

-- PARTE B - UPDATE

-- 7. Corrija o telefone de um dos clientes criados.
-- SELECT de validação:
-- UPDATE:
-- SELECT final:
SELECT * FROM cliente WHERE id_cliente = 3;
UPDATE cliente
SET telefone = '1999999988903'
WHERE id_cliente = 3;

-- 8. Altere cidade e telefone de outro client em um único UPDATE.
UPDATE cliente
SET telefone = '1999999988904',
    cidade = 'Campinas'
WHERE id_cliente = 4;

-- 9. Aumente em 8% o preço dos produtos da categoria 'Especiais da Casa'.
UPDATE produto
SET preco = preco * 1.08
WHERE id_categoria = @categoria_especial;

-- 10. Altere o status do pedido criado para 'PREPARANDO'.
UPDATE pedido
SET status = 'PREPARANDO'
WHERE id_pedido = @pedido_atividade;

-- 11. Atualize valor_total do pedido de acordo com os itens cadastrados.
--     Você pode calcular previamente com SELECT SUM(quantidade * preco_unitario).

-- VERSÃO 1
SELECT SUM(quantidade * preco_unitario) AS valor_total
FROM item_pedido
WHERE id_pedido=@pedido_atividade;

UPDATE pedido
SET valor_total = (SELECT SUM(quantidade * preco_unitario)
FROM item_pedido 
WHERE id_pedido = @pedido_atividade);

UPDATE pedido
SET valor_total = (
    SELECT SUM(quantidade * preco_unitario) 
    FROM item_pedido 
    WHERE id_pedido = @pedido_atividade
)
WHERE id_pedido = @pedido_atividade;

-- 12. Escolha um dos produtos criados e faça uma exclusão lógica (ativo = FALSE).

--UPDATE produto
--SET ativo = FALSE
--WHERE id_produto = 3;

SELECT * FROM produto WHERE nome = 'Croissant Especial';
UPDATE produto SET ativo = FALSE WHERE nome = 'Croissant Especial';
SELECT * FROM produto WHERE nome = 'Croissant Especial';


-- PARTE C - DELETE

-- 13. Crie um cliente de teste sem pedidos.
--     Depois localize e exclua apenas esse cliente.
INSERT INTO cliente (nome, email, telefone, cidade, ativo) VALUES
('Mariucia Silva', 'mariucia@email.com', '1999999988903', 'Campinas', TRUE);

DELETE FROM cliente
WHERE id_cliente = 4;

SELECT * FROM cliente;

--EXEMPLO ABAIXO:
INSERT INTO cliente (nome, email, cidade)
VALUES ('Cliente Temporário', 'temporario.a09@email.com', 'Limeira');

SELECT * FROM cliente WHERE email = 'temporario.a09@email.com';

--DELETE FROM cliente WHERE email = 'temporario.a09@email.com';

SELECT * FROM cliente WHERE email = 'temporario.a09@email.com';
-- 14. Tente excluir um cliente da base original que possua pedidos.
--     Deixe o DELETE comentado após o teste e descreva o erro abaixo.
-- Resultado observado:
DELETE FROM cliente
WHERE id_cliente = 1;
-- RESPOSTA: "Não é possível excluir ou atualizar uma linha pai: uma restrição de chave estrangeira falhou".

-- 15. Explique em comentário por que a FK bloqueou a exclusão.
-- Resposta: Porque o cliente possui dados registrados que são destinados ao cliente. Bloqueando a exclusão para manter o banco de dados intacto.


-- 16. Crie uma categoria temporária chamada 'Excluir Depois' e remova-a.
INSERT INTO categoria (nome) VALUES ('Excluir Depois');



-- PARTE D - INTEGRIDADE E ERROS CONTROLADOS
-- Execute uma tentativa por vez. Depois deixe o comando problemático comentado.
INSERT INTO produto ()

-- 17. Tente inserir um produto com id_categoria = 9999.
-- Qual restrição impediu a operação?


-- 18. Tente cadastrar um cliente usando 'ana@email.com'.
-- Qual restrição impediu a operação?


-- 19. Tente criar um pedido com id_cliente = 9999.
-- Qual restrição impediu a operação?


-- 20. Escreva em comentários a diferença entre os três erros anteriores.
-- RESPOSTA: 1. FK 2. 3.





























-- PARTE D - INTEGRIDADE E ERROS CONTROLADOS

-- 17. Tente inserir um produto com id_categoria = 9999.
-- INSERT INTO produtos (nome, preco, id_categoria) VALUES ('Produto Teste', 10.00, 9999);
-- Qual restrição impediu a operação?
-- RESPOSTA: Chave Estrangeira / Foreign Key (FK). O código da categoria não existe na tabela pai (categorias).


-- 18. Tente cadastrar um cliente usando 'ana@email.com'.
-- INSERT INTO clientes (nome, email) VALUES ('Ana', 'ana@email.com');
-- Qual restrição impediu a operação?
-- RESPOSTA: Chave Única / Restrição de Unicidade (UNIQUE). O e-mail já está cadastrado para outro cliente.


-- 19. Tente criar um pedido com id_cliente = 9999.
-- INSERT INTO pedidos (id_cliente, data_pedido) VALUES (9999, CURRENT_DATE);
-- Qual restrição impediu a operação?
-- RESPOSTA: Chave Estrangeira / Foreign Key (FK). O código do cliente não existe na tabela pai (clientes).


-- 20. Escreva em comentários a diferença entre os três erros anteriores.
-- RESPOSTA: 
-- 1. FK (id_categoria = 9999): Erro de integridade referencial. Impede associar um produto a uma categoria inexistente.
-- 2. UNIQUE (ana@email.com): Erro de duplicidade. Impede a gravação de dados repetidos em uma coluna que exige valores únicos.
-- 3. FK (id_cliente = 9999): Erro de integridade referencial. Impede a criação de um pedido para um cliente inexistente.





-- PARTE E - DESAFIO COMPLETO COM TRANSAÇÃO

-- 21. Inicie uma transação.


-- 22. Dentro dela, cadastre um cliente, um pedido e dois itens relacionados.


-- 23. Faça uma consulta com JOIN comprovando que os registros existem
--     enquanto a transação está aberta.


-- 24. Execute ROLLBACK e depois use SELECT para provar que o cadastro foi desfeito.


-- 25. Repita o processo com novos dados e finalize usando COMMIT.
--     Depois consulte os registros persistidos.


-- DESAFIO EXTRA
-- 26. Escolha uma situação realista do SmartCoffee que exija INSERT + UPDATE
--     ou UPDATE + DELETE lógico. Descreva a regra de negócio e implemente.