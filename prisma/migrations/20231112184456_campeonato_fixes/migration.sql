/*
  Warnings:

  - A unique constraint covering the columns `[cam_nome]` on the table `tb_campeonato` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[equ_nome]` on the table `tb_equipe` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `cam_dataAtualizacao` to the `tb_campeonato` table without a default value. This is not possible if the table is not empty.
  - Added the required column `cam_nomeDoJogo` to the `tb_campeonato` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `tb_campeonato` ADD COLUMN `cam_dataAtualizacao` DATETIME(3) NOT NULL,
    ADD COLUMN `cam_dataCriacao` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    ADD COLUMN `cam_nomeDoJogo` VARCHAR(191) NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX `tb_campeonato_cam_nome_key` ON `tb_campeonato`(`cam_nome`);

-- CreateIndex
CREATE UNIQUE INDEX `tb_equipe_equ_nome_key` ON `tb_equipe`(`equ_nome`);
