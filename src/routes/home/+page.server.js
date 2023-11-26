import { prisma } from '$lib/server/prisma';


/** @type {import('./$types').PageLoad} */
export async function load() {
    const campeonatos = await prisma.Campeonato.findMany(
        {
            orderBy: {
                dataCriacao: 'desc'
            },
            take: 3
        }
    );

    const equipeDoCampeonato = await prisma.EquipeDoCampeonato.findMany(
        {
            where: {
                campeonatoId: {
                    in: campeonatos.map(campeonato => campeonato.id)
                }
            }
        }
    )
        
    return {
        campeonatos
    }
}