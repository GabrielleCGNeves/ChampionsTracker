<script>
    import TournamentTeamRequests from '$lib/components/tournament/TournamentTeamRequests.svelte';
    import { page } from "$app/stores";

    export let data;
    $: ({ equipesPedintes } = data);
</script>

<div class="tournament-content">
    <h3>Solicitações</h3>
    <TournamentTeamRequests equipes={equipesPedintes} />
</div>

<style>
    .tournament-content {
        /* display: flex; */
        /* justify-content: space-between; */
        /* flex-wrap: wrap; */
        padding: 30px;
        gap: 30px;
        /* border: red solid 1px; */
    }
</style>
