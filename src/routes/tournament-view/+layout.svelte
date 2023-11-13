<script>
    import TournamentHeader from "$lib/components/tournament/TournamentHeader.svelte";
    export let data
    $: ({ equipes, campeonato, owner } = data);
</script>

<div class="tournament-main">
    <TournamentHeader
        tournament={campeonato}
        teams={equipes}
        owner={owner}
    />
    <slot/>
</div>

<style>
    .tournament-main {
        width: 100%;
        overflow-x: hidden;
        height: 100vh;
        background-color: var(--quaternary-color);
    }
</style>