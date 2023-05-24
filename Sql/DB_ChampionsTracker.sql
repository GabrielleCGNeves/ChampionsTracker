CREATE DATABASE ChampionsTracker;
USE ChampionsTracker;

CREATE TABLE TB_Usuario(
    usu_idUsuario INT NOT NULL PRIMARY KEY,
    usu_email VARCHAR(50) NOT NULL,
    usu_senha VARCHAR(255) NOT NULL,
    usu_nome VARCHAR(50) NOT NULL,
    usu_apelido VARCHAR(30) NOT NULL,
    usu_foto VARCHAR(255) NOT NULL,
    usu_pontosTotais INT NULL,
    usu_pontosPalpites INT NULL
);

CREATE TABLE TB_Jogador (
    jog_idJogador INT NOT NULL PRIMARY KEY,
    usu_idUsuario INT,
    jog_nome VARCHAR(50),
    jog_apelido VARCHAR(30) NOT NULL,
    jog_foto VARCHAR(255),
    jog_pontosAcumulados INT,
    FOREIGN KEY(usu_idUsuario)
        REFERENCES TB_Usuario(usu_idUsuario)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
);

CREATE TABLE TB_Equipe(
    equ_idEquipe INT NOT NULL PRIMARY KEY,
    usu_idUsuario INT NOT NULL,
    equ_nome VARCHAR(30) NOT NULL,
    equ_foto VARCHAR(255) NOT NULL,
    equ_desc VARCHAR(100) NULL,
    equ_numJogadores INT NOT NULL,
    equ_pontosTotais INT NULL,
    FOREIGN KEY(usu_idUsuario)
    REFERENCES TB_Usuario(usu_idUsuario)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION
    
);

CREATE TABLE TB_Jogador_da_Equipe(
    jog_idJogador INT NOT NULL,
    equ_idEquipe INT NOT NULL,
    je_pontosIndividuais INT NOT NULL,
    FOREIGN KEY(jog_idJogador)
        REFERENCES TB_Jogador(jog_idJogador)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION,
    FOREIGN KEY(equ_idEquipe)
        REFERENCES TB_Equipe(equ_idEquipe)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
);

CREATE TABLE TB_Regra (
    reg_idRegra INT NOT NULL PRIMARY KEY,
    usu_idUsuario INT NOT NULL,
    reg_nome VARCHAR(30) NOT NULL,
    FOREIGN KEY(usu_idUsuario)
        REFERENCES TB_Usuario(usu_idUsuario)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
);

CREATE TABLE TB_Regra_Atributo (
    rat_idRegraAtributo INT NOT NULL PRIMARY KEY,
    reg_idRegra INT NOT NULL,
    rat_nome INT NOT NULL,
    rat_pontos INT NOT NULL,
    FOREIGN KEY(reg_idRegra)
        REFERENCES TB_Regra(reg_idRegra)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
);

CREATE TABLE TB_Campeonato (
    cam_idCampeonato INT NOT NULL PRIMARY KEY,
    usu_idUsuario INT NOT NULL,
    reg_idRegra INT NOT NULL,
    cam_nome VARCHAR(30) NOT NULL,
    cam_foto VARCHAR(255),
    cam_desc VARCHAR(100),
    cam_status VARCHAR(1),
    FOREIGN KEY(usu_idUsuario)
        REFERENCES TB_Usuario(usu_idUsuario)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION,
    FOREIGN KEY(reg_idRegra)
        REFERENCES TB_Regra(reg_idRegra)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
);

CREATE TABLE TB_Equipe_do_Campeonato(
    equ_idEquipe INT NOT NULL,
    cam_idCampeonato INT NOT NULL,
    ec_vitoria INT NOT NULL,
    ec_derrota INT NOT NULL,
    ec_empate INT NOT NULL,
    FOREIGN KEY(equ_idEquipe)
        REFERENCES TB_Equipe(equ_idEquipe)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION,
    FOREIGN KEY(cam_idCampeonato)
        REFERENCES TB_Campeonato(cam_idCampeonato)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
);

CREATE TABLE TB_Partida (
    par_idPartida INT NOT NULL PRIMARY KEY,
    cam_idCampeonato INT NOT NULL,
    par_data DATETIME NOT NULL,
    FOREIGN KEY(cam_idCampeonato)
        REFERENCES TB_Campeonato(cam_idCampeonato)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
);

CREATE TABLE TB_Pontos_Equipe (
    poe_idPontosEquipe INT NOT NULL PRIMARY KEY,
    par_idPartida INT NOT NULL,
    equ_idEquipe INT NOT NULL,
    poe_ponto INT NOT NULL,
    FOREIGN KEY(par_idPartida)
        REFERENCES TB_Partida(par_idPartida)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION,
    FOREIGN KEY(equ_idEquipe)
        REFERENCES TB_Equipe(equ_idEquipe)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
);

CREATE TABLE TB_Ponto_Jogador(
    pjo_idPontoJog INT NOT NULL PRIMARY KEY,
    par_idPartida INT NOT NULL,
    rat_idRegraAtributo INT NOT NULL,
    jog_idJogador INT NOT NULL,
    pjo_Qtde INT NOT NULL,
    pjo_pontosTotais INT NOT NULL,
    FOREIGN KEY(par_idPartida)
        REFERENCES TB_Partida(par_idPartida)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION,
    FOREIGN KEY(rat_idRegraAtributo)
        REFERENCES TB_Regra_Atributo(rat_idRegraAtributo)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION,
    FOREIGN KEY(jog_idJogador)
        REFERENCES TB_Jogador(jog_idJogador)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION

);

CREATE TABLE TB_Palpite(
    pal_idPalpite INT NOT NULL PRIMARY KEY,
    usu_idUsuario INT NOT NULL,
    FOREIGN KEY(usu_idUsuario)
        REFERENCES TB_Usuario(usu_idUsuario)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
);

CREATE TABLE TB_Palpite_no_Jogador(
    pnj_idPalpiteJog INT NOT NULL PRIMARY KEY,
    jog_idJogador INT NOT NULL,
    par_idPartida INT NOT NULL,
    pal_idPalpite INT NOT NULL,
    rat_idRegraAtributo INT NOT NULL,
    pnj_qtdeAtributo INT NOT NULL,
    pnj_pontosTotais INT NOT NULL,
    FOREIGN KEY(pal_idPalpite)
        REFERENCES TB_Palpite(pal_idPalpite)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION,
    FOREIGN KEY(rat_idRegraAtributo)
        REFERENCES TB_Regra_Atributo(rat_idRegraAtributo)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION,
    FOREIGN KEY(jog_idJogador)
        REFERENCES TB_Jogador(jog_idJogador)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION,
    FOREIGN KEY(par_idPartida)
        REFERENCES TB_Partida(par_idPartida)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
);