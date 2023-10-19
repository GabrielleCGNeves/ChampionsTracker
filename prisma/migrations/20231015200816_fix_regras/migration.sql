/*
  Warnings:

  - Added the required column `reg_nome` to the `tb_regra` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `tb_regra` ADD COLUMN `reg_nome` VARCHAR(191) NOT NULL;

-- AlterTable
ALTER TABLE `tb_usuario` ADD COLUMN `usu_role` VARCHAR(191) NOT NULL DEFAULT 'user';
