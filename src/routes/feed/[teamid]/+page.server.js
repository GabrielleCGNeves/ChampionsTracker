import { prisma } from "$lib/server/prisma";
import { error } from "@sveltejs/kit"

export const load = async ({ locals, params }) => {
    // Check if the user is authenticated
    if (!locals.user) {
        // If not, throw a redirect exception to the home page
        throw redirect(302, '/')
    }

    // Define an async function to get the team information
    const getTeam = async () => {
        // Retrieve the team from the database based on the team ID
        const team = await prisma.tb_equipe.findUnique({
            where: {
                equ_idequipe: Number(params.teamid)
            }
        })

        // If the team is not found, throw an exception with a 404 status code
        if (!team) {
            throw error(404, 'Equipe não encontrada')
        }

        // Check if the user's ID is not equal to the team's user ID
        if (locals.user.id != team.usu_idusuario) {
            // If it's not equal, throw a 403 error with the message 'Acesso não autorizado'
            throw error(403, 'Acesso não autorizado');
        }

        // Return the team information
        return team
    }

    // Return an object with the team information
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