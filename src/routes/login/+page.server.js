import { fail, redirect } from '@sveltejs/kit'
import bcrypt from 'bcrypt'
import { prisma } from '$lib/server/prisma'

/** @type {import('./$types').Actions} */
export const actions = {
    default: async ({ cookies, request }) => {
        const { email, password } = Object.fromEntries(await request.formData())

        const user = await prisma.Usuario.findUnique({ where: { email: email } })

        if (!user) {
            return fail(400, { invalid: true })
        }

        const userPassword = await bcrypt.compare(password, user.passwordHash)

        if (!userPassword) {
            return fail(400, { credentials: true })
        }

        const authenticatedUser = await prisma.Usuario.update({
            where: { email: user.email },
            data: { authToken: crypto.randomUUID() },
        })

        cookies.set('session', authenticatedUser.authToken, {
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