/*
  Warnings:

  - You are about to alter the column `cam_foto` on the `tb_campeonato` table. The data in that column could be lost. The data in that column will be cast from `VarChar(255)` to `VarChar(191)`.
  - You are about to alter the column `cam_desc` on the `tb_campeonato` table. The data in that column could be lost. The data in that column will be cast from `VarChar(500)` to `VarChar(191)`.
  - You are about to alter the column `equ_foto` on the `tb_equipe` table. The data in that column could be lost. The data in that column will be cast from `VarChar(255)` to `VarChar(191)`.
  - You are about to alter the column `equ_desc` on the `tb_equipe` table. The data in that column could be lost. The data in that column will be cast from `VarChar(500)` to `VarChar(191)`.
  - You are about to drop the column `cam_idcampeonato` on the `tb_equipe_do_campeonato` table. All the data in the column will be lost.
  - You are about to drop the column `ec_derrota` on the `tb_equipe_do_campeonato` table. All the data in the column will be lost.
  - You are about to drop the column `ec_empate` on the `tb_equipe_do_campeonato` table. All the data in the column will be lost.
  - You are about to drop the column `ec_vitoria` on the `tb_equipe_do_campeonato` table. All the data in the column will be lost.
  - You are about to drop the column `equ_idequipe` on the `tb_equipe_do_campeonato` table. All the data in the column will be lost.
  - You are about to alter the column `jog_foto` on the `tb_jogador` table. The data in that column could be lost. The data in that column will be cast from `VarChar(255)` to `VarChar(191)`.
  - You are about to drop the column `equ_idEquipe` on the `tb_jogador_da_equipe` table. All the data in the column will be lost.
  - You are about to drop the column `je_pontosindividuais` on the `tb_jogador_da_equipe` table. All the data in the column will be lost.
  - You are about to drop the column `jog_idjogador` on the `tb_jogador_da_equipe` table. All the data in the column will be lost.
  - You are about to alter the column `usu_role` on the `tb_usuario` table. The data in that column could be lost. The data in that column will be cast from `VarChar(191)` to `Enum(EnumId(0))`.
  - You are about to drop the `tb_pontos_equipe` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `eqc_idEquipeCampeonato` to the `tb_equipe_do_campeonato` table without a default value. This is not possible if the table is not empty.
  - Added the required column `eqc_idcampeonato` to the `tb_equipe_do_campeonato` table without a default value. This is not possible if the table is not empty.
  - Added the required column `eqc_idequipe` to the `tb_equipe_do_campeonato` table without a default value. This is not possible if the table is not empty.
  - Added the required column `eqc_pontostotais` to the `tb_equipe_do_campeonato` table without a default value. This is not possible if the table is not empty.
  - Added the required column `jde_idJogadorEquipe` to the `tb_jogador_da_equipe` table without a default value. This is not possible if the table is not empty.
  - Added the required column `jde_idequipe` to the `tb_jogador_da_equipe` table without a default value. This is not possible if the table is not empty.
  - Added the required column `jde_idjogador` to the `tb_jogador_da_equipe` table without a default value. This is not possible if the table is not empty.
  - Added the required column `jde_pontos` to the `tb_jogador_da_equipe` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `tb_equipe_do_campeonato` DROP FOREIGN KEY `tb_equipe_do_campeonato_cam_idcampeonato_fkey`;

-- DropForeignKey
ALTER TABLE `tb_equipe_do_campeonato` DROP FOREIGN KEY `tb_equipe_do_campeonato_equ_idequipe_fkey`;

-- DropForeignKey
ALTER TABLE `tb_jogador_da_equipe` DROP FOREIGN KEY `tb_jogador_da_equipe_equ_idEquipe_fkey`;

-- DropForeignKey
ALTER TABLE `tb_jogador_da_equipe` DROP FOREIGN KEY `tb_jogador_da_equipe_jog_idjogador_fkey`;

-- DropForeignKey
ALTER TABLE `tb_ponto_jogador` DROP FOREIGN KEY `tb_ponto_jogador_jog_idjogador_fkey`;

-- DropForeignKey
ALTER TABLE `tb_ponto_jogador` DROP FOREIGN KEY `tb_ponto_jogador_rat_idregraatributo_fkey`;

-- DropForeignKey
ALTER TABLE `tb_pontos_equipe` DROP FOREIGN KEY `tb_pontos_equipe_equ_idequipe_fkey`;

-- DropForeignKey
ALTER TABLE `tb_pontos_equipe` DROP FOREIGN KEY `tb_pontos_equipe_par_idpartida_fkey`;

-- AlterTable
ALTER TABLE `tb_campeonato` ADD COLUMN `cam_tipo` ENUM('VIRTUAL', 'FISICO') NOT NULL DEFAULT 'VIRTUAL',
    MODIFY `cam_nome` VARCHAR(191) NOT NULL,
    MODIFY `cam_foto` VARCHAR(191) NOT NULL,
    MODIFY `cam_desc` VARCHAR(191) NOT NULL,
    MODIFY `cam_status` VARCHAR(191) NOT NULL;

-- AlterTable
ALTER TABLE `tb_equipe` MODIFY `equ_nome` VARCHAR(191) NOT NULL,
    MODIFY `equ_foto` VARCHAR(191) NOT NULL,
    MODIFY `equ_desc` VARCHAR(191) NOT NULL;

-- AlterTable
ALTER TABLE `tb_equipe_do_campeonato` DROP COLUMN `cam_idcampeonato`,
    DROP COLUMN `ec_derrota`,
    DROP COLUMN `ec_empate`,
    DROP COLUMN `ec_vitoria`,
    DROP COLUMN `equ_idequipe`,
    ADD COLUMN `eqc_idEquipeCampeonato` INTEGER NOT NULL AUTO_INCREMENT,
    ADD COLUMN `eqc_idcampeonato` INTEGER NOT NULL,
    ADD COLUMN `eqc_idequipe` INTEGER NOT NULL,
    ADD COLUMN `eqc_pontostotais` INTEGER NOT NULL,
    ADD PRIMARY KEY (`eqc_idEquipeCampeonato`);

-- AlterTable
ALTER TABLE `tb_fase` MODIFY `fas_nome` VARCHAR(191) NOT NULL;

-- AlterTable
ALTER TABLE `tb_jogador` MODIFY `jog_nome` VARCHAR(191) NOT NULL,
    MODIFY `jog_apelido` VARCHAR(191) NOT NULL,
    MODIFY `jog_foto` VARCHAR(191) NOT NULL;

-- AlterTable
ALTER TABLE `tb_jogador_da_equipe` DROP COLUMN `equ_idEquipe`,
    DROP COLUMN `je_pontosindividuais`,
    DROP COLUMN `jog_idjogador`,
    ADD COLUMN `jde_idJogadorEquipe` INTEGER NOT NULL AUTO_INCREMENT,
    ADD COLUMN `jde_idequipe` INTEGER NOT NULL,
    ADD COLUMN `jde_idjogador` INTEGER NOT NULL,
    ADD COLUMN `jde_pontos` INTEGER NOT NULL,
    ADD PRIMARY KEY (`jde_idJogadorEquipe`);

-- AlterTable
ALTER TABLE `tb_partida` MODIFY `par_data` DATETIME(3) NOT NULL;

-- AlterTable
ALTER TABLE `tb_usuario` MODIFY `usu_role` ENUM('USER', 'ADMIN') NOT NULL DEFAULT 'USER';

-- DropTable
DROP TABLE `tb_pontos_equipe`;

-- CreateIndex
CREATE INDEX `tb_equipe_do_campeonato_eqc_idequipe_idx` ON `tb_equipe_do_campeonato`(`eqc_idequipe`);

-- CreateIndex
CREATE INDEX `tb_equipe_do_campeonato_eqc_idcampeonato_idx` ON `tb_equipe_do_campeonato`(`eqc_idcampeonato`);

-- CreateIndex
CREATE INDEX `tb_jogador_da_equipe_jde_idjogador_idx` ON `tb_jogador_da_equipe`(`jde_idjogador`);

-- CreateIndex
CREATE INDEX `tb_jogador_da_equipe_jde_idequipe_idx` ON `tb_jogador_da_equipe`(`jde_idequipe`);

-- AddForeignKey
ALTER TABLE `tb_equipe_do_campeonato` ADD CONSTRAINT `tb_equipe_do_campeonato_eqc_idequipe_fkey` FOREIGN KEY (`eqc_idequipe`) REFERENCES `tb_equipe`(`equ_idequipe`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `tb_equipe_do_campeonato` ADD CONSTRAINT `tb_equipe_do_campeonato_eqc_idcampeonato_fkey` FOREIGN KEY (`eqc_idcampeonato`) REFERENCES `tb_campeonato`(`cam_idcampeonato`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `tb_jogador_da_equipe` ADD CONSTRAINT `tb_jogador_da_equipe_jde_idjogador_fkey` FOREIGN KEY (`jde_idjogador`) REFERENCES `tb_jogador`(`jog_idjogador`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `tb_jogador_da_equipe` ADD CONSTRAINT `tb_jogador_da_equipe_jde_idequipe_fkey` FOREIGN KEY (`jde_idequipe`) REFERENCES `tb_equipe`(`equ_idequipe`) ON DELETE RESTRICT ON UPDATE RESTRICT;
