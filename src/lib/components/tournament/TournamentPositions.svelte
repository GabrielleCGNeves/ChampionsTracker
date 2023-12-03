<script>
    export let positions = [];
</script>

<div class="tournament-positions">
    {#if (positions.length === 0)}
        <h1>Não há pontuações cadastradas</h1>
    {:else}
    <table id="myTable">
        <tr class="header">
            <th class="outrosHeader">Posição</th>
            <th class="nomeHeader">Nome</th>
            <th class="outrosHeader">Vitórias</th>
            <th class="outrosHeader">Empates</th>
            <th class="outrosHeader">Derrotas</th>
        </tr>
        {#each positions as position, i}
            <tr class="rows">
                <td>{i + 1 + "º"}</td>
                <td>{position.nome}</td>
                <td>{position.vitorias}</td>
                <td>{position.empates}</td>
                <td>{position.derrotas}</td>
            </tr>
        {/each}
    </table>
    {/if}
    
</div>

<style>
    .tournament-positions {
        width: 100%;
        height: 100%;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    tr td {
        padding: 20px;
        /* border: red solid 1px; */
        text-align: center;
    }

    .rows {
        background-color: #1a2033;
        border-radius: 10px;
    }

    table {
        border-collapse: separate;
        border-spacing: 0 1.25rem;
    }
    .nomeHeader {
        width: 25rem;
    }
    .outrosHeader {
        width: 6rem;
    }
</style>
