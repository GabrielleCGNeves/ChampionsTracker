import { redirect, fail, error } from '@sveltejs/kit';
import { prisma } from '$lib/server/prisma'

/** @type {import('./$types').Actions} */
export const actions = {
requestEntry: async ({ request, params, locals }) => {
    const { equipePedido } = Object.fromEntries(await request.formData());
    
    if (!equipePedido) {
        return fail(400, { message: "Selecione uma equipe" });
    }

    try {
        await prisma.PedidoCampeonato.create({
            data: {
                campeonatoId: Number(params.tournamentId),
                equipeId: Number(equipePedido)
            }
        });
    } catch (error) {
        return fail(500, { message: "Não foi possível pedir a participação" });
    }
}
};