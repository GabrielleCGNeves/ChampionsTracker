<script>
    import Butao from "$lib/components/Butao.svelte";
    import ImageUploaderChampion from "$lib/components/ImageUploaderChampion.svelte";
    
    
    let receivedImage = "";

    // import Modal from "$lib/components/Modal.svelte";
    // let isModalOpen = false;

    // function openModal() {
    //     isModalOpen = true;
    // }

    // function closeModal() {
    //     isModalOpen = false;
    // }

      //let showModal 
    
</script>


<main class="main-content">
    <p class="page-title">CAMPEONATO</p>

<div class="grid-container">
    <a href="team">
        <Butao ref="team" texto={"EQUIPE"} />
    </a>
    <a href="champion">
        <Butao ref="champion" texto={"CAMPEONATO"} />
    </a>
</div>

    <br /> 
    <br />

    <form action="?/createTeam" method="POST" class="forms">
        <div class="center">
            <div>
             <ImageUploaderChampion on:message={e => receivedImage = e.detail}/>
            <input type="text" name="image" bind:value={receivedImage} style="display: none;">
            </div>

<br/>
<br/>
            <div class="center">
                <input
                    type="text"
                    class="input-name input-border input-block"
                    name="teamName"
                    placeholder="Nome"
                />
                </div>
            </div>
            <div class="center">
            <textarea
        name="teamCode"
        class="textf"
        cols="20"
        placeholder="Código da equipe"
    />
        </div>
                <div class="center">

                <Butao ref="save" texto={"ADICIONAR EQUIPE"} 
                />

        <br />
        <br />

        <textarea
            name="teamDescription"
            class="textfield"
            cols="70"
            rows="10"
            placeholder="Descrição"
        />
        <br/>
<div class="flex">
 <button class="butao" type="button" >ADICIONAR REGRAS</button>
</div>

<!-- Abaixo, um código que é necessário adicionar na classe "butao" do "ADICIONAR REGRAS" para abrir o modal -->

<!-- on:click={() => showModal.show()} -->

<!-- <Modal bind:this={showModal}>
</Modal> -->

 <div class="center">
    <b class="rules">Nenhuma regra adicionada</b>
</div> 

<Butao ref="save" texto={"SALVAR"}/>

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
        
        
    </form>
    
    <!-- <button on:click={openModal}>Abrir Modal</button>
    <Modal bind:isOpen={isModalOpen} title="Meu Modal" close={closeModal}>
        <p>Conteúdo do modal aqui.</p>
    </Modal> -->
</main>

<style>
    .flex {
        align-items: center;

    }

    .butao{
        background-color: #04031F;
        color: #FFFFFF;
        padding: 0.75rem 1.5rem;
        font-size: 0.75rem;
        font-weight: bold;
        border-radius: 0.5rem;
        border-color: #04031F;
        border-style: none;
        text-decoration: none;
    }

    /* texto regras */

    .rules {
        background-color: var(--forms-color);
    font-style: italic;
    color: var(--text-color);
    border-style: none;
    margin: 20px;
    font-size: 11px;
    }

    .center {
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        margin: -1px;
    }

    
    /* costumização do label "código de equipe" */

.textf {
    background-color: var(--forms-color);
    font-style: italic;
    color: var(--text-color);
    border-style: none;
    margin: 20px;
    height: 3vh;
    
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

