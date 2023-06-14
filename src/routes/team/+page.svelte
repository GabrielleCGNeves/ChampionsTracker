<script>
    import Butao from "$lib/components/Butao.svelte";
    import { open_modal } from "./modal.js";
</script>

<main class="main-content">
    <p class="page-title">CADASTRO</p>

    <div class="grid-container">
        <Butao ref="team" texto={"EQUIPE"} />
        <Butao ref="champion" texto={"CAMPEONATO"} />
    </div>

    <br>
    <br>

    <form action="POST" class="forms">
        <input type="text" class="input-border" name="teamName" placeholder="Nome da Equipe">
        
        <br>

        <label for="">Nº de Jogadores</label>
        <input type="number" class="input-border input-number" name="teamNumber">

        <br>
        
        <div class="grid-container">
            <Butao ref="player" on:click={open_modal} texto={"ADICIONAR JOGADORES"} />
            <input type="text" class="input input-player" name="idPlayer">
        </div>

        <br>

        <textarea name="teamDescription" class="textfield" cols="70" rows="10" placeholder="Descrição"></textarea>
        
        <br>

        <!-- Modal Start -->
        <div class="modal-container" id="modal-visibility">
            <div class="modal">
                <div class="modal-header grid-container">
                    <a href="">Adicionar Jogador</a>
                </div>
                <div class="modal-content">
                    <p class="text">Adicione u jogador caso o mesmo não possua uma conta</p>
                </div>
            </div>
        </div>
        <!-- Modal End -->
        
        <Butao ref="save" texto={"SALVAR"} />
    </form>
</main>


<style>

    .input-player{
        width: 57%
    }

    .input-number{
        width: 10%;
        font-style: normal;
        
    }

    main {
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
    }
    
    :global([ref=team]) {
        background-color: var(--secondary-color);
    }
    :global([ref=champion]) {
        background-color: var(--tertiary-color);
    }
    :global([ref=player]) {
        background-color: var(--tertiary-color);
        width: 10rem;
    }
    :global([ref=save]) {
        background-color: var(--tertiary-color);
        margin-top: 2.5rem;
    }
</style>