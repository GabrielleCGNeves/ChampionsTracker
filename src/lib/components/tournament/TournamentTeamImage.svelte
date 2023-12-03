<script>
    import Modal from "$lib/components/Modal.svelte";
    import Butao from "$lib/components/Butao.svelte";
    export let foto
    export let nome
    export let editable = false;

    let showModal = false;
</script>

{#if !editable}
    <div class="image-wrapper">
        <img src={foto} class="equipe-img" alt="Foto da equipe {nome}" title={nome} />
    </div>
{:else}
    <!-- svelte-ignore a11y-click-events-have-key-events -->
    <div on:click={() => {showModal = true}} class="image-wrapper">
        <img src={foto} class="equipe-img" alt="Foto da equipe {nome}" title={nome} />
    </div>
{/if}



<Modal bind:showModal>
    <div slot="header">
        <h3>Moderação</h3>
    </div>
    <div class="center">
        <h3>Você deseja expulsar esta equipe?</h3>
        <div class="buttons">
                <Butao texto="SIM" ref={"modal"} tipo="submit" />
        </div>
    </div>
</Modal>

<style>
    .buttons {
        display: flex;
        gap: 10px;
    }
    :global([ref="modal"]) {
        background-color: var(--secondary-color);
    }
    :global([ref="modal"]):hover {
        background-color: var(--quaternary-color);
    }
    .center {
        flex-direction: column;
        display: flex;
        justify-content: center;
        align-items: center;
    }
    .image-wrapper {
        cursor: pointer;
        width: 60px;
        height: 60px;
        border-radius: 50%;
        overflow: hidden;
        border: #2e3856 solid 2px;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .equipe-img {
        max-width: auto;
        max-height: 100%;
        object-fit: cover;
    }
</style>
