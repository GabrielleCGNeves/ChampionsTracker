import { fail, redirect } from '@sveltejs/kit'
import bcrypt from 'bcrypt'
import { prisma } from '$lib/server/prisma'

/** @type {import('./$types').Actions} */
export const actions = {
    default: async ({ cookies, request }) => {
        const { email, password } = Object.fromEntries(await request.formData())

        const user = await prisma.tb_usuario.findUnique({ where: { usu_email: email } })

        if (!user) {
            return fail(400, { credentials: true })
        }

        const userPassword = await bcrypt.compare(password, user.usu_passwordHash)

        if (!userPassword) {
            return fail(400, { credentials: true })
        }

        const authenticatedUser = await prisma.tb_usuario.update({
            where: { usu_email: user.usu_email },
            data: { usu_authToken: crypto.randomUUID() },
        })

        cookies.set('session', authenticatedUser.usu_authToken, {
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
            maxAge: 60 * 60 * 24 * 30,
        })

        throw redirect(302, '/')
    }
};