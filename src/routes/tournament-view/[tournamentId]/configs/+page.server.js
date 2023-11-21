import { error, fail } from "@sveltejs/kit";
import { prisma } from "$lib/server/prisma";
import { redirect } from "sveltekit-flash-message/server"

/** @type {import('./$types').PageLoad} */
export async function load({ locals, params }) {

    if (!locals.user) {
        throw redirect(302, '/login');
    }

    const campeonato = await prisma.Campeonato.findUnique({
        where: {
            id: Number(params.tournamentId)
        }
    });

    if (!campeonato) {
        throw error(404, 'Campeonato não encontrado');
    }

    if (campeonato.usuarioId !== locals.user.id) {
        throw error(403, 'Acesso negado');
    }

    const pedidos = await prisma.PedidoCampeonato.findMany({
        where: {
            campeonatoId: Number(params.tournamentId)
        },
        include: {
            equipe: true
        }
    });

    return {
        equipesPedintes: pedidos.map(pedido => pedido.equipe)
    };
}

/** @type {import('./$types').Actions} */
export const actions = {
    default: async ({ request, params }) => {
        const data = Object.fromEntries(await request.formData());
        const dataArray = Object.entries(data);

        if (!data) {
            return fail(500, { message: "Invalid Request" });
        }
        const campeonato = await prisma.Campeonato.findUnique({
            where: {
                id: Number(params.tournamentId)
            }
        });

        dataArray.forEach(async ([id, decision]) => {
            const pedidos = await prisma.PedidoCampeonato.findMany({
                where: {
                    campeonatoId: Number(params.tournamentId),
                    equipeId: Number(id)
                }
            })
            const pedido = pedidos[0];

            switch (decision) {
                case "approve":
                    try {
                        await prisma.$transaction([
                            prisma.PedidoCampeonato.delete({
                                where: {
                                    id: Number(pedido.id)
                                }
                            }),
    
                            prisma.EquipeDoCampeonato.create({
                                data: {
                                    campeonatoId: Number(params.tournamentId),
                                    equipeId: Number(id),
                                    pontosTotais: 0
                                }
                            })
                        ])
                    } catch (error) {
                        console.log(error);
                        return fail(500, { message: `Não foi possível aceitar a equipe` });
                    }
                    break;
                case "reject":
                    try {
                        await prisma.PedidoCampeonato.delete({
                            where: {
                                id: Number(pedido.id)
                            }
                        });
                    } catch (error) {
                        console.log(error);
                        return fail(500, { message: `Não foi possivel recusar a equipe` });
                    }
                    break;
                default:
                    console.log("Nenhuma decisão feita");
                    break;
            }
        });
        throw redirect(`/tournament-view/${params.tournamentId}`, {type:"success", message: "Equipes Configuradas"});
    }
};