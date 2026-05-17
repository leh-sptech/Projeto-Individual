-- Arquivo de apoio, caso você queira criar tabelas como as aqui criadas para a API funcionar.
-- Você precisa executar os comandos no banco de dados para criar as tabelas,
-- ter este arquivo aqui não significa que a tabela em seu BD estará como abaixo!

/*
comandos para mysql server
*/
CREATE DATABASE IF NOT EXISTS vinildesk;

USE vinildesk;

CREATE TABLE usuario (
	id INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(100) NOT NULL,
	email VARCHAR(100) NOT NULL,
	senha VARCHAR(45) NOT NULL,
	telefone CHAR(11) NOT NULL
);

/* esta tabela deve estar de acordo com o que está em INSERT de sua API do arduino - dat-acqu-ino */

CREATE TABLE colecao_usuario(
	id INT AUTO_INCREMENT,
	usuario_id INT,
	titulo VARCHAR(100) NOT NULL,
    artista VARCHAR(100) NOT NULL,
    ano_lancamento YEAR NOT NULL,
    genero VARCHAR(45) NOT NULL,
    condicao VARCHAR(45) DEFAULT 'com marcas', 
    CHECK(condicao = 'excelente' OR 'com marcas' OR 'sem encarte'),
    
    CONSTRAINT fkUserColecao
	FOREIGN KEY (usuario_id) REFERENCES usuario(id),
    PRIMARY KEY(id, usuario_id)
);
