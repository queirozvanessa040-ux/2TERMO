-- Active: 1788435080880@@127.0.0.1@3306@smartcoffe_dml_vanessa
-- DQL - DATA QUERY LANGUAGE (LINGUAGEM DE CONSULTA DE DADOS)
-- ANTES DE INICIAR

INSERT INTO cliente (nome, email, telefone, cidade, ativo) VALUES
('Ana Flávia', 'anaf@email.com', '199984512456', 'Campinas', TRUE);

-- EX1 1: SELECT SIMPLES OU CONSULTA SIMPLES
-- ESTRUTURA SELECT COMO EXEMPLO
-- SELECT coluna
-- FROM tabela;

SELECT *
FROM cliente;
-- CONSULTAR TODAS AS COLUNAS

SELECT nome, telefone
FROM cliente;
-- CONSULTAR COLUNAS ESPECIFICAS

--  EX2: AS COMO APELIDO OU UM NOVO NOME PARA COLUNAS
SELECT nome AS Nome_Cliente
FROM cliente;

SELECT email AS Email_Cliente, telefone AS Zap
FROM cliente;

--  EX 3: DISTINCT - ELIMINANDO REPETIÇÕES
SELECT DISTINCT cidade
FROM cliente;

-- SEM DISTINCT O RESULTADO IRÁ SE RPETIR MAIS VEZES.
-- COM O DISTINCT O RESULTADO IRÁ APARECER UMA VEZ

--  EX 4: WHERE - FILTRO POR REGISTROS
--  IREMOS DEFINIR CONDIÇÕES

-- = IGUAL
-- <> ou != DIFERNTE
-- > MAIOR OU IGUAL
-- < MENOR QUE
-- <= MENOR IGUAL

SELECT nome, preco
FROM produto
WHERE preco > 10.00;
-- CONSULTA PARA VALORES ACIMA DE 10.00 REAIS

SELECT nome, preco, ativo AS STATUS
FROM produto
WHERE ativo = TRUE;
-- CONSULTA STATUS DE CLIENTES SE ESTÁ ATIVO OU INATIVO

SELECT id_pedido, data_pedido, valor_total
FROM pedido
WHERE valor_total >= 5.00;
-- CONSULTA PEDIDOS ACIMA DE DETERMINADO VALOR

--  EX 5: USO DO AND, OR E NOT
--  AND TODAS AS CONDIÇÕES VERDADEIRAS

SELECT nome, preco
FROM produto
WHERE preco >8.00 AND preco <= 25.00;

--  OR PELO MENOS UMA CONDIÇÃO VERDADEIRA
SELECT nome, cidade
FROM cliente
WHERE cidade = 'Limeira' OR cidade = 'Piracicaba';

-- NOT NÃO IRÁ BUSCAR OU CONSULTAR O VALOR DESEJADO

SELECT nome, cidade
FROM cliente
WHERE NOT cidade = 'Limeira';

-- EXTRA - UTILIZANDO AND E OR JUNTOS SEPARAR POR ()
SELECT nome, cidade, ativo
FROM cliente
WHERE ativo = TRUE
AND (cidade = 'Limeira' OR cidade = 'Piracicaba');

-- EX 6: BETWEEN - ENTRE DOIS VALORES
-- LIMITE INCIAL E FINAL

SELECT nome, preco
FROM produto
WHERE preco BETWEEN 8.00 AND 15.00;
-- CONSULTA POR VALORES ENTRE 8 E 15

SELECT id_pedido, data_pedido, valor_total
FROM pedido
WHERE data_pedido BETWEEN '2026-09-01 00.00.00' AND '2026-09-30 23:59:59'
-- CONSULTA POR INTERVALO DE DATAS

-- EX 7: IN VÁRIAS POSSIBILIADES
SELECT nome, cidade
FROM cliente
WHERE cidade IN ('Limeira', 'Campinas', 'Americana', 'Piracicaba')
--  CONSULTA COM VÁRIAS CONDIÇÕES E DIMINUINDO O USO DE OR

SELECT nome, cidade
FROM cliente
WHERE cidade NOT IN ('Limeira', 'Piracicaba');
-- CONSULTA COM EXCESSÃO DOS VALORES ESPECIFICADOS

-- EX 8: LIKE - PESQUIAR POR TEXTOS
-- CORINGAS
-- % VÁRIOS CARACTERES
--  _ EXATAMENTE UM CARACTER

SELECT nome
FROM produto
WHERE nome LIKE 'Café%';
--  CONSULTA TODOS OS PRODUTOS QUE COMEÇAM COM A PALAVRA DESEJADA

SELECT nome 
FROM produto
WHERE nome LIKE '%chcocolate%';
-- CONSULTAR TODOS OS PRODUTOS QUE POSSUAM A PALAVRA DESEJADA

SELECT nome
FROM cliente
WHERE nome LIKE '%Silva';
-- CINSULTA TODOS OS CLIENTES QUE TERMINAM COM A PALAVRA DESEJADA

SELECT nome
FROM cliente
WHERE nome LIKE '%Si_va';
-- CONSULTA ESPECIFICAMENTE O CARATER QUE NÃO SE LEMBRA

-- EX 9: NULL - AUSÊNCIA DE VALORES
SELECT nome, telefone
FROM cliente
WHERE telefone IS NULL;

SELECT nome, telefone
FROM cliente
WHERE telefone IS NOT NULL;
-- CONSULTA CAMPOS QUE NÃO SÃO MAIS NULL

--  EX 10: ORDER BY - ORDENANDO RESULTADOS
-- ASC CRESCENTE
-- DESC DECRESCENTE
SELECT nome, preco 
FROM produto
ORDER BY preco ASC;
-- CONSULTAR DADOS DE FORMA CRESCENTE

SELECT nome, preco 
FROM produto
ORDER BY preco DESC;
-- CONSULTAR DADOS DE FORMA DECRESCENTE

SELECT cidade, nome 
FROM cliente
ORDER BY cidade ASC, nome DESC;
--  CONSULTA POR MAIS DE UMA COLUNA

-- EX 11: LIMIT - LIMITAR QUANTIDADE DE LINHAS
SELECT nome, preco 
FROM produto
ORDER BY preco DESC
LIMIT 2;
-- CONSULTAR APENAS UMA QUANTIDADE ESPECIFICA DE LINHAS

SELECT nome, preco 
FROM produto
ORDER BY nome
LIMIT 5 OFFSET 5;
-- CONSULTAR COM LIMITE DE VALORES E LINHAS

-- EX 12: CÁLCULO DE COLUNAS
SELECT nome, preco, preco * 1.10 AS preco_ajustado
FROM produto;

SELECT id_item, quantidade, preco_unitario, quantidade * preco_unitario AS Sub_Total
FROM item_pedido;

-- EX 13: FUNÇÕES PARA CONSULTAS
-- TEXTOS
SELECT UPPER(nome) AS Nome_CLiente, LOWER(email) AS Email_Cliente
FROM cliente;

SELECT CONCAT(nome, ' --- ', cidade) AS Cidade_Cliente
FROM cliente;
-- CONCAT concatenação de valores

-- NÚMEROS
SELECT nome, preco, ROUND(preco * 0.90, 2) AS Preco_Desconto
FROM produto;

-- DATAS
SELECT id_pedido, data_pedido, DATE(data_pedido) AS Datas, MONTH
(data_pedido) AS Mês, YEAR(data_pedido) AS Ano , DAY(data_pedido) AS Dia,
TIME(data_pedido) AS Horário
FROM pedido;

-- COALESCE - SUBSTITUIR A INFORMAÇÃO QUE DEIXAMOS EM NULL OU NÃO DEIXAMOS
SELECT nome, COALESCE(telefone, 'Não Informado') AS telefone
FROM cliente;

