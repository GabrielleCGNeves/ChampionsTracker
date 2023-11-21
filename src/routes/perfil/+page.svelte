<script>
    import Butao from "$lib/components/Butao.svelte";
    import Title from "$lib/components/Title.svelte";
    import { page } from "$app/stores";
</script>
<Title title="Perfil" />
<main class="main-content">
    <div class="twin-colun">
        <div class="colun-one">
            <div class="title-button">
                <h1 class="title">Olá, {$page.data.user.username}</h1>
                <Butao ref="seeMore" texto={"Editar cartão"} />
            </div>

            <div class="card-activity">
                <div class="head">
                    <h3>CARTÃO DE ATIVIDADE</h3>
                    <a class="link" href="mycode">Meu código</a>
                </div>
                <div class="content-a">
                    <h2>Pontuação Geral</h2>
                    <p>Melhor Desempenho:</p>
                    <p>Melhor Palpite:</p>
                    <p>Torneios Participados:</p>
                    <p>Palpites Certeiros:</p>
                </div>
            </div>

            <!-- ====================================== -->

                <div class="title-button">
                    <h1 class="title">Últimos Campeonatos</h1>
                    <Butao ref="seeMore" texto={"Ver Mais"} />
                </div>

                <div class="champions">
                <div class="card-lastest">
                    <table class="table">
                        <tr>
                            <th>COLOCAÇÃO</th>
                            <th>TORNEIOS</th>
                            <th>PONTOS</th>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>STF SUPER GAME</td>
                            <td>26</td>
                        </tr>
                        <tr>
                            <td>5</td>
                            <td>SUPER LIGA</td>
                            <td>14</td>
                        </tr>
                        <tr>
                            <td>8</td>
                            <td>WORLDS</td>
                            <td>9</td>
                        </tr>
                    </table>
                    <div class="color" />
                </div>

                <!-- ====================================== -->
                <div class="twin-cards">
                    <div class="card-access">
                        <div class="head">
                            <h3>ACESSO RÁPIDO</h3>
                        </div>
                        <div class="content-tc">
                            <h3>Campeonatos</h3>
                            <li>Equipes</li>
                            <li>Em Andamento</li>
                            <li>Chaveamento</li>
                        </div>
                    </div>

                    <div class="card-pref">
                        <div class="head">
                            <h3>PREFERÊNCIAS</h3>
                        </div>
                        <div class="content-tc">
                            <h3>Virtual</h3>
                            <li>COD War Zone</li>
                            <li>Valorant</li>
                            <li>CS:GO</li>
                            <h3>Físico</h3>
                            <li>Vôlei</li>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- ================= Final da primiera coluna ===================== -->
        <div class="colun-two">
            <div class="card-profile">
                <div class="foto">
                    <img src={$page.data.user.image} alt="Foto de Perfil" />
                </div>
                <div class="content-profile">
                    <h3>{$page.data.user.username}</h3>
                    <div class="content-profile-description">
                        <p>Sobre mim:</p>
                        <p>
                            Lorem Ipsum is simply dummy text of the printing and
                            typesetting industry. Lorem Ipsum has been the
                            industry's standard dummy text ever since the 1500s
                        </p>
                    </div>
                </div>
            </div>

            <div class="title-button">
                <h1 class="title">Amigos</h1>
                <Butao ref="seeMore" texto={"Ver Mais"} />
            </div>
            <div class="friends-historic">
                <div class="card-friends">
                    <div class="grid-friends">
                        <div class="circle" />
                        <div class="circle" />
                        <div class="circle" />
                        <div class="circle" />
                    </div>
                </div>
    
                <div class="card-historic">
                    <div class="head">
                        <h3>HISTÓRICO</h3>
                    </div>
                    <div class="content-hist">
                        <div class="content-hist-text">
                            <span>↑</span>
                            <p>2 CTCoins - Gol</p>
                        </div>
                        <div class="content-hist-text">
                            <span>↑</span>
                            <p>8 CTCoins - ACE</p>
                        </div>
                        <div class="content-hist-text">
                            <span>↓</span>
                            <p>5 CTCoins - Cartão Amarelo</p>
                        </div>
                        <div class="content-hist-text">
                            <span>↓</span>
                            <p>5 CTCoins - Cartão Amarelo</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>

<style>
   .main-content {
    display: flex;
    flex-direction: column;
    justify-content: start;
    align-items: start;
    overflow: hidden;
    width: 100%;
    margin: 0;
    padding: 0 10px;
}

@media (min-width: 1080px) {
    .main-content {
        margin-top: 100px;
    }
}

.title-button {
    width: 100%;
    display: flex;
    justify-content: space-between;
}

.twin-colun {
    width: 100%;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    gap: 50px;
}

@media (min-width: 1080px) {
    .twin-colun {
        width: 100%;
        flex-direction: row;
        align-items: start;
    }
}

.colun-one {
    width: 100%;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    max-width: 620px;
}

.colun-two {
    width: 100%;
    display: flex;
    flex-direction: column;
    align-items: center;
    padding-top: 85px;
    max-width: 420px;
}

.card-activity {
    display: flex;
    flex-direction: column;
    background: #04031F;
    border-radius: 10px;
    width: 100%;
}

.head {
    display: flex;
    align-items: center;
    justify-content: space-between;
    
    background: #76809D4D;
    padding: 10px 30px 10px 30px;
    border-radius: 10px 10px 0px 0px;
}

.head > a {
    color: var(--gold-color);
}

.champions {
    display: flex;
    flex-direction: column;
    gap: 50px;
    width: 100%;
}

.content-a {
    padding: 10px 30px 10px 30px;
}

.card-lastest {
    width: 100%;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
}

.table {
    width: 100%;
    background: #04031F;
    border-radius: 10px;
}

.table > tr:nth-child(1), .table > tr:nth-child(3) {
    background: #76809D4D;
}

.table > tr:nth-child(1) {
    border-radius: 10px 10px 0 0;
}

tr, th, td {
    width: 100%;
    padding: 10px 0px 10px 0px;
    display: flex;
    align-items: center;
    justify-content: center; 
    text-align: center;
}

.twin-cards {
    display: flex;
    flex-direction: column;
    gap: 50px;
}

.card-access {
    width: 100%;
    background: #04031F;
    border-radius: 10px;
}

.card-pref {
    width: 100%;
    background: #04031F;
    border-radius: 10px;
}

.content-tc {
    padding: 10px 30px 30px 30px;
}

.card-profile {
    width: 100%;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    gap: 0;
}


.foto {
    width: 100%;
}
.foto > img {
    width: 100%;
    object-fit: cover;
    max-height: 175px;
    border-radius: 10px 10px 0 0;
}

.content-profile {
    width: 100%;
    background: #04031F;
    border-radius: 0 0 10px 10px;
    display: flex;
    flex-direction: column;
    justify-content: center;
}

.content-profile > h3 {
    width: 100%;
    text-align: center;
}

.content-profile-description {
    padding: 0 30px 20px 30px;
}

.friends-historic {
    width: 100%;
    display: flex;
    flex-direction: column;
    gap: 25px;
}

.card-friends {
    background: #04031F;
    border-radius: 10px;
}

.grid-friends {
    display: flex;
    justify-content: center;
    align-items: center;
    gap: 30px;
    padding: 30px 10px;;
}

.circle {
    width: 75px;
    height: 75px;
    border-radius: 100%;
    background: #76809D4D;
}

.content-hist {
    display: flex;
    flex-direction: column;
}

.card-historic {
    margin-bottom: 100px;
}

@media (min-width: 1080px) {
    .card-historic {
        margin-bottom: 0;
    }
}

.content-hist-text {
    display: flex;
    justify-content: space-between;
    align-items: center;
    background: #04031F;
}

.content-hist-text > p, .content-hist-text > span {
    width: 100%;
}

.content-hist-text > span {
    display: flex;
    justify-content: center;
    align-items: center;
}
</style>
