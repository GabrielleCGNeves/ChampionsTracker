<script>
    import Butao from "$lib/components/Butao.svelte";
    import CardTeam from "$lib/components/CardTeam.svelte";
    import Carousel from "svelte-carousel";
    import Modal from "$lib/components/Modal.svelte";

    export let data;

    $: ({ equipes } = data);

    console.log(equipes);
</script>

<div class="main-content">
    <div class="section">
        <div class="title-button">
            <h1 class="title">Suas Equipes</h1>
            <!-- <Butao ref="seeMore" texto={"VER MAIS"} /> -->
        </div>
        <div class="flex">
            {#each equipes as equipe}
                <CardTeam nJogadores={equipe.equ_numjogadores} titulo={equipe.equ_nome} equipe={equipe}/>
            {/each}
        </div>
    </div>
</div>

<style>
    .flex {
        flex-wrap: wrap;
        gap: 20px;
    }
    :global([ref="seeMore"]) {
        background-color: var(--tertiary-color);
    }
    :global([ref="seeMore"]):hover {
        background-color: var(--secondary-color);
    }
</style>
