-- AlterTable
ALTER TABLE `tb_equipe_do_campeonato` ADD COLUMN `eqc_derrotas` INTEGER NOT NULL DEFAULT 0,
    ADD COLUMN `eqc_empates` INTEGER NOT NULL DEFAULT 0,
    ADD COLUMN `eqc_vitorias` INTEGER NOT NULL DEFAULT 0;
