import { fail, redirect } from '@sveltejs/kit'
import { prisma } from '$lib/server/prisma'
import { z } from 'zod'
import bcrypt from 'bcrypt'
import { superValidate } from 'sveltekit-superforms/server'

const userSchema = z.object({
    nome: z.string().min(1),
    apelido: z.string().min(3),
    email: z.string().email(),
    password: z.string().min(6),
    confirmPassword: z.string().min(6)
})
.refine(data => data.password === data.confirmPassword, {
    message: 'Passwords do not match',
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

        if (!form.valid) {
            return fail(400, { form })
        }

        const { nome, apelido, email, password } = form.data

        try {
            await prisma.Usuario.create({
                data: {
                    nome,
                    apelido,
                    email,
                    passwordHash: await bcrypt.hash(password, 10),
                    foto: "https://placehold.co/200x200/png?text=Placeholder",
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