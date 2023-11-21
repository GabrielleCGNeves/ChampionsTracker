<script>
    import Butao from "$lib/components/Butao.svelte";
    import Card from "$lib/components/Card.svelte";
    import Title from "$lib/components/Title.svelte";
    import { page } from '$app/stores'

    
    const card = [
        {
            image: "https://s2-ge.glbimg.com/PqYBNkb90VdSg422I8Lb1fthGEE=/0x0:920x518/984x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_bc8228b6673f488aa253bbcb03c80ec5/internal_photos/bs/2021/B/B/oEivukQZ6J4Ra6qVg9hQ/league-of-legends-campeoes-divulgacao-riot-games.jpg",
            title: "MSI League of Legends",
            date: "January 28, 2004",
            game: "League of Legends",
            type: "Virtual",
            players: 10,
        },
        {
            image: "https://assets.fortnitecreativehq.com/wp-content/uploads/2023/03/25235015/screen_comp-1487.jpeg",
            title: "Sword Fighters",
            date: "April 08, 2023",
            game: "Roblox",
            type: "Virtual",
            players: 10,
        },
        {
            image: "https://cdn.cloudflare.steamstatic.com/steam/apps/412220/capsule_616x353.jpg?t=1671713534",
            title: "FTL Tournament",
            date: "February 15, 2004",
            game: "DDraceNetwork",
            type: "Virtual",
            players: 10,
        },
    ];
</script>
<Title title="Home" />

<main class="main-content">
    {#if $page.data.user}
    <div class="section">
        <div class="title-button">
            <h1 class="title">Bem Vindo <span class:admin-user={$page.data.user.role === "ADMIN"}>{$page.data.user.username}</span>!</h1>
            <form action="/logout" method="post">
                <Butao tipo="submit" ref="seeMore" texto={"LOGOUT"} />
            </form>
        </div>
    </div>
    {/if}
    <div class="section">
        <div class="faixa-destaque" />
    </div>
    <div class="section">
        <div class="title-button">
            <h1 class="title">Torneios Públicos</h1>
            <Butao ref="seeMore" texto={"VER MAIS"} />
        </div>
        <div class="card-container">
            {#each card as { image, title, date, game, type, players }}
                <Card {image} {title} {date} {game} {type} {players} />
            {/each}
        </div>
    </div>
    {#if $page.data.user}
    <div class="section">
        <div class="title-button">
            <h1 class="title">Seus Jogos</h1>
            <!-- <Butao ref="seeMore" texto={"VER MAIS"} /> -->
        </div>
        <div class="list-container">
            <div class="header">
                <div class="col">TIPO</div>
                <div class="col">NOME DO TORNEIO</div>
                <div class="col">FASE</div>
            </div>
            <div class="item" style="background-color: #0A092D;">
                <div class="col">
                    <svg
                        width="30"
                        height="33"
                        viewBox="0 0 36 37"
                        fill="none"
                        xmlns="http://www.w3.org/2000/svg"
                    >
                        <path
                            d="M1.52484 0.0093605C1.06163 0.169848 0.662119 0.482191 0.387328 0.898684C0.112538 1.31518 -0.0224288 1.81293 0.0030435 2.3159V25.3813C0.0030435 25.9931 0.238825 26.5798 0.65852 27.0123C1.07821 27.4449 1.64744 27.6879 2.24098 27.6879H13.4307V32.301H8.95478C6.49305 32.301 4.47891 34.3769 4.47891 36.9141H31.3341C31.3341 34.3769 29.32 32.301 26.8583 32.301H22.3824V27.6879H33.5721C34.1656 27.6879 34.7348 27.4449 35.1545 27.0123C35.5742 26.5798 35.81 25.9931 35.81 25.3813V2.3159C35.81 1.70417 35.5742 1.11749 35.1545 0.684932C34.7348 0.252371 34.1656 0.0093605 33.5721 0.0093605L2.24098 0.0093605C2.10698 -0.00312016 1.97215 -0.00312017 1.83815 0.0093605C1.74871 0.0038198 1.65903 0.0038198 1.5696 0.0093605L1.52484 0.0093605ZM4.47891 4.62245H31.3341V23.0748H4.47891V4.62245Z"
                            fill="#B156E7"
                        />
                    </svg>
                </div>
                <div class="col">Pro League Free Fire</div>
                <div class="col">Eliminatórias</div>
            </div>
            <div class="item" style="background-color: #04031F;">
                <div class="col">
                    <svg
                        width="30"
                        height="33"
                        viewBox="0 0 32 35"
                        fill="none"
                        xmlns="http://www.w3.org/2000/svg"
                    >
                        <path
                            d="M25.0451 3.91759C25.0438 6.08032 23.2888 7.83236 21.125 7.83142C18.9612 7.83048 17.2074 6.07624 17.2087 3.91352C17.21 1.75111 18.965 -0.00125236 21.1288 6.71566e-07C21.1701 6.71566e-07 21.2112 0.000627185 21.2523 0.00188021C23.3672 0.0695437 25.046 1.80311 25.0451 3.91759ZM25.0451 26.5661C23.3139 26.5661 21.9105 27.9685 21.9105 29.6986C21.9105 31.4287 23.3139 32.8312 25.0451 32.8312C26.7763 32.8312 28.1796 31.4287 28.1796 29.6986C28.1796 27.9685 26.7763 26.5661 25.0451 26.5661ZM30.7186 15.9467L24.857 9.96345C24.5677 9.60258 24.1285 9.39457 23.6659 9.39959H1.56728C0.701827 9.39959 0 10.101 0 10.9659C0 11.8308 0.701827 12.5322 1.56728 12.5322H12.5069L3.32263 26.0022C3.27937 26.2089 3.27937 26.422 3.32263 26.6287C3.14082 27.4936 3.69533 28.3422 4.56078 28.5239C5.42623 28.7056 6.27538 28.1515 6.45718 27.2866H6.23776L9.87384 21.9299H15.6414L9.59173 32.0794C9.44378 32.325 9.36793 32.6072 9.37232 32.8938C9.19929 33.7588 9.76069 34.6005 10.6261 34.7734C11.4916 34.9463 12.3338 34.3853 12.5069 33.5204L24.0107 13.5346L28.6498 18.1708C29.2178 18.8236 30.2077 18.8928 30.8609 18.3252C31.5142 17.7576 31.5835 16.7683 31.0155 16.1155C30.9628 16.055 30.9054 15.9983 30.844 15.9467H30.7186Z"
                            fill="#B156E7"
                        />
                    </svg>
                </div>
                <div class="col">Campeôes de Maringá</div>
                <div class="col">Fases de Grupo</div>
            </div>
        </div>
    </div>
    {/if}
</main>

<style>
    .admin-user {
        color: var(--gold-color);
    }

    :global([ref="seeMore"]) {
        background-color: var(--tertiary-color);
    }
    :global([ref="seeMore"]):hover {
        background-color: var(--secondary-color);
    }

    /* SEUS JOGOS */
    .header .col {
        font-weight: bold;
    }

    .list-container {
        width: 100%;
        font-family: Arial, sans-serif;
    }

    .header,
    .item {
        display: flex;
        justify-content: space-between;
        padding: 10px;
        align-items: center;
    }

    .header {
        background-color: #2e3856;
        color: white;
        padding: 1rem auto;
    }

    .col {
        flex: 1;
        text-align: center;
    }
    /* ================================== */


    /* CARD  */
    .card-container {
        display: flex;
        justify-content: space-between;
        max-width: 1200px;
        margin: 0 auto;
        flex-wrap: wrap;
        gap: 20px;
    }
    /* ================================== */

    .faixa-destaque {
        width: 100%;
        height: 10rem;
        border-radius: 15px;
        background-color: #04031f;
    }
</style>
