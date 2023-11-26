<script>
    
    import TournamentTeamImage from '$lib/components/tournament/TournamentTeamImage.svelte';
    import Butao from "$lib/components/Butao.svelte";
    import Modal from "$lib/components/Modal.svelte";
    import toast from "svelte-french-toast"
    import { page } from "$app/stores";
    import { enhance } from "$app/forms";

    let showModal = false;
    

    export let data
    $: ({ equipes, campeonato, owner, equipesUsuario } = data);

    const handleToast = () => {
        return async ({ result, update }) => {
            switch (result.type) {
                case 'success':
                    toast.success("Pedido enviado com sucesso")
                    break;
                case 'failure':
                    toast.error(result.data.message)
                    break;
            
                default:
                    break;
            }
            await update();
        }
    }

    function checkOwnership(ownerId) {
        return $page.data.user.id === ownerId
    }

</script>

    <div class="tournament-content">
        <div class="tournament-content-left">
            <div class="tournament-rules">
                <h3>Descrição</h3>
                <p>
                    {campeonato.descricao}
                </p>
            </div>
            <div class="tournament-teams">
                <h3>Equipes Inscritas</h3>
                <div class="team-list">
                    {#each equipes as equipe}
                        <form action="?/removeTeam" method="post">
                            <input name="equipeId" type="text" hidden value={equipe.id}>
                            <TournamentTeamImage editable={checkOwnership(owner.id)} foto={equipe.foto} nome={equipe.nome}/>
                        </form>
                    {/each}
                </div>
            </div>
        </div>
        <div class="tournament-content-right">
            <h3>Informações</h3>
            <div class="tournament-info">
                <!-- faz um .map aqui pra carregar as informações depois -->
                <div class="text-reset">
                    <span>Equipes participando:</span>
                    <span>{equipes.length}</span>
                </div>
                <!-- <div class="text-reset">
                    <span>Participantes:</span>
                    <span>5</span>
                </div>
                <div class="text-reset">
                    <span>Fechamento dos palpites:</span>
                    <span>13/04/2023</span>
                </div>
                <div class="text-reset">
                    <span>Palpitador com mais pontos:</span>
                    <span>Nicolau Kardash</span>
                </div>
                <div class="text-reset">
                    <span>Melhor jogador:</span>
                    <span>Erick Santos</span>
                </div> -->
            </div>
        </div>
        <div class="request-entry">
            <Butao
                ref="modal"
                onClick={() => (showModal = true)}
                texto={"PEDIR PARTICIPAÇÃO"}
            />
        </div>
    </div>
    <form action="?/requestEntry" method="post" use:enhance={handleToast}>
        <Modal bind:showModal>
            <h2 slot="header">Pedir Participação</h2>
            <div class="user-equipes">
                {#each equipesUsuario as equipe}
                    <div class="user-equipe">
                        <label for="{equipe.id}">{equipe.nome}</label>
                        <input type="radio" name="equipePedido" value={equipe.id} id="">
                    </div>
                {/each}
            </div>
            {#if $page.data.user}
            <div class="submit-button-user-equipes">
                <Butao ref="modal" tipo="submit" texto={"PEDIR"} />
            </div>
            {/if}
        </Modal>
    </form>



<style> 
    .submit-button-user-equipes {
        display: flex;
        justify-content: center;
        width: 100%;
        margin-top: 15px;
    }
    .user-equipes {
        display: flex;
        flex-direction: column;
        gap: 10px;
        text-align: end;
    }
    .request-entry {
        display: flex;
        justify-content: center;
        width: 100%;
    }
    :global([ref="modal"]) {
        background-color: var(--secondary-color);
    }

    .tournament-content-right {
        display: flex;
        flex-direction: column;
        gap: 5px;
    }
    
    .tournament-info {
        border-radius: 25px;
        background-color: var(--secondary-color);
        display: flex;
        flex-direction: column;
        padding: 20px 30px 20px 30px;
        gap: 12px;
    }
    
    .text-reset {
        display: flex;
        align-items: center;
        gap: 8px;
        font-size: 17px;
    }

    .text-reset > span:last-child {
        opacity: 60%;
    }

    .tournament-content-left {
        width: 70vw;
        /* border: red solid 1px; */
    }
        
    .tournament-content {
        display: flex;
        justify-content: space-between;
        flex-wrap: wrap;
        padding: 30px;
        gap: 30px;
        /* border: red solid 1px; */
    }
    
    .team-list {
        padding: 20px;
        border-radius: 25px;
        background-color: #1A2032;
        display: flex;
        gap: 10px;
    }


    /* Medium devices (tablets, less than 992px) */
    @media (max-width: 991.98px) {
        .tournament-content-left {
            width:100vw;
        }
    }
</style>
