<script>
    import Butao from "$lib/components/Butao.svelte";
    import ImageUploader from "$lib/components/ImageUploader.svelte";
    import { superForm } from "sveltekit-superforms/client";
    import SuperDebug from "sveltekit-superforms/client/SuperDebug.svelte";
    
    let receivedImage = "";

    export let data

    // $: ({ equipe } = data);

    const { form, enhance } = superForm(data.form, {
        customValidity: true,
        validators: data.validators
    })
    
</script>
<main class="main-content">
    <p class="page-title">Editando Equipe</p>

    <br />
    <br />

    <form action="?/updateTeam" method="POST" class="forms">
        <div class="flex">
            <div>
                <input
                    type="text"
                    class="input-name input-border input-block"
                    name="nome"
                    placeholder="Nome da Equipe"
                    bind:value={$form.nome}
                />
        
                <label for="">Nº de Jogadores</label>
                <input
                    type="number"
                    class="input-border input-number"
                    name="numeroJogadores"
                    bind:value={$form.numeroJogadores}
                />
            </div>
            <ImageUploader on:message={e => receivedImage = e.detail}/>
            <input type="text" name="image" bind:value={receivedImage} style="display: none;">
        </div>

        <br />

        <!-- <div class="grid-container">
            <Butao
                ref="player"
                on:click={open_modal}
                texto={"ADICIONAR JOGADORES"}
            />
            <input type="text" class="input input-player" name="idPlayer" />
        </div> -->

        <br />

        <textarea
            name="descricao"
            class="textfield"
            cols="70"
            rows="10"
            placeholder="Descrição"
            bind:value={$form.descricao}
        />

        <br />

            
        <Butao ref="save" texto={"SALVAR"} tipo="submit" />
    </form>
</main>

<style>
    .flex {
        align-items: center;
    }
    .input-name {
        width: 16rem;
        margin-top: 0;
    }
    /* .input-player {
        width: 57%;
    } */

    .input-number {
        width: 10%;
        font-style: normal;
    }

    main {
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
    }

    :global([ref="team"]) {
        background-color: var(--secondary-color);
    }
    :global([ref="champion"]) {
        background-color: var(--tertiary-color);
    }
    :global([ref="player"]) {
        background-color: var(--tertiary-color);
        width: 10rem;
    }
    :global([ref="save"]) {
        background-color: var(--tertiary-color);
        margin-top: 2.5rem;
    }
</style>
