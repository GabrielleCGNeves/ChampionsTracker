<script>
    import Butao from "$lib/components/Butao.svelte";
    import Modal from "$lib/components/Modal.svelte";
    import { writable } from "svelte/store";
    import { page } from "$app/stores";
    import ImageUploader from "$lib/components/ImageUploader.svelte";
    import { enhance } from "$app/forms";
    import Title from "$lib/components/Title.svelte";

    export let data;

    let receivedImage = "";
    let showRegras = false;
    let showAddRegras = false;
    let selectedRegra;

    $: ({ regras } = data);

    const addRegra = () => {
        numRows = [...numRows, $counter++];
    };

    // https://stackoverflow.com/questions/68688341/howto-add-another-component-on-button-click
    let numRows = [0];
    let counter = writable(1);

    const submitTournament = () => {
        return async ({ result, update }) => {
            switch (result.type) {
                case 'failure':
                    toast.error(result.data.message)
                    break;
            
                default:
                    break;
            }
            await update();
        }
    }

</script>
<Title title="Criar Campeonato" />
<main class="main-content">
    <p class="page-title">CAMPEONATO</p>

    <div class="grid-container">
        <Butao ref="champion" link="/team/create" texto={"EQUIPE"} />
        <Butao ref="team" link="./" texto={"CAMPEONATO"} />
    </div>

    <br />
    <br />

    <form action="?/createTournament" method="POST" class="forms" use:enhance={submitTournament}>
        <div class="center">
            <ImageUploader
                isLarge={true}
                on:message={(e) => (receivedImage = e.detail)}
            />
            <input
                type="text"
                name="image"
                bind:value={receivedImage}
                style="display: none;"
            />
        </div>

        <br />

        <div class="grid">
            <input
                type="text"
                class="input-border input-block"
                name="tournamentName"
                placeholder="Nome"
            />
        </div>
        <br />
        <div class="grid">
            <input
                type="text"
                class="input input-player"
                name="tournamentGameName"
                placeholder="Nome do Jogo"
            />
        </div>
        <div class="center">
            <br />

            <textarea
                name="tournamentDescription"
                class="textfield"
                cols="70"
                rows="10"
                placeholder="Descrição"
            />
            <br />
            <div class="grid">
                <Butao
                    ref="player"
                    onClick={() => (showRegras = true)}
                    texto={"ADICIONAR REGRA"}
                />
                {#if !selectedRegra}
                    <b class="rules">Nenhuma regra adicionada</b>
                {:else}
                    <b class="rules"
                        >{regras.find((r) => r.id == selectedRegra).nome}</b
                    >
                {/if}
            </div>

            <input
                name="regraId"
                type="text"
                style="display: none;"
                bind:value={selectedRegra}
            />
            <br />
        </div>

        <!-- TODO: Deletar regras-->
        <!-- MOSTRAR REGRAS -->
        <Modal bind:showModal={showRegras}>
            <h1 class="modalHeader" slot="header">REGRAS</h1>
            <div class="list">
                {#each regras as regra}
                    {#if regra.usuarioId == $page.data.user.id}
                        <div>
                            <span>{regra.nome}</span>
                            <button
                                type="button"
                                on:click={() => {
                                    selectedRegra = regra.id;
                                    console.log(selectedRegra);
                                }}
                            >
                                <svg
                                    width="25"
                                    height="25"
                                    viewBox="0 0 40 40"
                                    fill="none"
                                    xmlns="http://www.w3.org/2000/svg"
                                >
                                    <path
                                        d="M37.1429 15.7143H24.2857V2.85714C24.2857 1.27946 23.0063 0 21.4286 0H18.5714C16.9937 0 15.7143 1.27946 15.7143 2.85714V15.7143H2.85714C1.27946 15.7143 0 16.9937 0 18.5714V21.4286C0 23.0063 1.27946 24.2857 2.85714 24.2857H15.7143V37.1429C15.7143 38.7205 16.9937 40 18.5714 40H21.4286C23.0063 40 24.2857 38.7205 24.2857 37.1429V24.2857H37.1429C38.7205 24.2857 40 23.0063 40 21.4286V18.5714C40 16.9937 38.7205 15.7143 37.1429 15.7143Z"
                                        fill="#76809D"
                                    />
                                </svg>
                            </button>
                        </div>
                    {/if}
                {/each}
            </div>

            <div class="center">
                <Butao
                    ref="team"
                    texto={"NOVA REGRA"}
                    onClick={() => (showAddRegras = true)}
                />
            </div>
        </Modal>
        <div class="center">
            <Butao ref="team" tipo="submit" texto={"SALVAR"} />
        </div>
    </form>

    <!-- TODO: Contar Pontos -->
    <!-- ADICIONAR REGRAS NO PACK -->
    <form action="?/createRegra" method="post" use:enhance>
        <Modal bind:showModal={showAddRegras}>
            <input
                type="text"
                class="attribute-header"
                slot="header"
                name="grupoAtributo"
                placeholder="Nomear Conjunto"
            />
            <div class="pontos">
                <!-- https://stackoverflow.com/questions/68688341/howto-add-another-component-on-button-click -->
                <Butao
                    ref="team"
                    texto={"Adicionar Regra"}
                    onClick={addRegra}
                />
            </div>
            <div class="list">
                {#each numRows as num, index (index)}
                    <div bind:this={num}>
                        <input
                            type="text"
                            class="attribute-name"
                            name="atributo"
                            id=""
                        />
                        <div class="attribute-group">
                            <input
                                type="number"
                                class="attribute-num"
                                name="pontoAtributo"
                                id=""
                            /><button on:click={num.parentNode.removeChild(num)}
                                ><svg
                                    width="33"
                                    height="33"
                                    viewBox="0 0 33 33"
                                    fill="none"
                                    xmlns="http://www.w3.org/2000/svg"
                                >
                                    <path
                                        d="M31.4365 25.3756L22.3451 16.2843L31.4365 7.1929C32.5521 6.07731 32.5521 4.26788 31.4365 3.15229L29.4162 1.13198C28.3006 0.0163954 26.4911 0.0163958 25.3756 1.13198L16.2842 10.2234L7.19281 1.13198C6.07722 0.0163958 4.26778 0.0163954 3.1522 1.13198L1.13189 3.15229C0.0163043 4.26788 0.0163041 6.07731 1.13189 7.1929L10.2233 16.2843L1.13189 25.3756C0.016305 26.4912 0.0163043 28.3007 1.13189 29.4163L3.1522 31.4366C4.26778 32.5521 6.07722 32.5521 7.19281 31.4366L16.2842 22.3452L25.3756 31.4366C26.4911 32.5521 28.3006 32.5521 29.4162 31.4366L31.4365 29.4163C32.5521 28.3007 32.5521 26.4912 31.4365 25.3756Z"
                                        fill="#E53935"
                                    />
                                </svg>
                            </button>
                        </div>
                    </div>
                {/each}
            </div>

            <div class="center">
                <Butao
                    tipo="submit"
                    ref="team"
                    texto={"SALVAR"}
                    onClick={() => (showAddRegras = true)}
                />
            </div>
        </Modal>
    </form>
</main>

<style>
    .grid {
        align-items: center;
        display: flex;
        gap: 1rem;
    }

    .input-player {
        margin: 0;
        width: 100%;
    }

    /* texto regras */

    .rules {
        font-size: 1rem;
        color: var(--text-color);
        border-style: none;
        margin: 20px;
    }

    .center {
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        margin: -1px;
    }

    /*  ------------ */

    .attribute-name,
    .attribute-num {
        background-color: var(--forms-color);
        border-style: none;
        padding: 0.5rem;
        color: white;
    }

    .attribute-name {
        width: 16rem;
    }

    .attribute-num {
        width: 2.5rem;
    }

    .list {
        display: flex;
        flex-direction: column;
        gap: 10px;
        margin-bottom: 1rem;
    }

    .list .attribute-group {
        display: flex;
        align-items: center;
        gap: 15px;
    }
    .list > div {
        display: flex;
        justify-content: space-between;
        gap: 20px;
        width: 25rem;
        align-items: center;
    }

    .list div > button {
        cursor: pointer;
        padding: 0;
        border: none;
        background: none;
    }

    .center {
        display: flex;
        justify-content: center;
        align-items: center;
    }
    .modalHeader {
        text-align: center;
    }

    .attribute-header {
        color: var(--text-color);
        font-size: large;
        padding: 0.5rem;
        background: none;
        border-style: none;
        border-bottom: 3px dashed var(--highlight-color);
    }

    main {
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
    }

    .pontos {
        margin-bottom: 2rem;
    }

    :global([ref="team"]) {
        background-color: var(--secondary-color);
    }
    :global([ref="champion"]) {
        background-color: var(--tertiary-color);
    }
    :global([ref="player"]) {
        background-color: var(--tertiary-color);
        width: 8rem;
    }
    :global([ref="save"]) {
        background-color: var(--tertiary-color);
        margin-top: 2.5rem;
    }
</style>
