/*
  Warnings:

  - You are about to drop the column `fas_idfase` on the `tb_partida` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[eqc_idequipe,eqc_idcampeonato]` on the table `tb_equipe_do_campeonato` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[jde_idjogador,jde_idequipe]` on the table `tb_jogador_da_equipe` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[cam_idcampeonato,equ_idequipe]` on the table `tb_pedido_campeonato` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `equ1_idequipe` to the `tb_partida` table without a default value. This is not possible if the table is not empty.
  - Added the required column `equ2_idequipe` to the `tb_partida` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `tb_partida` DROP FOREIGN KEY `tb_partida_fas_idfase_fkey`;

-- AlterTable
ALTER TABLE `tb_partida` DROP COLUMN `fas_idfase`,
    ADD COLUMN `equ1_idequipe` INTEGER NOT NULL,
    ADD COLUMN `equ2_idequipe` INTEGER NOT NULL,
    ADD COLUMN `par_placarEquipe1` INTEGER NOT NULL DEFAULT 0,
    ADD COLUMN `par_placarEquipe2` INTEGER NOT NULL DEFAULT 0;

-- CreateIndex
CREATE UNIQUE INDEX `tb_equipe_do_campeonato_eqc_idequipe_eqc_idcampeonato_key` ON `tb_equipe_do_campeonato`(`eqc_idequipe`, `eqc_idcampeonato`);

-- CreateIndex
CREATE UNIQUE INDEX `tb_jogador_da_equipe_jde_idjogador_jde_idequipe_key` ON `tb_jogador_da_equipe`(`jde_idjogador`, `jde_idequipe`);

-- CreateIndex
CREATE UNIQUE INDEX `tb_pedido_campeonato_cam_idcampeonato_equ_idequipe_key` ON `tb_pedido_campeonato`(`cam_idcampeonato`, `equ_idequipe`);

-- AddForeignKey
ALTER TABLE `tb_partida` ADD CONSTRAINT `tb_partida_equ1_idequipe_fkey` FOREIGN KEY (`equ1_idequipe`) REFERENCES `tb_equipe`(`equ_idequipe`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `tb_partida` ADD CONSTRAINT `tb_partida_equ2_idequipe_fkey` FOREIGN KEY (`equ2_idequipe`) REFERENCES `tb_equipe`(`equ_idequipe`) ON DELETE RESTRICT ON UPDATE RESTRICT;
