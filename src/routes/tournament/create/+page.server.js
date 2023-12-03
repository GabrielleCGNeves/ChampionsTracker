import { prisma } from '$lib/server/prisma'
import { fail, redirect } from "@sveltejs/kit"

const atributo = []
const pontoAtributo = []
const atributosData = []

/** @type {import('./$types').PageLoad} */
export async function load({ locals }) {
    if (!locals.user) {
        throw redirect(302, '/login')
    }
    
    const regras = await prisma.Regra.findMany({
        where: {
            usuarioId: locals.user.id
        }
    })

    return {
        regras
    }
}

/** @type {import('./$types').Actions} */
export const actions = {
    createRegra: async ({ locals, request }) => {
        const data = await request.formData();
        const groupName = data.get("grupoAtributo")

        for(const [key, value] of data.entries()){
            if(key === "atributo"){
                atributo.push(value)
            } else if (key === "pontoAtributo"){
                pontoAtributo.push(value)
            }
        }

        for (let i = 0; i < atributo.length; i++) {
            atributosData.push({
                nome: atributo[i],
                pontos: parseInt(pontoAtributo[i])
            });
        }

        console.log(atributosData);

        try {
            await prisma.Regra.create({
                data: {
                    usuarioId: locals.user.id,
                    nome: groupName,
                    RegraAtributo: {
                        createMany: {
                            data: atributosData
                        }
                    }
                },
                include: {
                    RegraAtributo: true
                }
            })
            
        } catch (error) {
            console.error(error);
            return fail(400, "Houve um erro ao criar a regra")
        }
    },
createTournament: async ({ locals, request }) => {
    const { tournamentName, tournamentDescription, tournamentGameName, regraId } = Object.fromEntries(await request.formData());


    if (await prisma.Campeonato.findFirst({ where: { nome: tournamentName } })) {
        console.log('Tournament already exists:', tournamentName);
        return fail(400, 'Este torneio ja existe');
    }

    try {
        await prisma.Campeonato.create({
            data: {
                usuarioId: locals.user.id,
                regraId: parseInt(regraId),
                jogo: tournamentGameName,
                nome: tournamentName,
                descricao: tournamentDescription,
                foto: `https://placehold.co/600x400/black/white?text=${tournamentName}`,
                status: "ATIVO"
            }
        });
    } catch (error) {
        console.error('Error creating tournament:', error);
        return fail(400, "Houve um erro ao criar o torneio");
    }

    console.log('Redirecting to /feed');
    throw redirect(302, '/feed');
}
};