import { prisma } from "$lib/server/prisma";
import { fail } from "@sveltejs/kit"

export const load = async () => {
    return {
        equipes: await prisma.tb_equipe.findMany()
    }
}

export const actions = {
    deleteTeam: async ({ url }) => {
        const id = url.searchParams.get("id");
        if(!id) {
            return fail(400, { message: "Invalid Request" })
        }

        try {
            await prisma.tb_equipe.delete({
                where: {
                    equ_idequipe: Number(id)
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