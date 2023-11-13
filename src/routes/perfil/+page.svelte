<script>
    import Butao from "$lib/components/Butao.svelte";    
    import { page } from "$app/stores";
</script>

<main class="main-content">
<div class="twin-colun"> 
    <div class="colun-one">
    
        <div class="title-button">
            <h1 class="title">Olá, {$page.data.user.username}</h1>
            <Butao ref="seeMore" texto={"Editar cartão"} /> 
        </div>
        
        <div class="card-activity">
            <div class="head">
                <h3>CARTÃO DE ATIVIDADE <a class="link" href="mycode">Meu código</a></h3>
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
            <h1 class="title"> Últimos Campeonatos</h1>
            <Butao ref="seeMore" texto={"Ver Mais"} /> 
        </div>
        
        <div class="card-lastest">
            <div class="grid">
                <h3 >COLOCAÇÃO</h3>
                <h3 >TORNEIOS</h3>
                <h3 >PONTOS FINAIS</h3>
                
                <h4>1</h4>
                <h4>STF SUPER GAME</h4>
                <h4>26</h4>

                <h4>5</h4>
                <h4>SUPER LIGA</h4>
                <h4>14</h4>

                <h4>8</h4>
                <h4>WORLDS</h4>
                <h4>9</h4>

            </div>
            <div class="color"></div>
        </div>

        <!-- ====================================== -->   
        <div class= "twin-cards">    
            <div class="card-access">
                <div class="head">
                    <h3>ACESSO RÁPIDO</h3>
                </div>
                <div class="content-tc">
                    <h3>Campeonatos</h3>
                    <h4>Equipes</h4>
                    <h4>Em Andamento</h4>
                    <h4>Chaveamento</h4>
                </div>
            </div>

            <div class="card-pref">
                <div class="head">
                    <h3>PREFERÊNCIAS</h3>
                </div>
                <div class="content-tc">
                    <h3>Virtual</h3>
                    <h4>COD War Zone</h4>
                    <h4>Valorant</h4>
                    <h4>CS:GO</h4>
                    <h3>Físico</h3>
                    <h4>Vôlei</h4>
                </div>
            </div>
        </div> 
    </div>

        <!-- ================= Final da primiera coluna ===================== -->        
    <div class="colun-two">   

        <div class="card-profile">
            <div class="foto">
                <img src={$page.data.user.image} alt="Foto de Perfil"/>
            </div>
            <h3>{$page.data.user.username}</h3>
            <div class="content-profile"> 
                <p>Sobre mim:</p>  
                <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s</p> 
            </div>
        </div>


        <div class="title-buttonA">
            <h1 class="title">Amigos</h1>
            <Butao ref="seeMore" texto={"Ver Mais"} /> 
        </div>
        <div class="card-friends">
            <div class="grid-friends">
                <div class="circle"></div>  
                <div class="circle"></div> 
                <div class="circle"></div> 
                <div class="circle"></div> 
            </div>
        </div>

        <div class="card-historic">
            <div class="head">
                <h3>HISTÓRICO</h3>
            </div>
            <div class="content-hist">
                <p>↑</p>
                <p>2  CTCoins - Gol</p>

                <p>↑</p>
                <p>8  CTCoins - ACE</p>

                <p>↓</p>
                <p>5  CTCoins - Cartão Amarelo</p>

                <p>↓</p>
                <p>5  CTCoins - Cartão Amarelo  </p>
            </div>

        </div>

    </div>
</div>
    
       
</main>

<style>
    /* =================== Edição primeira coluna ================== */

    .main-content{
        height: 1300px;
    }
    
    :global([ref="seeMore"]) {
        background-color: var(--tertiary-color);
    }
    :global([ref="seeMore"]):hover {
        background-color: var(--secondary-color);
    }

    .twin-colun{
        display: grid;
        grid-template-columns: 10px 50px;
        align-content: center;
    }
    
    .title-button{
        margin-left: -50px;
        margin-top: 50px;
        width: 550px;
    }

    .card-activity{
        margin-left: -50px;
        height: 300px;
        width: 550px;
        background: #04031F;
        border-radius: 10px;
    }

    .head{
        font: bold;
        height: 60px;
        background: #76809D4D;
        padding: 1px 20px;
        border-radius: 10px 10px 5px 5px;
    }
    
    .link {
        color: var(--gold-color);
        margin-left: 180px;
    }

    .content-a{
        margin-top:10px;
        font-style: bold;
        padding: 1px 40px;
    }

    /* ====================================== */

    .card-lastest{
        margin-left: -50px;
        height: 270px;
        width: 550px;
        background: #04031F;
        border-radius: 10px;
    }

    .grid{
        display: grid;
        grid-template-columns: 180px 180px 170px;
        grid-template-rows:70px 70px 70px;
        text-align: center;
        height: 60px;
        background: #76809D4D;
        padding: 0px 0px;
        border-radius: 10px 10px 5px 5px;
    }

    .color{
        margin-top: 75px;
        height: 70px;
        width: 550px;
        background: #76809D4D;
        border-radius: 5px;
    }

    /* =============================== */

    .twin-cards{
        margin-top: 50px;
        display: grid;
        grid-template-columns: 290px 260px;
        align-content: center;
    }

    .card-access{
        margin-top: 30px;
        margin-left: -50px;
        height: 350px;
        width: 260px;
        background: #04031F;
        border-radius: 10px;
    }

    .card-pref{
        margin-top: 30px;
        margin-left: -50px;
        height: 350px;
        width: 260px;
        background: #04031F;
        border-radius: 10px;
    }

    .content-tc ,h4{
        margin-left: 5px;
        margin-top:10px;
        font-style: bold;
        padding: 1px 20px;
    }

    /* =============== Edição da segunda coluna ================ */

    .card-profile{
        margin-top: 100px;
        margin-left: 600px;
        height: 550px;
        width: 500px;
        background: #04031F;
        border-radius: 10px;
        text-align: center;
    }
    .content-profile ,p{
        text-align: justify;
        padding: 1px 15px;
    }

    .foto {
        background-color: #76809D4D;
        margin-top: 100px;
        width: 500px;
        height: 300px;
        box-sizing: border-box;
        border-radius: 10px;
        overflow: hidden;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .foto img {
        width: 100%;
        max-height: auto;
        object-fit: fill;

    }

    @media (max-width: 768px) {
        .foto {
            width: 100%; /* Ocupa a largura total da tela */
            margin-bottom: 20px; /* Espaçamento entre os cards */
        }
    }

    .title-buttonA{
        display: grid;
        grid-template-columns: 400px 150px;
        margin-left: 600px;
        margin-top: 30px;
        width: 550px;
    }

    .title-buttonA :global([ref="seeMore"]){
        margin-top: 20px;
        width: 100px;
        height: 40px;
    }

    .card-friends{
        margin-top: 20px;
        margin-left: 600px;
        height: 140px;
        width: 500px;
        background: #04031F;
        border-radius: 10px;
        text-align: center;
        padding: 10px 0px;
    }

    .grid-friends{
        margin-left: 15px;
        display: grid;
        grid-template-columns: 120px 120px 120px 120px;
        align-content: center;
    }

    .circle{
        margin-top: 20px;
        margin-left: 5px;
        height: 100px;
        width: 100px;
        border-radius: 100px;
        background-color: #76809D4D;
    }


    .card-historic{
        margin-top: 30px;
        margin-left: 600px;
        height: 290px;
        width: 500px;
        background: #04031F;
        border-radius: 10px;
        text-align: center;
    }

    .content-hist{
        display: grid;
        grid-template-columns: 100px 250px;
        grid-template-rows:50px 50px 50px 50px;
        text-align: center center;
        height:0px;
        padding:15px 50px;
    }

</style>
