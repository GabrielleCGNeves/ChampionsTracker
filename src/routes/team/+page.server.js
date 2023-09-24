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
            await prisma.tb_equipe.create({
                data: {
                    usu_idusuario: locals.user.id,
                    equ_nome: name,
                    equ_numjogadores: number,
                    equ_desc: description,
                    equ_foto: image,
                    equ_pontostotais: 0
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