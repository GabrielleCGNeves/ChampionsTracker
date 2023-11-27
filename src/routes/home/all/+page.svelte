<script>
    import Card from "$lib/components/Card.svelte";
    import Title from "$lib/components/Title.svelte";
    import { onMount } from "svelte";
    import { getNumeroJogadores } from "$lib/util/helpers"

    export let data;
    $: ({ campeonatos, equipeDoCampeonato, equipes } = data)

    
</script>

<Title title="Torneios" />

<div class="main-content">
    <div class="section">
        <div class="title-button">
            <h1 class="title">Torneios Públicos</h1>
        </div>
        <div class="card-container">
            {#each campeonatos as campeonato}
                <Card {campeonato} numJogadores={getNumeroJogadores(campeonato, equipeDoCampeonato, equipes)} />
            {/each}
        </div>
    </div>
</div>

<style>
    .card-container {
        display: flex;
        max-width: 1200px;
        margin: 0 auto;
        flex-wrap: wrap;
        gap: 25px;
    }
</style>