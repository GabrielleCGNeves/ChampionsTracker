import { prisma } from "$lib/server/prisma";
import { fail, redirect } from "@sveltejs/kit"

export const load = async ( { locals } ) => {

    if (!locals.user) {
        throw redirect(302, '/')
    }

    return {
        equipes: await prisma.Equipe.findMany({
            where: {
                usuarioId: locals.user.id
            }
        }),
        campeonatos: await prisma.Campeonato.findMany({
            where: {
                usuarioId: locals.user.id
            }
        })
    }
}

export const actions = {
    deleteTeam: async ({ url }) => {
        const id = url.searchParams.get("id");
        if(!id) {
            return fail(400, { message: "Invalid Request" })
        }

        try {

            await prisma.$transaction([
                prisma.PedidoCampeonato.deleteMany({
                    where: {
                        equipeId: Number(id)
                    }
                }),
                prisma.EquipeDoCampeonato.deleteMany({
                    where: {
                        equipeId: Number(id)
                    }
                }),
                prisma.Equipe.delete({
                    where: {
                        id: Number(id)
                    }
                }),
            ])

        } catch (error) {
            console.error(error);
            return fail(500, { message: "Não foi possível deletar a equipe" })
        }
        return {
            status: 200
        }
    },
}