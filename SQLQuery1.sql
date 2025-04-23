CREATE DATABASE bd_videolocadora;
USE bd_videolocadora;

CREATE TABLE cliente (
id_cliente int primary key,
nome varchar(100),
cidade varchar(100),
)

create table filme (
idFilme int primary key,
titulo varchar(100),
genero varchar(100),
anoLancamento date,
)

create table locacao (
	idlocacao int primary key,
	idCliente int,
	idFilme int, 
	datalocacao date,
	valor float,
	FOREIGN KEY (idCliente) REFERENCES cliente (id_cliente),
	FOREIGN KEY (idFilme) REFERENCES filme (idFilme),
)

insert into cliente values (1, 'carlos silva', 'São Paulo');
insert into cliente values (2, 'Ana Souza', 'Rio de Janeiro');
insert into cliente values (3, 'Marcos Lima', 'Belo Horizonte');
insert into cliente values (4, 'Fernanda Dias', 'São Paulo');
insert into cliente values (5, 'Rafael Cena', 'Mauá');
insert into cliente values (6, 'Antonio Pedro', 'Santo André');



insert into filme values (1, 'Titanic', 'Romance', '01-01-1997');
insert into filme values (2, 'Matrix', 'Ficção Científica', '01-01-1999');
insert into filme values (3, 'Vingadores', 'Ação', '01-01-2012');
insert into filme values (4, 'Coringa', 'Drama', '01-01-2019');
insert into filme values (5, 'Hacker', 'Ação', '01-01-2012');
insert into filme values (6, 'O jogador 1', 'Ação', '01-01-2015');
insert into filme values (7, 'Pecadores', 'Ação', '01-01-2025');



SELECT * FROM filme
order by anoLancamento desc;


INSERT INTO locacao (idlocacao, idCliente, idFilme, datalocacao, valor) VALUES
(1, 1, 2, '2023-05-01', 5.00),   -- Carlos Silva - Matrix
(2, 1, 3, '2023-05-03', 6.00),   -- Carlos Silva - Vingadores
(3, 2, 1, '2023-05-02', 4.50),   -- Ana Souza - Titanic
(4, 2, 2, '2023-05-04', 5.00),   
(5, 3, 4, '2023-05-01', 6.50),   -- Marcos Lima - Coringa
(6, 4, 2, '2023-05-01', 5.00),   
(7, 4, 4, '2023-05-05', 6.50),   


(8, 1, 5, '2023-05-06', 6.00),   
(9, 2, 6, '2023-05-07', 6.00),   
(10, 3, 7, '2023-05-06', 7.00),  
(11, 4, 1, '2023-05-08', 4.50),  
(12, 1, 6, '2023-05-09', 6.00);  


SELECT c.id_cliente, c.nome, COUNT(l.idCliente) AS total_locacoes
FROM cliente c
JOIN locacao l ON c.id_cliente = l.idCliente
GROUP BY c.id_cliente, c.nome
HAVING COUNT(l.idCliente) > 1;



SELECT 
    cliente.nome AS nome_cliente,
    filme.titulo AS titulo_filme
FROM 
    locacao
JOIN 
    cliente ON locacao.idCliente = id_cliente
JOIN 
    filme ON locacao.idFilme = filme.idFilme;
