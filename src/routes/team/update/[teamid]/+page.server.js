import { prisma } from "$lib/server/prisma";
import { fail, error, redirect } from "@sveltejs/kit"
import { setError, superValidate } from "sveltekit-superforms/server";
import { z } from "zod";    

const schema = z.object({
    nome: z.string().min(5, { message: "O nome deve ter pelo menos 5 caracteres" }),
    numeroJogadores: z.number().min(1, { message: "A equipe deve ter pelo menos 1 jogador" }),
    descricao: z.string(),
})

export const load = async ({ locals, params }) => {
    
    if (!locals.user) {
        throw redirect(302, '/login')
    }


    const team = await prisma.Equipe.findUnique({
        where: {
            id: Number(params.teamid)
        }
    })
    
    if (!team) {
        throw error(404, 'Equipe não encontrada')
    }

    if (locals.user.id != team.usuarioId) {

        throw error(403, 'Acesso não autorizado');
    }


    const form = await superValidate(team, schema)

    return {
        form
    }
}

export const actions = {
    updateTeam: async (event) => {
        const form = await superValidate(event, schema)
        const { nome, numeroJogadores, descricao } = form.data
        
        if (!form.valid) {
            return fail(400, { form })
        }

        if(await prisma.Equipe.findFirst({ where: { nome: nome }})) {
            return setError(form, 'nome', 'Esta equipe já existe')
        }

        try {
            await prisma.Equipe.update({
                where: {
                    id: Number(event.params.teamid)
                },
                data: {
                    nome,
                    numeroJogadores,
                    descricao,
                    foto: `https://placehold.co/600x400/000000/FFFFFF/png?text=${nome.replace(/\s/g, '+')}`,
                    pontosTotais: 0
                }
            })
        } catch (error) {
            console.error(error);
            return fail(500, { message: "Não foi possível atualizar a equipe" })
        }
        throw redirect(302, '/feed')
    }
};