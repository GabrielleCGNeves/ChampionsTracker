import { prisma } from "$lib/server/prisma";
import { error } from "@sveltejs/kit"

export const load = async ({ params }) => {
    const getTeam = async () => {
        const team = await prisma.tb_equipe.findUnique({
            where: {
                equ_idequipe: Number(params.teamid)
            }
        })
        if (!team) {
            throw error(404, 'Equipe não encontrada')
        }
        return team
    }
    return {
        equipe: getTeam(),
    }
}

export const actions = {
    updateTeam: async ({ request, params }) => {
        const data = await request.formData()
        const name = data.get("teamName")
        const number = parseInt(data.get("teamNumber"))
        const description = data.get("teamDescription")
        const image = data.get("image") 
 

        try {
            await prisma.tb_equipe.update({
                where: {
                    equ_idequipe: Number(params.teamid)
                },
                data: {
                    equ_nome: name,
                    equ_numjogadores: number,
                    equ_desc: description,
                    equ_foto: image,
                }
            })
        } catch (error) {
            console.error(error);
            return fail(500, { message: "Não foi possível atualizar a equipe" })
        }
        return {
            status: 200,
        }
    }
};