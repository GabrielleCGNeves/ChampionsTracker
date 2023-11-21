<script>
    import Butao from "$lib/components/Butao.svelte";
    import { enhance } from "$app/forms";
    import { writable } from "svelte/store";

    export let equipes;
</script>

<div class="tournament-requests">
    <form method="post">
        <table id="myTable">
            <thead>
                <tr>
                    <td>IMAGEM</td>
                    <td>NOME DA EQUIPE</td>
                    <td>NUMERO DE JOGADORES</td>
                    <td>DECISÃO</td>
                </tr>
            </thead>
            <tbody>
                {#each equipes as equipe, index (equipe.id)}
                    <tr>
                        <td
                            ><img
                                src={equipe.foto}
                                width="75"
                                alt=""
                                srcset=""
                            /></td
                        >
                        <td><p>{equipe.nome}</p></td>
                        <td>{equipe.numeroJogadores}</td>
                        <td>
                            <div class="radio-toolbar">
                                <input
                                    type="radio"
                                    id={`unknown-${index}`}
                                    name={equipe.id}
                                    
                                    
                                    value=""
                                />
                                <label for={`unknown-${index}`}
                                    >Não decidido</label
                                >

                                <input
                                    type="radio"
                                    id={`approve-${index}`}
                                    name={equipe.id}
                                    
                                    
                                    value="approve"
                                />
                                <label for={`approve-${index}`}>Aprovar</label>

                                <input
                                    type="radio"
                                    id={`deny-${index}`}
                                    name={equipe.id}
                                    
                                    
                                    value="reject"
                                />
                                <label for={`deny-${index}`}>Recusar</label>
                            </div>
                        </td>
                    </tr>
                {/each}
            </tbody>
        </table>
        <div class="btn-group">
            <Butao
                ref="sendRequest"
                texto={"Salvar Alterações"}
                tipo="submit"
                data-sveltekit-reload
            />
        </div>
    </form>
</div>

<style>
    :global([ref="sendRequest"]) {
        background-color: var(--secondary-color);
    }
    :global([ref="sendRequest"]):hover {
        background-color: var(--quaternary-color);
    }

    .tournament-requests {
        padding: 20px;
        border-radius: 25px;
        background-color: #1a2032;
    }

    table {
        width: 100%;
    }

    .radio-toolbar {
        margin: 10px;
    }

    .radio-toolbar input[type="radio"] {
        opacity: 0;
        position: fixed;
        width: 0;
    }

    .radio-toolbar label {
        display: inline-block;
        background-color: var(--secondary-color);
        padding: 4px 12px;
        font-size: 14px;
        border: 2px solid var(--primary-color);
    }
    .radio-toolbar label:first-of-type {
        border-top-left-radius: 10px;
        border-bottom-left-radius: 10px;
    }
    .radio-toolbar label:nth-of-type(2) {
        position: relative;
        left: -6px;
    }
    .radio-toolbar label:last-of-type {
        border-top-right-radius: 10px;
        border-bottom-right-radius: 10px;
        position: relative;
        left: -12px;
    }

    .radio-toolbar label:hover {
        background-color: var(--weak-gold-color);
        color: black;
    }

    .radio-toolbar input[type="radio"]:checked + label {
        background-color: var(--gold-color);
        border-color: #644600;
        color: black;
    }

    .btn-group {
        margin-top: 10px;
    }
</style>
