import { error, redirect } from "@sveltejs/kit";
import { prisma } from "$lib/server/prisma";

/** @type {import('./$types').PageLoad} */
export async function load({ locals, params }) {
    const campeonato = await prisma.Campeonato.findUnique({
        where: {
            id: Number(params.tournamentId)
        }
    })
    const owner = await prisma.Usuario.findUnique({
        where: {
            id: campeonato.usuarioId
        }
    }) 

    if (owner.id != locals.user.id) {
        throw error(403, 'Acesso não autorizado');
    }
}