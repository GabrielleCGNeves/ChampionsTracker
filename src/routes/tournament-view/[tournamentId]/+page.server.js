import { fail, error } from '@sveltejs/kit';
import { prisma } from '$lib/server/prisma'
import { redirect } from 'sveltekit-flash-message/server';

/** @type {import('./$types').Actions} */
export const actions = {
    requestEntry: async (event) => {
        const { equipePedido } = Object.fromEntries(await event.request.formData());

        if (!equipePedido) {
            return fail(500, {message: "Equipe não selecionada"});
        }

        const pedidoExists = await prisma.PedidoCampeonato.findFirst({
            where: {
                campeonatoId: Number(event.params.tournamentId),
                equipeId: Number(equipePedido)
            }
        });

        if (pedidoExists) {
            return fail(500, {message: "Esta equipe ja foi pedida"});
        }

        const equipeCampeonato = await prisma.EquipeDoCampeonato.findFirst({
            where: {
                campeonatoId: Number(event.params.tournamentId),
                equipeId: Number(equipePedido)
            }
        })

        if (equipeCampeonato){
            return fail(500, {message: "Esta equipe ja está no campeonato"});
        }

        try {
            await prisma.PedidoCampeonato.create({
                data: {
                    campeonatoId: Number(event.params.tournamentId),
                    equipeId: Number(equipePedido)
                }
            });
            
        } catch (error) {
            return fail(500, {message: "Não foi possivel pedir a participação"});
        }

        throw redirect(`/tournament-view/${event.params.tournamentId}`, { type:"success", message:"Pedido Enviado" }, event)
    },
    removeTeam: async (event) => {
        const { equipeId } = Object.fromEntries(await event.request.formData());

        if (!equipeId) {
            console.log("NÃO FUNCIONOU!");
            return fail(500, {message: "Equipe não selecionada"});
        }

        const equipeCampeonato = await prisma.EquipeDoCampeonato.findFirst({
            where: {
                campeonatoId: Number(event.params.tournamentId),
                equipeId: Number(equipeId)
            }
        });

        try {
            await prisma.EquipeDoCampeonato.delete({
                where: {
                    id: Number(equipeCampeonato.id)
                }
            });
            
        } catch (error) {
            console.log("Não foi possivel remover a participação\n" + error);
            return fail(500, {message: "Não foi possivel remover a participação"});
        }
        throw redirect(`/tournament-view/${event.params.tournamentId}`, { type:"success", message:"Equipe removida com sucesso" }, event)
    }
};