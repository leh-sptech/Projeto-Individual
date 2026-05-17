-- Arquivo de apoio, caso você queira criar tabelas como as aqui criadas para a API funcionar.
-- Você precisa executar os comandos no banco de dados para criar as tabelas,
-- ter este arquivo aqui não significa que a tabela em seu BD estará como abaixo!

/*
comandos para mysql server
*/
CREATE DATABASE aquatech;

USE aquatech;

CREATE TABLE empresa (
	id INT PRIMARY KEY AUTO_INCREMENT,
	razao_social VARCHAR(50),
	cnpj CHAR(14),
	codigo_ativacao VARCHAR(50)
);

CREATE TABLE usuario (
	id INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(50),
	email VARCHAR(50),
	senha VARCHAR(50),
	fk_empresa INT,
	FOREIGN KEY (fk_empresa) REFERENCES empresa(id)
);

CREATE TABLE aviso (
	id INT PRIMARY KEY AUTO_INCREMENT,
	titulo VARCHAR(100),
	descricao VARCHAR(150),
	fk_usuario INT,
	FOREIGN KEY (fk_usuario) REFERENCES usuario(id)
);

create table aquario (
/* em nossa regra de negócio, um aquario tem apenas um sensor */
	id INT PRIMARY KEY AUTO_INCREMENT,
	descricao VARCHAR(300),
	fk_empresa INT,
	FOREIGN KEY (fk_empresa) REFERENCES empresa(id)
);

/* esta tabela deve estar de acordo com o que está em INSERT de sua API do arduino - dat-acqu-ino */

create table medida (
	id INT PRIMARY KEY AUTO_INCREMENT,
	dht11_umidade DECIMAL,
	dht11_temperatura DECIMAL,
	luminosidade DECIMAL,
	lm35_temperatura DECIMAL,
	chave TINYINT,
	momento DATETIME,
	fk_aquario INT,
	FOREIGN KEY (fk_aquario) REFERENCES aquario(id)
);

insert into empresa (razao_social, codigo_ativacao) values ('Empresa 1', 'ED145B');
insert into empresa (razao_social, codigo_ativacao) values ('Empresa 2', 'A1B2C3');
insert into aquario (descricao, fk_empresa) values ('Aquário de Estrela-do-mar', 1);
insert into aquario (descricao, fk_empresa) values ('Aquário de Peixe-dourado', 2);






INSERT INTO medida 
(dht11_umidade, dht11_temperatura, luminosidade, lm35_temperatura, chave, momento, fk_aquario)
VALUES
(58.2, 24.5, 320.8, 25.1, 1, '2026-05-14 08:00:00', 1);

INSERT INTO medida 
(dht11_umidade, dht11_temperatura, luminosidade, lm35_temperatura, chave, momento, fk_aquario)
VALUES
(60.7, 23.9, 280.4, 24.3, 0, '2026-05-14 08:05:00', 1);

INSERT INTO medida 
(dht11_umidade, dht11_temperatura, luminosidade, lm35_temperatura, chave, momento, fk_aquario)
VALUES
(55.1, 25.3, 350.2, 26.0, 1, '2026-05-14 08:10:00', 2);

INSERT INTO medida 
(dht11_umidade, dht11_temperatura, luminosidade, lm35_temperatura, chave, momento, fk_aquario)
VALUES
(62.5, 22.8, 260.7, 23.4, 0, '2026-05-14 08:15:00', 2);

INSERT INTO medida 
(dht11_umidade, dht11_temperatura, luminosidade, lm35_temperatura, chave, momento, fk_aquario)
VALUES
(57.9, 24.1, 300.0, 24.8, 1, '2026-05-14 08:20:00', 3);