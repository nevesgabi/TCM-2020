create database if not exists Tomoe_sushi;

use Tomoe_sushi;

CREATE TABLE if not exists Funcionario (
id_func int PRIMARY KEY auto_increment not null,
nome_func varchar(30),
CPF_func varchar(20),
tel_func int,
funcao_func varchar(50),
endereco_func varchar(80),
usuario_func varchar(30),
senha_func varchar(20),
nivel_acesso_func int
);

CREATE TABLE if not exists Mesa (
id_mesa int PRIMARY KEY auto_increment not null,
num_mesa int,
num_assentos int,
status_mesa varchar(20)
);

CREATE TABLE if not exists Item (
id_item int PRIMARY KEY auto_increment not null,
nome_item varchar(30),
preco_item decimal(10,2),
descricao_item varchar(90),
nome_categoria varchar(50)
);

CREATE TABLE if not exists Comanda (
id_comanda int PRIMARY KEY auto_increment not null,
data_comanda varchar(12),
horario_comanda varchar(12),
id_mesa int,
id_func int,
FOREIGN KEY(id_mesa) REFERENCES Mesa (id_mesa)
ON DELETE CASCADE 
ON UPDATE CASCADE,
FOREIGN KEY(id_func) REFERENCES Funcionario (id_func)
ON DELETE CASCADE 
ON UPDATE CASCADE
);

CREATE TABLE if not exists Pagamento (
id_pag int PRIMARY KEY auto_increment not null,
troco_pag decimal(10,2),
taxa_servico decimal(10,2),
total_pagamento decimal(10,2),
total_pago decimal(10,2),
tipo_pag varchar(30),
CPF_pag varchar(20),
status_pag varchar(20),
id_comanda int,
FOREIGN KEY(id_comanda) REFERENCES Comanda (id_comanda)
ON DELETE CASCADE 
ON UPDATE CASCADE
);

CREATE TABLE if not exists ItemComanda (
id_item_comanda int primary key auto_increment,
qt_item int,
id_comanda int,
id_item int,
FOREIGN KEY(id_comanda) REFERENCES Comanda (id_comanda)
ON DELETE CASCADE 
ON UPDATE CASCADE,
FOREIGN KEY(id_item) REFERENCES Item (id_item)
ON DELETE CASCADE 
ON UPDATE CASCADE
);

CREATE VIEW login AS SELECT usuario_func, senha_func FROM funcionario;

INSERT INTO funcionario values(default, "Ezek da Mota", 219359648, 1187239874, "Gerente", "R.Pinheiros, 34- São Paulo, SP", "ezek", 20030514, 1);
 
INSERT INTO funcionario values(default, "Gabrielle Silva", 512981239, 1123143098, "Gerente", "Av. dos Autonomistas, 215 - Osasco, SP", "gabi", 20030825, 1);

INSERT INTO funcionario values(default, "Paula Souza", 251324908, 1123152312, "Caixa", "R.Aalagoas, 89- São Paulo, SP", "paula", 123456, 2);
 
INSERT INTO funcionario values(default, "João Silva", 452324809, 1198065534, "Garçonete", "R.Pernambucana, 90- Osasco, SP", "joao", 234567, 3);
 
SELECT * FROM funcionario where id_func = 1;
 
SELECT * FROM login;


INSERT INTO mesa values(default, 1, 5, "desocupada");

INSERT INTO mesa values(default, 2, 4,  "desocupada");

INSERT INTO mesa VALUES(default, 3, 2,  "desocupada");

INSERT INTO mesa VALUES(default, 4, 8,  "desocupada");
 
 use tomoe_sushi;
 SELECT * FROM mesa;
 
 
INSERT INTO item VALUES(default, "Hot holl-12 unidades", 15.98 , "Sushi empanado", "Prato principal");
 
INSERT INTO item VALUES(default, "Yakisoba Carne", 28.24, "Macarrão com verduras e carne, serve 1 pessoa", "Prato principal");
 
INSERT INTO item VALUES(default, "Temaki", 22.25, "Cones de algas recheados com arroz, peixe cru ou frutos do mar e legumes", "Prato principal");
 
INSERT INTO item VALUES(default, "Coca-cola", 5.00 , "Coca-cola, lata 350ml", "Bebida");

INSERT INTO item VALUES(default, "Suco de laranja", 7.90, "Suco de laranja natural-300ml", "Bebida");

INSERT INTO item VALUES(default, "Guaraná antarctica", 5.00, "Guaraná antarctica, lata 350ml", "Bebida"); 

INSERT INTO item VALUES(default, "Harumaki", 13.00, "4 rolinhos primaveiras recheados com chocolate e banana", "Sobremesa"); 

INSERT INTO item VALUES(default, "Crêpre de morango", 22.90, "Massa crocante enrolada e recheada", "Sobremesa"); 

INSERT INTO item VALUES(default, "Taiyaki", 8.90, "Massa em formato de peixe recheada com diferentes ingredientes", "Sobremesa"); 

SELECT * FROM item;


INSERT INTO comanda values(default, "20/05/2020", "14:02",3, 4);

INSERT INTO comanda values(default, "10/05/2020", "13:36", 2, 4);

INSERT INTO comanda values(default, "13/05/2020", "20:47", 1, 4);

INSERT INTO comanda values(default, "13/05/2020", "20:47", 1, 4);

SELECT * FROM comanda;


INSERT INTO pagamento values(default, 9.02, 2.00, 20.98, 30.00, "dinheiro", 324152431, "aberto",1);  

INSERT INTO pagamento values(default, 0.00, 3.00, 28.24, 28.24, "crédito", 654188409, "pago",2);  

SELECT * FROM Pagamento;



INSERT INTO itemComanda values(default,2, 1, 1);

INSERT INTO itemComanda values(default,1, 2, 4);

insert into itemComanda values(default,1, 3, 2);

SELECT * FROM itemComanda;

SELECT item.nome_item, item.preco_item,  itemComanda.qt_item
FROM itemComanda
INNER JOIN item ON itemComanda.id_item = item.id_item
WHERE id_comanda = 1;


/*DROP database tomoe_sushi;*/

INSERT INTO Funcionario(nome_func,cpf_func,tel_func,funcao_func,endereco_func,usuario_func,senha_func,nivel_acesso_func) VALUES ("Casa", 123, 961332107, "Seila", "Rua Agostinho Navarro", "gabia", "123asd", 1);
