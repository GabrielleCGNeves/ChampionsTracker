<script>
    import Butao from "$lib/components/Butao.svelte";
    export let vitorias = 0, 
                nJogadores = 0, 
                titulo = "Unknown",
                imagem = "https://placehold.co/600x400/png?text=Placeholder",
                equipe = null;
    
</script>

<div class="card">
    <img
        src={imagem} alt="Foto do Jogo 1"
    />
    <h2>{titulo}</h2>
    <div class="card-attribute">
        <span>Vitórias</span>
        <span>{vitorias}</span>
    </div>
    <div class="card-attribute">
        <span>N de Jogadores</span>
        <span>{nJogadores}</span>
    </div>
    <div class="card-attribute">
        <form action="?/deleteTeam&id={equipe.id}" method="post">
            <Butao ref="delete" texto="Deletar" tipo="submit"/>
        </form>
        <Butao ref="edit" texto="Editar" tipo="button" link="/team/update/{equipe.id}"/>
    </div>
</div>

<style>
    :global([ref="delete"]), :global([ref="edit"]) {
        margin-top: 20px;
    }
    :global([ref="delete"]) {
        background-color: var(--quaternary-color);
    }
    :global([ref="edit"]) {
        background-color: var(--quaternary-color);
    }
    .card {
        background-color: #2e3856;
        width: calc(33.33% - 20px);
        /* padding: 20px; */
        box-sizing: border-box;
        height: 375px;
    }

    .card img {
        max-width: 100%;
        height: auto;
    }

    .card-attribute {
        height: 1rem;
        display: flex;
        align-items: center;
        justify-content: space-between; /* Alinha os elementos nas extremidades */
        margin: 15px;
    }

    .card h2 {
        font-size: 1.3rem;
        margin: 15px;
    }

    @media (max-width: 768px) {
        .card {
            width: 100%; /* Ocupa a largura total da tela */
            margin-bottom: 20px; /* Espaçamento entre os cards */
        }
    }
</style>