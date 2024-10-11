CREATE DATABASE libbsview;


USE libbsview;


CREATE TABLE produtos (
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nome VARCHAR(30),
    quantidade INT,
    preco DECIMAL(10, 2),
    descricao VARCHAR(100)
);


CREATE TABLE clientes (
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nome VARCHAR(30),
    email VARCHAR(100),
    senha VARCHAR(100)
);


CREATE TABLE pedidos(
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    idProduto INT,
    idCliente INT,
    FOREIGN KEY (idProduto) REFERENCES produtos(id),
    FOREIGN KEY (idCliente) REFERENCES clientes(id)
);

INSERT INTO produtos(nome, descricao, preco, quantidade) VALUES
('Coca-cola', 'gelada é bom', 20.000, 3),
('camisa do Sao Paulo', 'seleção', 1500.00, 1),
('g1200', 'randandandan', 1000.00, 7),
('tiger', 'vruuuuuum', 2000.00,3);

INSERT INTO clientes (nome, email, senha) VALUES
('arthur rosa', 'arthur.senaigmail.com', '123'),
('giovani', 'gio.vanni@yahoo.com', '321'),
('samuel', 'samuel@terra','777;');

INSERT INTO pedidos(idProduto, idCliente) VALUES
(1,1),
(2,3),
(3,2);

-- Saber a quantidade total do estoque
SELECT SUM(quantidade) AS QauntidadeTotal FROM produtos;

CREATE VIEW visualizar_total_estoque AS 
SELECT SUM(quantidade) AS QuantidadeTotal FROM produtos;

SELECT * FROM visualizar_total_estoque;



-- CALCULAR FATURAMENTO TOTAL DO ESTOQUE


CREATE VIEW visualizar_total_faturamento AS 
SELECT SUM(preco*quantidade) AS PrecoTotal FROM produtos;
-- WHERE produtos.id = 1

SELECT * FROM visualizar_total_faturamento;

DROP VIEW visualizar_total_faturamento;



-- crie uma consulta que vai selecionar todos os produtos que foram pedidos
-- criar VIEW
SELECT idProduto, produtos.nome
FROM pedidos
INNER JOIN produtos ON pedidos.idProduto = produtos.id;


SELECT p.nome, ped.id
FROM produtos AS p
INNER JOIN pedidos AS ped ON ped.id = ped.idProduto;

-- Professor
SELECT idProduto, produtos.nome
FROM pedidos
INNER JOIN produtos ON pedidos.idProduto = produtos.id;

-- Roger
CREATE VIEW visualizar_pedidos AS 
SELECT nome FROM produtos
INNER JOIN pedidos AS ped ON ped.id = produtos.id;

SELECT * FROM visualizar_pedidos;

DROP VIEW visualizar_pedidos;

-- VISUALIZAR O CLIENTE O PEDIDO E O PRODUTO
-- INNER JOIN -> INNER JOIN
-- CRIAR UMA VIEW
SELECT cli.nome, ped.id, pro.nome
FROM clientes AS cli
INNER JOIN pedidos AS ped ON ped.idcliente = cli.id
INNER JOIN produtos AS pro ON pro.id = ped.idProduto;


CREATE VIEW visualizar_geral AS
SELECT clientes.nome, pedidos.id AS pedidos, produtos.nome AS produto FROM clientes
INNER JOIN pedidos ON pedidos.idcliente = clientes.id
INNER JOIN produtos ON produtos.id = pedidos.idProduto;


SELECT * FROM visualizar_geral;







