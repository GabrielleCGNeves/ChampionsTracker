import { redirect, fail, error } from '@sveltejs/kit';
import { prisma } from '$lib/server/prisma'

/** @type {import('./$types').Actions} */
export const actions = {
    requestEntry: async ({ request, params, locals }) => {
        const { equipePedido } = Object.fromEntries(await request.formData());

        if (!equipePedido) {
            // console.log("Selecione uma equipe");
            return fail(500, {message: "Equipe não selecionada"});
        }

        const pedidoExists = await prisma.PedidoCampeonato.findFirst({
            where: {
                campeonatoId: Number(params.tournamentId),
                equipeId: Number(equipePedido)
            }
        });

        if (pedidoExists) {
            // console.log("Esta equipe ja foi pedida");
            return fail(500, {message: "Esta equipe ja foi pedida"});
        }

        const equipeCampeonato = await prisma.EquipeDoCampeonato.findFirst({
            where: {
                id: Number(params.tournamentId),
                equipeId: Number(equipePedido)
            }
        })

        if (equipeCampeonato){
            return fail(500, {message: "Esta equipe ja está no campeonato"});
        }

        try {
            await prisma.PedidoCampeonato.create({
                data: {
                    campeonatoId: Number(params.tournamentId),
                    equipeId: Number(equipePedido)
                }
            });
            // console.log("Equipe pedida com sucesso");
        } catch (error) {
            // console.log("Não foi possível pedir a participação");
            return fail(500, {message: "Não foi possivel pedir a participação"});
        }
    }
};