-- CreateTable
CREATE TABLE `tb_usuario` (
    `usu_idUsuario` INTEGER NOT NULL AUTO_INCREMENT,
    `usu_email` VARCHAR(191) NOT NULL,
    `usu_nome` VARCHAR(191) NOT NULL,
    `usu_passwordHash` VARCHAR(191) NOT NULL,
    `usu_authToken` VARCHAR(191) NOT NULL,
    `usu_apelido` VARCHAR(191) NOT NULL,
    `usu_foto` VARCHAR(191) NOT NULL,
    `usu_pontostotais` INTEGER NOT NULL DEFAULT 0,
    `usu_dataCriacao` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `usu_dataAtualizacao` DATETIME(3) NOT NULL,

    UNIQUE INDEX `tb_usuario_usu_email_key`(`usu_email`),
    UNIQUE INDEX `tb_usuario_usu_authToken_key`(`usu_authToken`),
    UNIQUE INDEX `tb_usuario_usu_apelido_key`(`usu_apelido`),
    PRIMARY KEY (`usu_idUsuario`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tb_campeonato` (
    `cam_idcampeonato` INTEGER NOT NULL AUTO_INCREMENT,
    `usu_idusuario` INTEGER NOT NULL,
    `reg_idregra` INTEGER NOT NULL,
    `cam_nome` VARCHAR(100) NOT NULL,
    `cam_foto` VARCHAR(255) NOT NULL,
    `cam_desc` VARCHAR(500) NOT NULL,
    `cam_status` VARCHAR(50) NOT NULL,

    INDEX `tb_campeonato_usu_idusuario_idx`(`usu_idusuario`),
    INDEX `tb_campeonato_reg_idregra_idx`(`reg_idregra`),
    PRIMARY KEY (`cam_idcampeonato`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tb_equipe` (
    `equ_idequipe` INTEGER NOT NULL AUTO_INCREMENT,
    `usu_idusuario` INTEGER NOT NULL,
    `equ_nome` VARCHAR(100) NOT NULL,
    `equ_foto` VARCHAR(255) NOT NULL,
    `equ_desc` VARCHAR(500) NOT NULL,
    `equ_numjogadores` INTEGER NOT NULL,
    `equ_pontostotais` INTEGER NOT NULL,

    INDEX `tb_equipe_usu_idusuario_idx`(`usu_idusuario`),
    PRIMARY KEY (`equ_idequipe`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tb_equipe_do_campeonato` (
    `equ_idequipe` INTEGER NOT NULL,
    `cam_idcampeonato` INTEGER NOT NULL,
    `ec_vitoria` INTEGER NOT NULL,
    `ec_derrota` INTEGER NOT NULL,
    `ec_empate` INTEGER NOT NULL,

    INDEX `tb_equipe_do_campeonato_equ_idequipe_idx`(`equ_idequipe`),
    INDEX `tb_equipe_do_campeonato_cam_idcampeonato_idx`(`cam_idcampeonato`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tb_fase` (
    `fas_idfase` INTEGER NOT NULL AUTO_INCREMENT,
    `cam_idcampeonato` INTEGER NOT NULL,
    `fas_nome` VARCHAR(100) NOT NULL,
    `fas_posicao` INTEGER NOT NULL,

    INDEX `tb_fase_cam_idcampeonato_idx`(`cam_idcampeonato`),
    PRIMARY KEY (`fas_idfase`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tb_jogador` (
    `jog_idjogador` INTEGER NOT NULL AUTO_INCREMENT,
    `usu_idusuario` INTEGER NULL,
    `jog_nome` VARCHAR(100) NOT NULL,
    `jog_apelido` VARCHAR(100) NOT NULL,
    `jog_foto` VARCHAR(255) NOT NULL,
    `jog_pontosacumulados` INTEGER NOT NULL,

    INDEX `tb_jogador_usu_idusuario_idx`(`usu_idusuario`),
    PRIMARY KEY (`jog_idjogador`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tb_jogador_da_equipe` (
    `jog_idjogador` INTEGER NOT NULL,
    `equ_idEquipe` INTEGER NOT NULL,
    `je_pontosindividuais` INTEGER NOT NULL,

    INDEX `tb_jogador_da_equipe_jog_idjogador_idx`(`jog_idjogador`),
    INDEX `tb_jogador_da_equipe_equ_idEquipe_idx`(`equ_idEquipe`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tb_partida` (
    `par_idpartida` INTEGER NOT NULL AUTO_INCREMENT,
    `fas_idfase` INTEGER NOT NULL,
    `par_data` DATETIME(0) NOT NULL,

    INDEX `tb_partida_fas_idfase_idx`(`fas_idfase`),
    PRIMARY KEY (`par_idpartida`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tb_ponto_jogador` (
    `pjo_idpontojog` INTEGER NOT NULL AUTO_INCREMENT,
    `par_idpartida` INTEGER NOT NULL,
    `rat_idregraatributo` INTEGER NOT NULL,
    `jog_idjogador` INTEGER NOT NULL,
    `pjo_qtde` INTEGER NOT NULL,
    `pjo_pontostotais` INTEGER NOT NULL,

    INDEX `tb_ponto_jogador_par_idpartida_idx`(`par_idpartida`),
    INDEX `tb_ponto_jogador_rat_idregraatributo_idx`(`rat_idregraatributo`),
    INDEX `tb_ponto_jogador_jog_idjogador_idx`(`jog_idjogador`),
    PRIMARY KEY (`pjo_idpontojog`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tb_pontos_equipe` (
    `poe_idpontosequipe` INTEGER NOT NULL AUTO_INCREMENT,
    `par_idpartida` INTEGER NOT NULL,
    `equ_idequipe` INTEGER NOT NULL,
    `poe_ponto` INTEGER NOT NULL,

    INDEX `tb_pontos_equipe_par_idpartida_idx`(`par_idpartida`),
    INDEX `tb_pontos_equipe_equ_idequipe_idx`(`equ_idequipe`),
    PRIMARY KEY (`poe_idpontosequipe`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tb_regra` (
    `reg_idregra` INTEGER NOT NULL AUTO_INCREMENT,
    `usu_idusuario` INTEGER NOT NULL,

    INDEX `tb_regra_usu_idusuario_idx`(`usu_idusuario`),
    PRIMARY KEY (`reg_idregra`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tb_regra_atributo` (
    `rat_idregraatributo` INTEGER NOT NULL AUTO_INCREMENT,
    `reg_idregra` INTEGER NOT NULL,
    `rat_nome` INTEGER NOT NULL,
    `rat_pontos` INTEGER NOT NULL,

    INDEX `tb_regra_atributo_reg_idregra_idx`(`reg_idregra`),
    PRIMARY KEY (`rat_idregraatributo`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `tb_campeonato` ADD CONSTRAINT `tb_campeonato_usu_idusuario_fkey` FOREIGN KEY (`usu_idusuario`) REFERENCES `tb_usuario`(`usu_idUsuario`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `tb_campeonato` ADD CONSTRAINT `tb_campeonato_reg_idregra_fkey` FOREIGN KEY (`reg_idregra`) REFERENCES `tb_regra`(`reg_idregra`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `tb_equipe` ADD CONSTRAINT `tb_equipe_usu_idusuario_fkey` FOREIGN KEY (`usu_idusuario`) REFERENCES `tb_usuario`(`usu_idUsuario`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `tb_equipe_do_campeonato` ADD CONSTRAINT `tb_equipe_do_campeonato_equ_idequipe_fkey` FOREIGN KEY (`equ_idequipe`) REFERENCES `tb_equipe`(`equ_idequipe`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `tb_equipe_do_campeonato` ADD CONSTRAINT `tb_equipe_do_campeonato_cam_idcampeonato_fkey` FOREIGN KEY (`cam_idcampeonato`) REFERENCES `tb_campeonato`(`cam_idcampeonato`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `tb_fase` ADD CONSTRAINT `tb_fase_cam_idcampeonato_fkey` FOREIGN KEY (`cam_idcampeonato`) REFERENCES `tb_campeonato`(`cam_idcampeonato`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `tb_jogador` ADD CONSTRAINT `tb_jogador_usu_idusuario_fkey` FOREIGN KEY (`usu_idusuario`) REFERENCES `tb_usuario`(`usu_idUsuario`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `tb_jogador_da_equipe` ADD CONSTRAINT `tb_jogador_da_equipe_jog_idjogador_fkey` FOREIGN KEY (`jog_idjogador`) REFERENCES `tb_jogador`(`jog_idjogador`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `tb_jogador_da_equipe` ADD CONSTRAINT `tb_jogador_da_equipe_equ_idEquipe_fkey` FOREIGN KEY (`equ_idEquipe`) REFERENCES `tb_equipe`(`equ_idequipe`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `tb_partida` ADD CONSTRAINT `tb_partida_fas_idfase_fkey` FOREIGN KEY (`fas_idfase`) REFERENCES `tb_fase`(`fas_idfase`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `tb_ponto_jogador` ADD CONSTRAINT `tb_ponto_jogador_par_idpartida_fkey` FOREIGN KEY (`par_idpartida`) REFERENCES `tb_partida`(`par_idpartida`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `tb_ponto_jogador` ADD CONSTRAINT `tb_ponto_jogador_rat_idregraatributo_fkey` FOREIGN KEY (`rat_idregraatributo`) REFERENCES `tb_regra_atributo`(`rat_idregraatributo`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `tb_ponto_jogador` ADD CONSTRAINT `tb_ponto_jogador_jog_idjogador_fkey` FOREIGN KEY (`jog_idjogador`) REFERENCES `tb_jogador`(`jog_idjogador`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `tb_pontos_equipe` ADD CONSTRAINT `tb_pontos_equipe_par_idpartida_fkey` FOREIGN KEY (`par_idpartida`) REFERENCES `tb_partida`(`par_idpartida`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `tb_pontos_equipe` ADD CONSTRAINT `tb_pontos_equipe_equ_idequipe_fkey` FOREIGN KEY (`equ_idequipe`) REFERENCES `tb_equipe`(`equ_idequipe`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `tb_regra` ADD CONSTRAINT `tb_regra_usu_idusuario_fkey` FOREIGN KEY (`usu_idusuario`) REFERENCES `tb_usuario`(`usu_idUsuario`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `tb_regra_atributo` ADD CONSTRAINT `tb_regra_atributo_reg_idregra_fkey` FOREIGN KEY (`reg_idregra`) REFERENCES `tb_regra`(`reg_idregra`) ON DELETE RESTRICT ON UPDATE RESTRICT;
