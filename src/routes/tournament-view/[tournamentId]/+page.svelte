<script>
    import TournamentHeader from "$lib/components/tournament/TournamentHeader.svelte";
    const tournament_name = "Sword Fighters";
    const players = 12;
    const game = "Roblox";
    const type = "Virtual";
    const date = "08 de Abril, 2023";
    const owner_name = "Bob";

    export let data;

    $: ({ equipes, campeonato, owner } = data);
    console.log("🚀 ~ file: +page.svelte:13 ~ equipes:", equipes);

    const getSumOfJogadores = (equipes) => {
        return equipes.reduce((sum, equipe) => sum + equipe.numeroJogadores, 0);
    };

    const capitalizeFirstLetter = (string) => {
        return string.charAt(0).toUpperCase() + string.slice(1).toLowerCase();
    };
    const dateFormat = (dataOriginal) => {
        let regex = /(\w{3}) (\w{3}) (\d{2}) (\d{4})/;
        let match = regex.exec(dataOriginal);

        if (match) {
            const meses = {
                Jan: "Janeiro",
                Feb: "Fevereiro",
                Mar: "Março",
                Apr: "Abril",
                May: "Maio",
                Jun: "Junho",
                Jul: "Julho",
                Aug: "Agosto",
                Sep: "Setembro",
                Oct: "Outubro",
                Nov: "Novembro",
                Dec: "Dezembro",
            };

            let mes = match[2];
            let dia = match[3];
            let ano = match[4];

            return `${dia} de ${meses[mes]}, ${ano}`;
        } else {
            return "Erro ao Formatar a Data";
        }
    };

    // Exemplo de uso da função
    let dataFormatada = dateFormat(
        "Sun Nov 12 2023 17:23:42 GMT-0300 (Horário Padrão de Brasília)"
    );
    console.log(dataFormatada); // Saída esperada: "12 de Novembro, 2023"
</script>

<div class="tournament-main">
    <TournamentHeader
        tournamentName={campeonato.nome}
        players={getSumOfJogadores(equipes)}
        game={campeonato.jogo}
        type={capitalizeFirstLetter(campeonato.tipo)}
        date={dateFormat(campeonato.dataCriacao)}
        ownerName={owner.nome}
        bannerUrl={campeonato.foto}
        ownerImageUrl={owner.foto}
    />
    <div class="tournament-content">
        <div class="tournament-content-left">
            <div class="tournament-rules">
                <h3>Descrição</h3>
                <p>
                    {campeonato.descricao}
                </p>
            </div>
            <div class="tournament-teams">
                <h3>Equipes Inscritas</h3>
                <div class="team-list">
                    {#each equipes as equipe}
                        <div class="image-wrapper">
                            <img
                                src={equipe.foto}
                                class="equipe-img"
                                alt=""
                                srcset=""
                            />
                        </div>
                    {/each}
                </div>
            </div>
        </div>
        <div class="tournament-content-right">
            <h3>Informações</h3>
        </div>
    </div>
</div>

<style>


    .tournament-content-left {
        width: 70vw;
        /* border: red solid 1px; */
    }

    .tournament-main {
        height: 100vh;
        background-color: var(--quaternary-color);
    }

    .tournament-content {
        display: flex;
        flex-wrap: wrap;
        padding: 30px;
        /* border: red solid 1px; */
    }

    .team-list {
        padding: 20px;
        border-radius: 25px;
        background-color: #1A2032;
        display: flex;
        gap: 10px;
    }
    .image-wrapper {
        width: 60px;
        height: 60px;
        border-radius: 50%;
        overflow: hidden;
        border: #2E3856 solid 2px;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .equipe-img {
        max-width: auto;
        max-height: 100%;
        object-fit: cover;
    }


    /* Medium devices (tablets, less than 992px) */
    @media (max-width: 991.98px) {
        .tournament-content-left {
            width:100vw;
        }
    }
</style>
