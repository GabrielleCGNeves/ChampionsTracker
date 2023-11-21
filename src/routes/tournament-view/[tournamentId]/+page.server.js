import { fail, error } from '@sveltejs/kit';
import { prisma } from '$lib/server/prisma'

/** @type {import('./$types').Actions} */
export const actions = {
    requestEntry: async ({ request, params, locals }) => {
        const { equipePedido } = Object.fromEntries(await request.formData());

        if (!equipePedido) {
            return fail(500, {message: "Equipe não selecionada"});
        }

        const pedidoExists = await prisma.PedidoCampeonato.findFirst({
            where: {
                campeonatoId: Number(params.tournamentId),
                equipeId: Number(equipePedido)
            }
        });

        if (pedidoExists) {
            return fail(500, {message: "Esta equipe ja foi pedida"});
        }

        const equipeCampeonato = await prisma.EquipeDoCampeonato.findFirst({
            where: {
                campeonatoId: Number(params.tournamentId),
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
            
        } catch (error) {
            return fail(500, {message: "Não foi possivel pedir a participação"});
        }
    }
};