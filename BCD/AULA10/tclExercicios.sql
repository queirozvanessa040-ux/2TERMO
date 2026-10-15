-- Active: 1788435080880@@127.0.0.1@3306@smartcoffe_dml_vanessa
-- ATIVIDADE PRATICA - AULA 10
-- Aluno(a): Vanessa Queiroz da Silva
-- Regra: valide sempre antes de COMMIT.

-- 01. Consulte produto 2 e seu preço.
SELECT * FROM produto
WHERE id_produto = 2;

-- 02. START TRANSACTION e aumente produto 2 em R$3,00.
START TRANSACTION;
UPDATE produto
SET preco = preco * 3.00
WHERE id_produto = 2;

ROLLBACK;
SELECT * FROM produto;

-- 03. Consulte dentro da transação.
START TRANSACTION;
UPDATE produto SET preco = 12.50
WHERE id_produto = 2;

SELECT * FROM produto WHERE id_produto = 2;

-- 04. ROLLBACK.
--  O ROLLBACK defaz as alterações das transações atuais.

-- 05. Consulte e comprove retorno.
START TRANSACTION;
UPDATE produto SET preco = 999.99 WHERE id_produto = 2;
ROLLBACK;
SELECT id_produto, preco FROM produto WHERE id_produto = 2;

-- 06. Repita a alteração e finalize com COMMIT.
START TRANSACTION;
UPDATE produto SET preco = 999.99 WHERE id_produto = 2;
ROLLBACK;
SELECT id_produto, preco FROM produto WHERE id_produto = 2;
COMMIT;

-- 07. START TRANSACTION e aumente produto 3 em 10%.
START TRANSACTION;
UPDATE produto
SET preco = preco * 1.10
WHERE id_produto = 3;

-- 08. SAVEPOINT ajuste_produto3.
START TRANSACTION;
UPDATE produto
SET preco = preco * 1.50
WHERE id_produto = 4

SAVEPOINT ajuste_produto3;

-- 09. Aumente produto 4 em 50%.
START TRANSACTION;
UPDATE produto
SET preco = preco * 1.50
WHERE id_produto = 4;

-- 10. Consulte os dois.
SELECT * FROM produto WHERE id_produto IN (3, 4);

-- 11. ROLLBACK TO SAVEPOINT ajuste_produto3.
START TRANSACTION;
UPDATE produto
SET preco = preco * 1.50
WHERE id_produto = 4

SAVEPOINT ajuste_produto3;
ROLLBACK TO SAVEPOINT ajuste_produto3;
COMMIT;

-- 12. COMMIT e explique em comentário qual alteração permaneceu.
-- Ao dar commit, fez o valor ser confirmado.

-- 13. START TRANSACTION.
--  Significa começar transição.

-- 14. Crie pedido para cliente 1 e salve o id em @novo_pedido.
START TRANSACTION;
INSERT INTO pedido (data_pedido, status, valor_total, id_cliente)
VALUES (NOW(), 'FINALIZADO', 0.00, 1);

SET @novo_pedido = LAST_INSERT_ID();
SELECT * FROM pedido;
COMMIT;

-- 15. Insira dois itens válidos.
INSERT INTO item_pedido (id_pedido, id_produto, quantidade, preco_unitario)
VALUES (@novo_pedido, 1, 2, 7.50), (@novo_pedido, 2, 1, 8.50); 

-- 16. Registre pagamento válido.
INSERT INTO pagamento (id_pedido, id_forma_pagamento, valor, data_pagamento)
VALUES (@novo_pedido, 23.50, 1);

-- 17. Consulte pedido, itens e pagamento.
SELECT * FROM pedido WHERE id_pedido = @novo_pedido;
SELECT * FROM item_pedido WHERE id_pedido = @novo_pedido;
SELECT * FROM pagamento WHERE id_pedido = @novo_pedido;

-- 18. COMMIT.
-- Confirma as alterações feitas.


-- 19. START TRANSACTION e crie pedido para cliente 2.

-- 20. Salve o id em @pedido_com_erro.

-- 21. Tente inserir item com id_produto inexistente.

-- 22. Após observar a FK, ROLLBACK.

-- 23. Consulte @pedido_com_erro e comprove que não permaneceu.

-- 24. Tente excluir uma categoria que possui produtos.
-- Explique em comentário por que foi bloqueado.

-- 25. Crie em uma transação um pedido temporário com dois itens,
-- exclua o pedido e observe ON DELETE CASCADE.
-- Finalize com ROLLBACK para preservar a base.

-- DESAFIO EXTRA - CAIXA DO SMARTCOFFEE
-- Em UMA transação:
-- a) pedido; b) 3 itens; c) baixa de estoque;
-- d) SAVEPOINT; e) pagamento; f) status FINALIZADO;
-- g) consultas; h) COMMIT.