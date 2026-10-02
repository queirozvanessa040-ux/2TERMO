-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE Clliente (
Nome_Cliente datetime not null,
Id_Cliente intauto increment PRIMARY KEY,
Id_Pedido intauto increment
);

CREATE TABLE Pedido (
Id_Pedido intauto increment PRIMARY KEY,
Data_Pedido datetime not null
);

CREATE TABLE Estoque+Produto (
Id_Estoque intauto increment,
Quantidade int not null,
Nome_Produto varchar(100),
Id_Produto intauto increment,
PRIMARY KEY(Id_Estoque,Id_Produto)
);

CREATE TABLE FORNECEDOR (
Id_Fornecedor Int Auto_Increment Primary Key PRIMARY KEY,
Razao_Social Varchar(100)
);

CREATE TABLE PRODUTO (
Id_Produto Int Auto_Increment Primary Key PRIMARY KEY,
Nome_Produto Varchar(100)
);

CREATE TABLE Cliente (
CPF Texto(1),
Id_Cliente Int Auto_Increment Primary Key PRIMARY KEY,
Id_Pedido Int Not Null
);

CREATE TABLE Pedido (
Data_Pedido datetime not null,
Id_Pedido Int Auto_Increment Primary Key PRIMARY KEY
);

CREATE TABLE Item_Produto (
Id_Item Int Auto_Increment Primary Key PRIMARY KEY,
Valor Decimal(10,2),
Id_Produto Int Not Null,
Id_Fornecedor Int Not Null
);

ALTER TABLE Clliente ADD FOREIGN KEY(Id_Pedido) REFERENCES Pedido (Id_Pedido)
