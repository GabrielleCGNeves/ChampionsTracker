import { fail, redirect } from '@sveltejs/kit'
import { prisma } from '$lib/server/prisma'
import { z } from 'zod'
import bcrypt from 'bcrypt'
import { setError, superValidate } from 'sveltekit-superforms/server'

const userSchema = z.object({
    nome: z.string().min(1, {message: 'O nome deve ter pelo menos 1 caractere'}),
    apelido: z.string().min(3, {message: 'O apelido deve ter pelo menos 3 caracteres'}),
    email: z.string().email({message: 'Email invalido'}),
    password: z.string().min(6, {message: 'A senha deve ter pelo menos 6 caracteres'}),
    confirmPassword: z.string().min(6, {message: 'A senha deve ter pelo menos 6 caracteres'})
})
.refine(data => data.password === data.confirmPassword, {
    message: ' As senhas precisam ser iguais',
    path: ['confirmPassword']
})

export const load = async ({ locals }, event) => {
    // redirect user if logged in
    if (locals.user) {
        throw redirect(302, '/home')
    }

    const form = await superValidate(event, userSchema)

    return { 
        form 
    }
}

/** @type {import('./$types').Actions} */
export const actions = {
    default: async (event) => {
        const form = await superValidate(event, userSchema)

        const { nome, apelido, email, password } = form.data
        
        if (!form.valid) {
            return fail(400, { form })
        }
        
        if (await prisma.Usuario.findUnique({ where: { email } })) {
            return setError(form, 'email', 'Email ja existe')
        }

        if (await prisma.Usuario.findUnique({ where: { apelido } })) {
            return setError(form, 'apelido', 'Apelido ja existe')
        }

        try {
            await prisma.Usuario.create({
                data: {
                    nome,
                    apelido,
                    email,
                    passwordHash: await bcrypt.hash(password, 10),
                    foto: `https://api.dicebear.com/7.x/lorelei/svg?seed=${nome}?backgroundColor=b6e3f4,c0aede,d1d4f9`,
                    authToken: crypto.randomUUID(),
                    pontosTotais: 0,
                }
            })
        } catch (err) {
            console.error(err)
            return fail(400, { message: 'Não foi possivel registrar o usuario' })
        }
        throw redirect(302, '/login')
    }
};