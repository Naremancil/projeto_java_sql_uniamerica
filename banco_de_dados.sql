CREATE DATABASE app_rpg;
DROP DATABASE app_rpg;
USE app_rpg;

CREATE TABLE IF NOT EXISTS users(
	idUser BIGINT PRIMARY KEY AUTO_INCREMENT,
    login VARCHAR(256) NOT NULL UNIQUE,
    senha VARCHAR(256) NOT NULL
);

CREATE TABLE IF NOT EXISTS personagem(
	idPersonagem BIGINT PRIMARY KEY AUTO_INCREMENT,
    apelido VARCHAR(256) NOT NULL UNIQUE,
    nivel INT NOT NULL,
    exp INT NOT NULL,
    ranque INT,	
    titulo VARCHAR(256) NOT NULL,
    idUser_fk BIGINT NOT NULL,
    FOREIGN KEY (idUser_fk) REFERENCES users(IdUser)
);

CREATE TABLE IF NOT EXISTS ficha(
	idFicha BIGINT PRIMARY KEY AUTO_INCREMENT,
    forca INT NOT NULL,
    inteligencia INT NOT NULL,
    destreza INT NOT NULL,
    resistencia INT NOT NULL,
    carisma INT NOT NULL,
    idPersonagem_fk BIGINT NOT NULL,
	FOREIGN KEY (idPersonagem_fk) REFERENCES personagem(idPersonagem)
);

CREATE TABLE IF NOT EXISTS inventario(
	idInventario BIGINT PRIMARY KEY AUTO_INCREMENT,
    idFicha_fk BIGINT NOT NULL,
    FOREIGN KEY (idFicha_fk) REFERENCES ficha(idFicha)
);

CREATE TABLE IF NOT EXISTS bolsa(
	idBolsa BIGINT PRIMARY KEY AUTO_INCREMENT,
    idInventario_fk BIGINT NOT NULL,
    FOREIGN KEY (idInventario_fk) REFERENCES inventario(idInventario)
);

CREATE TABLE IF NOT EXISTS item_bolsa(
	idBolsa_fk BIGINT NOT NULL,
    idItem_fk BIGINT NOT NULL,
    FOREIGN KEY (idItem_fk) REFERENCES item(idItem),
    FOREIGN KEY (idBolsa_fk) REFERENCES bolsa(idBolsa)
);

CREATE TABLE IF NOT EXISTS item(
	idItem BIGINT PRIMARY KEY AUTO_INCREMENT,
    nomeItem varchar(256) NOT NULL,
    descricaoItem varchar(256) NOT NULL,
    atributoPrimario int NOT NULL,
    statusPrimario varchar(256) NOT NULL,
    atributoSecundario int NOT NULL,
    statusSecundario varchar(256) NOT NULL,
    idBolsa_fk BIGINT NOT NULL,
    FOREIGN KEY(idBolsa_fk) REFERENCES bolsa(idBolsa)
);

CREATE TABLE IF NOT EXISTS inimigo(
	idInimigo BIGINT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(256) NOT NULL UNIQUE,
    dano INT NOT NULL,
    defesa INT NOT NULL,
    exp INT NOT NULL
);
