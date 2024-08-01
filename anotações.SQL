
	USE Loja_Trevin;
    
    CREATE TABLE IF NOT EXISTS clientes (    
        id_cliente INT PRIMARY KEY,    
        nome VARCHAR(100),
        email VARCHAR(100)
    );
    
        CREATE TABLE IF NOT EXISTS pedidos (    
        id_pedido INT PRIMARY KEY,    
        descricao VARCHAR(200),
        valor DECIMAL(10,2),
        id_cliente INT,
        FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
    );

    Use loja_Trevin
	INSERT IGNORE INTO clientes (id_cliente, nome, email) VALUES
    (1, 'João Silva', 'joao@bitchass.com'),
    (2, 'Maria Oliveira', 'maria@bitchass.com'),
    (3, 'Pedro Santos', 'pedro@bichass.com'),
    (4, 'Gustavo Henrique', 'gustavo.traimo@gmail.com');
    
    INSERT IGNORE INTO pedidos (id_pedido, descricao, valor, id_cliente) VALUES
    (101, 'Compra de móveis', 1500.00, 1),
    (102, 'Pedido de eletrônicos', 2500.50, 2),
    (103, 'Serviços de instalação', 500.75, 3),
    (105, 'Incomenda de sapatos', 225, 4)



-- altera uma tabela para adicionar uma coluna
ALTER TABLE lojaClientes
ADD COLUMN telefone varchar(15);



INSERT IGNORE INTO clientes (id_cliente, Nome, Endereço, Telefone) VALUES 
(1, 'Ana Silva', 'Rua Almires, 123', '99218-2749'),
(2, 'Bruno Souza', 'Rua Barbados, 456', '94738-7473'),
(3, 'Carlos Pereira', 'Rua Cascapos, 789', '94820-5824'),
(4, 'Daniel Frigueredo', 'Rua Damires Alto, 914', '9483-8343');

INSERT IGNORE INTO Emprestimos (idLivro, id_cliente, data_emprestimo, data_devolução,) VALUES
(1, 2, 2019/02/12, 2023/30/10),
(2, 4, 2023/29/06, 2022/12/09),
(3, 1, 2022/19/02, 2023/12/12),
(4, 1, 2024/22/03, 2022/19/09);

INSERT IGNORE INTO livros (titulo, genero, autorId, anopublicaçao) VALUES
('Teorias Politicas são Histórias de Fantasia', 'politica', 2, 2002),
('A Evolução Humana', 'sciencia', 3, 2020),
('Definição e Realidade', 'filosofia', 4, 2023),
('O Reino Dourado', 'fantasia', 1, 2019);


ALTER TABLE clientes RENAME TO Clientes;

SELECT email_cliente from Clientes where id_cliente 2
SELECT email_cliente from Clientes where id_cliente IN (1,3,4)
SELECT id_cliente, nome, email_cliente from Clientes order by nome asc; -- ou desc

SELECT nome
from Clientes
where

-- consulta com limite de resultados
SELECT id_cliente, nome, email_cliente
from Clientes
limit 3;

--consulta de valores unicos
SELECT distinct email_cliente
from Clientes;

CREATE TABLE Pedidos (
    idPedido INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    numeroPedido varchar(50),
    valorTotal DECIMAL(10, 2),
    dataPedido date,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);



SELECT sum() -- faz a soma dos itens da coluna
SELECT med() -- calcula a media "    '     "
SELECT max() -- encontra o iten com o numero mais alto em ordem alfabética
SELECT min() -- encontra o pedido mais baixo em ordem alfabética

--CONSULTA COM JUNÇÃO DE TABELAS

SELECT Clientes.id_cliente, Clientes.nnome, Clientes.email, Pedidos.numeroPedido
from Clientes
inner join Pedidos on Clientes.id_cliente = Pedidos.id_cliente;

SELECT Clientes.id_cliente, Clientes.nome, Pedidos.numeroPedido, Pedidos.valorTotal
from Clientes
inner join Pedidos on Clientes.id_cliente = Pedidos.id_cliente
where Pedidos.valorTotal > 200;

-- SELECIONA CLIENTES E SEUS PEDIDOS APENAS SE O VALOR TOTAL DO PEDIDO
SELECT Clientes.nome, count(Pedidos.idPedido) AS total_pedidos from Clientes inner join Pedidos on Clientes.id_cliente = Pedidos.id_cliente GROUP BY Clientes.nome;
-- Separa e conta todos os pedidos feitos, o GROUP BY separa os nomes
