-- AlterTable
ALTER TABLE `tb_equipe` MODIFY `equ_pontostotais` INTEGER NOT NULL DEFAULT 0;

-- AlterTable
ALTER TABLE `tb_equipe_do_campeonato` MODIFY `eqc_pontostotais` INTEGER NOT NULL DEFAULT 0;

-- AlterTable
ALTER TABLE `tb_jogador` MODIFY `jog_pontosacumulados` INTEGER NOT NULL DEFAULT 0;

-- AlterTable
ALTER TABLE `tb_jogador_da_equipe` MODIFY `jde_pontos` INTEGER NOT NULL DEFAULT 0;

-- AlterTable
ALTER TABLE `tb_ponto_jogador` MODIFY `pjo_pontostotais` INTEGER NOT NULL DEFAULT 0;
