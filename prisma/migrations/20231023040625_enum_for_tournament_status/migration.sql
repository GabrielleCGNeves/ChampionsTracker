/*
  Warnings:

  - You are about to alter the column `cam_status` on the `tb_campeonato` table. The data in that column could be lost. The data in that column will be cast from `VarChar(191)` to `Enum(EnumId(1))`.

*/
-- AlterTable
ALTER TABLE `tb_campeonato` MODIFY `cam_status` ENUM('ATIVO', 'INATIVO') NOT NULL DEFAULT 'ATIVO';
