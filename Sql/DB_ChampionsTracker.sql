CREATE DATABASE ChampionsTracker;
USE ChampionsTracker;

CREATE TABLE `tb_usuario` (
	`usu_idusuario` int NOT NULL AUTO_INCREMENT,
	`usu_email` varchar(255) NOT NULL,
	`usu_senha` varchar(100) NOT NULL,
	`usu_nome` varchar(100) NOT NULL,
	`usu_apelido` varchar(100) NOT NULL,
	`usu_foto` varchar(255) NOT NULL,
	`usu_pontostotais` int NOT NULL,
	PRIMARY KEY (`usu_idusuario`)
);

CREATE TABLE `tb_jogador` (
	`jog_idjogador` int NOT NULL AUTO_INCREMENT,
	`usu_idusuario` int,
	`jog_nome` varchar(100) NOT NULL,
	`jog_apelido` varchar(100) NOT NULL,
	`jog_foto` varchar(255) NOT NULL,
	`jog_pontosacumulados` int NOT NULL,
	PRIMARY KEY (`jog_idjogador`)
);

CREATE TABLE `tb_equipe` (
	`equ_idequipe` int NOT NULL AUTO_INCREMENT,
	`usu_idusuario` int NOT NULL,
	`equ_nome` varchar(100) NOT NULL,
	`equ_foto` varchar(255),
	`equ_desc` varchar(500) NOT NULL,
	`equ_numjogadores` int NOT NULL,
	`equ_pontostotais` int NOT NULL,
	PRIMARY KEY (`equ_idequipe`)
);

CREATE TABLE `tb_jogador_da_equipe` (
	`jog_idjogador` int NOT NULL,
	`equ_idEquipe` int NOT NULL,
	`je_pontosindividuais` int NOT NULL
);

CREATE TABLE `tb_regra` (
	`reg_idregra` int NOT NULL AUTO_INCREMENT,
	`usu_idusuario` int NOT NULL,
	PRIMARY KEY (`reg_idregra`)
);

CREATE TABLE `tb_regra_atributo` (
	`rat_idregraatributo` int NOT NULL AUTO_INCREMENT,
	`reg_idregra` int NOT NULL,
	`rat_nome` int NOT NULL,
	`rat_pontos` int NOT NULL,
	PRIMARY KEY (`rat_idregraatributo`)
);

CREATE TABLE `tb_campeonato` (
	`cam_idcampeonato` int NOT NULL AUTO_INCREMENT,
	`usu_idusuario` int NOT NULL,
	`reg_idregra` int NOT NULL,
	`cam_nome` varchar(100) NOT NULL,
	`cam_foto` varchar(255) NOT NULL,
	`cam_desc` varchar(500) NOT NULL,
	`cam_status` varchar(50) NOT NULL,
	PRIMARY KEY (`cam_idcampeonato`)
);

CREATE TABLE `tb_equipe_do_campeonato` (
	`equ_idequipe` int NOT NULL,
	`cam_idcampeonato` int NOT NULL,
	`ec_vitoria` int NOT NULL,
	`ec_derrota` int NOT NULL,
	`ec_empate` int NOT NULL
);

CREATE TABLE `tb_pontos_equipe` (
	`poe_idpontosequipe` int NOT NULL AUTO_INCREMENT,
	`par_idpartida` int NOT NULL,
	`equ_idequipe` int NOT NULL,
	`poe_ponto` int NOT NULL,
	PRIMARY KEY (`poe_idpontosequipe`)
);

CREATE TABLE `tb_ponto_jogador` (
	`pjo_idpontojog` int NOT NULL AUTO_INCREMENT,
	`par_idpartida` int NOT NULL,
	`rat_idregraatributo` int NOT NULL,
	`jog_idjogador` int NOT NULL,
	`pjo_qtde` int NOT NULL,
	`pjo_pontostotais` int NOT NULL,
	PRIMARY KEY (`pjo_idpontojog`)
);

CREATE TABLE `tb_partida` (
	`par_idpartida` int NOT NULL AUTO_INCREMENT,
	`fas_idfase` int NOT NULL,
	`par_data` DATETIME NOT NULL,
	PRIMARY KEY (`par_idpartida`)
);

CREATE TABLE `tb_fase` (
	`fas_idfase` int NOT NULL AUTO_INCREMENT,
	`cam_idcampeonato` int NOT NULL,
	`fas_nome` varchar(100) NOT NULL,
	`fas_posicao` int NOT NULL,
	PRIMARY KEY (`fas_idfase`)
);

ALTER TABLE `tb_jogador` ADD CONSTRAINT `tb_jogador_fk0` FOREIGN KEY (`usu_idusuario`) REFERENCES `tb_usuario`(`usu_idusuario`);

ALTER TABLE `tb_equipe` ADD CONSTRAINT `tb_equipe_fk0` FOREIGN KEY (`usu_idusuario`) REFERENCES `tb_usuario`(`usu_idusuario`);

ALTER TABLE `tb_jogador_da_equipe` ADD CONSTRAINT `tb_jogador_da_equipe_fk0` FOREIGN KEY (`jog_idjogador`) REFERENCES `tb_jogador`(`jog_idjogador`);

ALTER TABLE `tb_jogador_da_equipe` ADD CONSTRAINT `tb_jogador_da_equipe_fk1` FOREIGN KEY (`equ_idEquipe`) REFERENCES `tb_equipe`(`equ_idequipe`);

ALTER TABLE `tb_regra` ADD CONSTRAINT `tb_regra_fk0` FOREIGN KEY (`usu_idusuario`) REFERENCES `tb_usuario`(`usu_idusuario`);

ALTER TABLE `tb_regra_atributo` ADD CONSTRAINT `tb_regra_atributo_fk0` FOREIGN KEY (`reg_idregra`) REFERENCES `tb_regra`(`reg_idregra`);

ALTER TABLE `tb_campeonato` ADD CONSTRAINT `tb_campeonato_fk0` FOREIGN KEY (`usu_idusuario`) REFERENCES `tb_usuario`(`usu_idusuario`);

ALTER TABLE `tb_campeonato` ADD CONSTRAINT `tb_campeonato_fk1` FOREIGN KEY (`reg_idregra`) REFERENCES `tb_regra`(`reg_idregra`);

ALTER TABLE `tb_equipe_do_campeonato` ADD CONSTRAINT `tb_equipe_do_campeonato_fk0` FOREIGN KEY (`equ_idequipe`) REFERENCES `tb_equipe`(`equ_idequipe`);

ALTER TABLE `tb_equipe_do_campeonato` ADD CONSTRAINT `tb_equipe_do_campeonato_fk1` FOREIGN KEY (`cam_idcampeonato`) REFERENCES `tb_campeonato`(`cam_idcampeonato`);

ALTER TABLE `tb_pontos_equipe` ADD CONSTRAINT `tb_pontos_equipe_fk0` FOREIGN KEY (`par_idpartida`) REFERENCES `tb_partida`(`par_idpartida`);

ALTER TABLE `tb_pontos_equipe` ADD CONSTRAINT `tb_pontos_equipe_fk1` FOREIGN KEY (`equ_idequipe`) REFERENCES `tb_equipe`(`equ_idequipe`);

ALTER TABLE `tb_ponto_jogador` ADD CONSTRAINT `tb_ponto_jogador_fk0` FOREIGN KEY (`par_idpartida`) REFERENCES `tb_partida`(`par_idpartida`);

ALTER TABLE `tb_ponto_jogador` ADD CONSTRAINT `tb_ponto_jogador_fk1` FOREIGN KEY (`rat_idregraatributo`) REFERENCES `tb_regra_atributo`(`rat_idregraatributo`);

ALTER TABLE `tb_ponto_jogador` ADD CONSTRAINT `tb_ponto_jogador_fk2` FOREIGN KEY (`jog_idjogador`) REFERENCES `tb_jogador`(`jog_idjogador`);

ALTER TABLE `tb_partida` ADD CONSTRAINT `tb_partida_fk0` FOREIGN KEY (`fas_idfase`) REFERENCES `tb_fase`(`fas_idfase`);

ALTER TABLE `tb_fase` ADD CONSTRAINT `tb_fase_fk0` FOREIGN KEY (`cam_idcampeonato`) REFERENCES `tb_campeonato`(`cam_idcampeonato`);
