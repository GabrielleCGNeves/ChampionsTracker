import { prisma } from '$lib/server/prisma'
import { fail, redirect } from "@sveltejs/kit"
import { z } from "zod"
import { setError, superValidate } from 'sveltekit-superforms/server'

const schema = z.object({
    teamName: z.string().min(5, { message: "O nome deve ter pelo menos 5 caracteres" }),
    teamNumber: z.number().min(1, { message: "A equipe deve ter pelo menos 1 jogador" }),
    teamDescription: z.string(),
})

export async function load(event) {
    const form = await superValidate(event, schema)

    return {
        form
    }
}

export const actions = {
    createTeam: async (event) => {
        const form = await superValidate(event, schema)
        const { teamName, teamNumber, teamDescription } = form.data

        if (!form.valid) {
            return fail(400, { form })
        }

        if(await prisma.Equipe.findFirst({ where: { nome: teamName }})) {
            return setError(form, 'teamName', 'Esta equipe já existe')
        }

        try {
            await prisma.Equipe.create({
                data: {
                    usuarioId: event.locals.user.id,
                    nome: teamName,
                    numeroJogadores: teamNumber,
                    descricao: teamDescription,
                    foto: `https://api.dicebear.com/7.x/identicon/svg?seed=${teamName}`,
                    pontosTotais: 0
                }
            })
        } catch (error) {
            console.error(error);
            return fail(500, { message: "Não foi possível criar a equipe" })
        }
        throw redirect(302, '/feed')
    },
}