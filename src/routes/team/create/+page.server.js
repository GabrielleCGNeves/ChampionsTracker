import { prisma } from '$lib/server/prisma'
import { fail } from "@sveltejs/kit"

export const actions = {
    createTeam: async ({ locals, request }) => {
        const data = await request.formData()
        console.log("🚀 ~ file: +page.server.js:7 ~ createTeam: ~ data:", data)
        const name = data.get("teamName")
        const number = parseInt(data.get("teamNumber"))
        const description = data.get("teamDescription")
        const image = data.get("image") 
 

        try {
            await prisma.Equipe.create({
                data: {
                    usuarioId: locals.user.id,
                    nome: name,
                    numeroJogadores: number,
                    descricao: description,
                    foto: image,
                    pontosTotais: 0
                }
            })
        } catch (error) {
            console.error(error);
            return fail(500, { message: "Não foi possível criar a equipe" })
        }
        return {
            status: 201
        }
    },
}