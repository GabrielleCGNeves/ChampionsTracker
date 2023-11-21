import { fail } from '@sveltejs/kit'
import { redirect } from "sveltekit-flash-message/server"
import bcrypt from 'bcrypt'
import { prisma } from '$lib/server/prisma'
import { z } from 'zod'
import { setError, superValidate } from 'sveltekit-superforms/server'

const schema = z.object({
    email: z.string().email({message: 'Email invalido'}),
    password: z.string().min(6, {message: 'A senha deve ter pelo menos 6 caracteres'}),
    rememberMe: z.boolean().optional()
})

export const load = async ({ locals }, event) => {

    if (locals.user) {
        throw redirect(302, '/home')
    }

    const form = await superValidate(event, schema)

    return { 
        form 
    }
}

/** @type {import('./$types').Actions} */
export const actions = {
    default: async (event) => {
        const form = await superValidate(event, schema)
        const { email, password, rememberMe } = form.data

        const user = await prisma.Usuario.findUnique({ where: { email } })

        if (!form.valid) {
            return fail(400, { form })
        }

        if (!user) {
            return setError(form, 'email', 'O usuário não existe')
        }

        const userPassword = await bcrypt.compare(password, user.passwordHash)

        if (!userPassword) {
            return setError(form, 'password', 'Senha incorreta')
        }

        const authenticatedUser = await prisma.Usuario.update({
            where: { email: user.email },
            data: { authToken: crypto.randomUUID() },
        })

        event.cookies.set('session', authenticatedUser.authToken, {
            // send cookie for every page
            path: '/',
            // server side only cookie so you can't use `document.cookie`
            httpOnly: true,
            // only requests from same site can send cookies
            // https://developer.mozilla.org/en-US/docs/Glossary/CSRF
            sameSite: 'strict',
            // only sent over HTTPS in production
            secure: process.env.NODE_ENV === 'production',
            // set cookie to expire after a month
            maxAge: rememberMe ? 60 * 60 * 24 * 30 : undefined,
        })

        throw redirect('/home', { type:"success", message: "Logado com Sucesso!" }, event)
    }
};