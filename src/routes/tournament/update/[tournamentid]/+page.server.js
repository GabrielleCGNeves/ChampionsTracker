import { prisma } from "$lib/server/prisma";
import { error } from "@sveltejs/kit"

export const load = async ({ locals, params }) => {
    // Check if the user is authenticated
    if (!locals.user) {
        // If not, throw a redirect exception to the home page
        throw redirect(302, '/login')
    }

    // Define an async function to get the team information
    const getTournament = async () => {
        // Retrieve the team from the database based on the team ID
        const tournament = await prisma.Campeonato.findUnique({
            where: {
                id: Number(params.tournamentid)
            }
        })

        // If the team is not found, throw an exception with a 404 status code
        if (!tournament) {
            throw error(404, 'Equipe não encontrada')
        }

        // Check if the user's ID is not equal to the team's user ID
        if (locals.user.id != tournament.usuarioId) {
            // If it's not equal, throw a 403 error with the message 'Acesso não autorizado'
            throw error(403, 'Acesso não autorizado');
        }

        // Return the team information
        return tournament
    }

    // Return an object with the team information
    return {
        equipe: getTournament(),
    }
}

export const actions = {
    updateTournament: async ({ request, params }) => {
        const { tournamentName, tournamentDescription, regraId } = Object.fromEntries(await request.formData());


        try {
            await prisma.Campeonato.update({
                where: {
                    id: Number(params.teamid)
                },
                data: {
                    nome: tournamentName,
                    descricao: tournamentDescription,
                    regraId: parseInt(regraId)
                    
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