import { prisma } from "$lib/server/prisma";
import { fail, redirect } from "@sveltejs/kit"

export const load = async ( { locals } ) => {

    if (!locals.user) {
        throw redirect(302, '/')
    }

    return {
        equipes: await prisma.Equipe.findMany()
    }
}

export const actions = {
    deleteTeam: async ({ url }) => {
        const id = url.searchParams.get("id");
        if(!id) {
            return fail(400, { message: "Invalid Request" })
        }

        try {
            await prisma.Equipe.delete({
                where: {
                    id: Number(id)
                }
            })
        } catch (error) {
            console.error(error);
            return fail(500, { message: "Não foi possível deletar a equipe" })
        }
        return {
            status: 200
        }
    },
}