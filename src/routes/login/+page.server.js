// import { mysqlconnFn } from "$lib/db/mysql";

// export async function load() {
//   let mysqlconn = await mysqlconnFn();
//   try {
//     let results = await mysqlconn
//       .query("SELECT * FROM tb_usuario;")
//       .then(function ([rows, fields]) {
//                console.log(rows);
//         return rows;
//       });

//     return {
//       data: results,
//     };
//   } catch (error) {
//     console.error("Got an error!!!");
//     console.log(error);
//     return error;
//   }
// }

import { prisma } from '$lib/server/prisma'
import { fail } from "@sveltejs/kit"

export const actions = {
    createUser: async ({ request }) => {
        const { email, senha } = Object.fromEntries(await request.formData())
        
        try {
            await prisma.tb_usuario.create({
                data: {
                    email,
                    senha
                }
            })
        } catch (err) {
            console.error(err)
            return fail(500, ('Erro ao cadastrar usuário'))
        }
        return {
            status: 201
        }
    }

}