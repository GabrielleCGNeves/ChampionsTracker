<script>
    import Butao from "$lib/components/Butao.svelte";
    import ImageUploader from "$lib/components/ImageUploader.svelte";
    import Modal from "$lib/components/Modal.svelte";
    import { superForm } from "sveltekit-superforms/client";
    import SuperDebug from "sveltekit-superforms/client/SuperDebug.svelte";
    import Title from "$lib/components/Title.svelte";
    
    let showModal = false;
    
    let receivedImage = "";

    export let data
    const { form, enhance } = superForm(data.form, {
        customValidity: true,
        validators: data.validators
    })

</script>
<Title title="Criar Equipe"/>
<main class="main-content">
    <p class="page-title">CADASTRO</p>
    
    <div class="grid-container">
        <Butao ref="team" texto={"EQUIPE"} link="/team/create" />
        <Butao ref="champion" texto={"CAMPEONATO"} link="/tournament/create" />
    </div>
    
    <br />
    <br />
    
    
    <form action="?/createTeam" method="POST" class="forms" use:enhance>
        <div class="flex">
            <div>
                <input
                    type="text"
                    class="input-name input-border input-block"
                    name="teamName"
                    placeholder="Nome da Equipe"
                    bind:value={$form.teamName}
                />
        
                <label for="">Nº de Jogadores</label>
                <input
                    type="number"
                    class="input-border input-number"
                    name="teamNumber"
                    min="1"
                    bind:value={$form.teamNumber}
                />
            </div>
            <ImageUploader on:message={e => receivedImage = e.detail}/>
            <input type="text" name="image" bind:value={receivedImage} style="display: none;">
        </div>

        <!-- <br />

        <div class="grid-player">
            <Butao
                ref="player"
                onClick={() => showModal = true}
                texto={"ADICIONAR JOGADORES"}
            />
                <input type="text" class="input input-player" name="idPlayer" />
            
        </div>

        <Modal bind:showModal>
            <h1 slot="header">Criar Jogador</h1>
            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Quasi modi perspiciatis tempore debitis autem consequatur dicta corrupti recusandae eveniet, est consequuntur labore ipsam accusantium, hic facere pariatur molestias suscipit eligendi.</p>
        </Modal> -->

        <br />

        <textarea
            name="teamDescription"
            class="textfield"
            cols="70"
            rows="10"
            placeholder="Descrição"
            bind:value={$form.teamDescription}
        />

        <br />
        
        <Butao ref="save" texto={"SALVAR"} tipo="submit" />
    </form>

</main>

<style>
    .grid-player{
        align-items: center;
        display: flex;
        gap: 1rem;
    }

    .flex {
        align-items: center;
    }
    .input-name {
        width: 16rem;
        margin-top: 0;
    }
    .input-player {
        margin: 0;
        width: 100%;
    }

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
        width: 15rem;
    }
    :global([ref="save"]) {
        background-color: var(--tertiary-color);
        margin-top: 2.5rem;
    }
</style>
