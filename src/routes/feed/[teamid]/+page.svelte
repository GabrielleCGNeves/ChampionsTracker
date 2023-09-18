<script>
    import Butao from "$lib/components/Butao.svelte";
    import ImageUploader from "$lib/components/ImageUploader.svelte";
    
    let receivedImage = "";

    export let data

    $: ({ equipe } = data);
    
</script>
<main class="main-content">
    <p class="page-title">Editando {equipe.equ_nome}</p>

    <br />
    <br />

    <form action="?/updateTeam" method="POST" class="forms">
        <div class="flex">
            <div>
                <input
                    type="text"
                    class="input-name input-border input-block"
                    name="teamName"
                    placeholder="Nome da Equipe"
                    value={equipe.equ_nome}
                />
        
                <label for="">Nº de Jogadores</label>
                <input
                    type="number"
                    class="input-border input-number"
                    name="teamNumber"
                    value={equipe.equ_numjogadores}
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
            name="teamDescription"
            class="textfield"
            cols="70"
            rows="10"
            placeholder="Descrição"
            value={equipe.equ_desc}
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
