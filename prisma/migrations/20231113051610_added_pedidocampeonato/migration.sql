-- CreateTable
CREATE TABLE `tb_pedido_campeonato` (
    `pec_idpedidoCampeonato` INTEGER NOT NULL AUTO_INCREMENT,
    `cam_idcampeonato` INTEGER NOT NULL,
    `equ_idequipe` INTEGER NOT NULL,
    `pec_dataDoPedido` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    INDEX `tb_pedido_campeonato_cam_idcampeonato_idx`(`cam_idcampeonato`),
    INDEX `tb_pedido_campeonato_equ_idequipe_idx`(`equ_idequipe`),
    PRIMARY KEY (`pec_idpedidoCampeonato`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `tb_pedido_campeonato` ADD CONSTRAINT `tb_pedido_campeonato_cam_idcampeonato_fkey` FOREIGN KEY (`cam_idcampeonato`) REFERENCES `tb_campeonato`(`cam_idcampeonato`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `tb_pedido_campeonato` ADD CONSTRAINT `tb_pedido_campeonato_equ_idequipe_fkey` FOREIGN KEY (`equ_idequipe`) REFERENCES `tb_equipe`(`equ_idequipe`) ON DELETE RESTRICT ON UPDATE RESTRICT;
