import { fail, redirect } from '@sveltejs/kit'
import { prisma } from '$lib/server/prisma'
import bcrypt from 'bcrypt'


export const load = async ({ locals }) => {
    // redirect user if logged in
    if (locals.user) {
      throw redirect(302, '/')
    }
  }

/** @type {import('./$types').Actions} */
export const actions = {
    default: async ({ request }) => {
        const { usu_nome, usu_apelido, usu_email, password } = Object.fromEntries(await request.formData())

        try {
            await prisma.tb_usuario.create({
                data: {
                    usu_nome,
                    usu_apelido,
                    usu_email,
                    usu_passwordHash: await bcrypt.hash(password, 10),
                    usu_foto: "https://placehold.co/200x200/png?text=Placeholder",
                    usu_authToken: crypto.randomUUID(),
                    usu_pontostotais: 0,
                }
            })
        } catch (err) {
            console.error(err)
			return fail(400, { message: 'Não foi possivel registrar o usuario' })
        }
        throw redirect(302, '/login')
    }
};