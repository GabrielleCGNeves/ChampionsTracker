import { prisma } from '$lib/server/prisma';


/** @type {import('./$types').PageLoad} */
export async function load() {
    const campeonatos = await prisma.Campeonato.findMany(
        {
            orderBy: {
                dataCriacao: 'desc'
            },
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

    const equipes = await prisma.Equipe.findMany({
        where: {
            id: {
                in: equipeDoCampeonato.map(equipeDoCampeonato => equipeDoCampeonato.equipeId)
            }
        }
    })
        
    return {
        campeonatos,
        equipeDoCampeonato,
        equipes
    }
}