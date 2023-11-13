import { prisma } from "$lib/server/prisma"

/** @type {import('./$types').PageLoad} */
export async function load({ params, locals }) {

    if(!locals.user) {
        throw redirect(302, '/login')
    }

    const campeonato = await prisma.Campeonato.findUnique({
        where: {
            id: Number(params.tournamentId)
        }
    })
    const equipeDoCampeonato = await prisma.EquipeDoCampeonato.findMany({
        where: {
            campeonatoId: Number(params.tournamentId)
        }
    })
    const equipes = await prisma.Equipe.findMany({
        where: {
            id: {
                in: equipeDoCampeonato.map(equipeDoCampeonato => equipeDoCampeonato.equipeId)
            }
        }
    })

    const equipesUsuario = await prisma.Equipe.findMany({
        where: {
            usuarioId: locals.user.id
        }
    })

    const owner = await prisma.Usuario.findUnique({
        where: {
            id: campeonato.usuarioId
        }
    })
    return {
        campeonato,
        equipes,
        owner,
        equipesUsuario
    }
}