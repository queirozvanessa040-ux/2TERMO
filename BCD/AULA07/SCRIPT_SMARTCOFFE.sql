-- Geração de Modelo físico
-- Sql ANSI 2003

CREATE DATABASE IF NOT EXISTS smartcoffee;
USE smartcoffee;

CREATE TABLE Item_Pedido (
    quantidade INT,
    Id_Produtos INT NOT NULL,
    Id_Pedidos INT NOT NULL,
    preco_historico DECIMAL(10,2)
); 

CREATE TABLE Produtos (
    Id_Produtos INT AUTO_INCREMENT PRIMARY KEY, 
    Nome VARCHAR(32),
    Preco_Unitario DECIMAL(10,2),
    Tamanho_Volume INT,
    Descricao VARCHAR(60),
    Disponivel VARCHAR(25),
    Categoria VARCHAR(60)
);

CREATE TABLE Categoria (
    Id_Categoria INT AUTO_INCREMENT PRIMARY KEY,
    Nome_Categoria VARCHAR(32),
    Descricao VARCHAR(60),
    Setor_Preparo VARCHAR(45),
    Exibir_Menu VARCHAR(60),
    Ordem_Exibicao VARCHAR(45)
);

CREATE TABLE Estoque (
    Id_Insumo INT AUTO_INCREMENT PRIMARY KEY,
    Nome_Insumo VARCHAR(32),
    Quantidade_Atual INT,
    Unidade_Medida FLOAT,
    Estoque_Minimo INT,
    Data_Validade DATETIME,
    Quantidade_Minima INT
);

CREATE TABLE Fornecedor (
    Id_Fornecedor INT AUTO_INCREMENT PRIMARY KEY,
    Razao_Social VARCHAR(45),
    CNPJ VARCHAR(15),
    Telefone_Contatos VARCHAR(14),
    Email_Vendas VARCHAR(25)
);

CREATE TABLE Funcionario (
    Id_Funcionario INT AUTO_INCREMENT,
    Nome VARCHAR(35),
    Cargo VARCHAR(45),
    Turno CHAR(7),
    Data_Admissao DATETIME,
    CPF VARCHAR(14) NOT NULL UNIQUE,
    Cargo_Secundario VARCHAR(25), 
    Salario DECIMAL(10,2),
    Data_Admissao_Secundaria DATETIME, 
    PRIMARY KEY(Id_Funcionario, CPF)
);

CREATE TABLE Delivery (
    Id_Delivery INT AUTO_INCREMENT PRIMARY KEY,
    Endereco_Entrega VARCHAR(60),
    Taxa_Entrega CHAR(15),
    Nome_Fornecedor VARCHAR(35),
    Status_Entrega CHAR(15),
    Tempo_Estimado DATETIME,
    Data_Hora_Saida DATETIME,
    Id_Pedidos INT NOT NULL
);


CREATE TABLE Clientes_Programa_Fidelidade (
    Id_Cliente INT AUTO_INCREMENT,
    Nome VARCHAR(35) NOT NULL,
    CPF INT NOT NULL,
    Telefone VARCHAR(14),
    Email VARCHAR(35) NOT NULL UNIQUE,
    Data_Nascimento DATE,
    Data_Cadastro DATETIME,
    Id_Fidelidade INT NOT NULL, 
    Saldo_Pontos INT,
    Nivel_Cliente VARCHAR(25),
    Total_Acumulado INT,
    Data_Ultimo_Atualizacao DATETIME,
    Cashback_Disponivel INT,
    PRIMARY KEY(Id_Cliente, Id_Fidelidade)
);

CREATE TABLE Pedidos (
    Id_Pedidos INT AUTO_INCREMENT PRIMARY KEY,
    Tipo_Ambiente VARCHAR(35),
    Valor_Total DECIMAL(10,2),
    Observacoes VARCHAR(70),
    Data_Hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
    Status VARCHAR(7),
    Presencial VARCHAR(15),
    Delivery VARCHAR(25),
    Id_Pagamento INT NOT NULL
);

CREATE TABLE Pagamento (
    Id_Pagamento INT AUTO_INCREMENT PRIMARY KEY,
    Valor_Pago DECIMAL(10,2),
    Data_Hora_Pagamento DATETIME,
    Status_Pagamento CHAR(15),
    Codigo_Autorizacao VARCHAR(15),
    Dinheiro DECIMAL(10,2),
    Cartao DECIMAL(10,2),
    Pix DECIMAL(10,2)
);

CREATE TABLE Entrega (
    Id_Delivery INT NOT NULL,
    Id_Funcionario INT NOT NULL,
    CPF CHAR(14) NOT NULL UNIQUE
);

CREATE TABLE Atende (
    Id_Pedidos INT NOT NULL,
    Id_Funcionario INT NOT NULL,
    CPF VARCHAR(14) NOT NULL UNIQUE
);

CREATE TABLE Realiza (
    Id_Pedidos INT NOT NULL,
    Id_Cliente INT NOT NULL,
    CPF VARCHAR(14) NOT NULL UNIQUE
);

CREATE TABLE Consome (
    Id_Insumo INT NOT NULL,
    Id_Produtos INT NOT NULL
);

CREATE TABLE Ficha_Tecnica ( 
    quantidade_gasta VARCHAR(60),
    Id_Insumo INT NOT NULL,
    Id_Produtos INT NOT NULL
);

CREATE TABLE Contem ( 
    Id_Pedidos INT NOT NULL,
    Id_Produtos INT NOT NULL
);
