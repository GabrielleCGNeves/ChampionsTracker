<script>
    import Butao from "$lib/components/Butao.svelte";
    import ImageUploader from "$lib/components/ImageUploader.svelte";
    import { open_modal } from "./modal.js";
    
    let receivedImage = "";
    export let form;

</script>
<main class="main-content">
    <p class="page-title">CADASTRO</p>

    <div class="grid-container">
        <Butao ref="team" texto={"EQUIPE"} />
        <Butao ref="champion" texto={"CAMPEONATO"} />
    </div>

    <br />
    <br />

    

    <form action="?/createTeam" method="POST" class="forms">
        <div class="flex">
            <div>
                <input
                    type="text"
                    class="input-name input-border input-block"
                    name="teamName"
                    placeholder="Nome da Equipe"
                />
        
                <label for="">Nº de Jogadores</label>
                <input
                    type="number"
                    class="input-border input-number"
                    name="teamNumber"
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
        />

        <br />

        <!-- Modal Start -->
        <!-- <div class="modal-container" id="modal-visibility">
            <div class="modal">
                <div class="modal-header grid-container">
                    <a href="">Adicionar Jogador</a>
                </div>
                <div class="modal-content">
                    <p class="text">Adicione um jogador caso o mesmo não possua uma conta</p>
                </div>
            </div>
        </div> -->
        <!-- <div class="modal-container" id="modal-visibility">
            <div class="modal">
                <div class="modal-header grid-container">
                    <a href="">Adicionar Jogador</a>
                </div>
                <div class="modal-content">
                    <p class="text">Adicione um jogador caso o mesmo não possua uma conta</p>
                </div>
            </div>
        </div> -->
        <!-- Modal End -->
        
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
