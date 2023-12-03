<script>
    import TournamentPositions from "$lib/components/tournament/TournamentPositions.svelte";

function calcularPontos(equipe) {
    return equipe.vitorias * 3 + equipe.empates;
}

</script>


<div class="tournament-content">
    <TournamentPositions />
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
