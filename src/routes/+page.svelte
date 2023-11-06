<script>
    import Butao from "$lib/components/Butao.svelte";
</script>

<nav>
    <ul>
        <div class="group">
            <li><img src="/trophy.png" width="40" alt="" srcset=""></li>
            <!-- <li class="title"><span>Champions</span> <span>Tracker</span></li> -->
        </div>
        <div class="group">
            <li class="login"><a href="/login">Login</a></li>
            <li class="register"><a href="/register">Registrar</a></li>
        </div>
    </ul>
</nav>

<main>
    <section class="section">
        <div class="texto">
            <h3>Organize suas competições com a ferramenta certa</h3>
            <p>O Champions Tracker é uma poderosa plataforma para organizadores e jogadores para gerenciar e participar de competições.</p>
            <div class="botoes">
                <Butao ref="start-now" texto={"COMEÇAR AGORA"} link="/register" />
            </div>
        </div>
        <img src="pernudo.svg" width="400" alt="">
    </section>
    
    <section class="section background-alt centered">
        <div class="texto">
            <h3>Seu torneio suas regras</h3>
            <p>Controle e organize seus torneios em um só lugar, independente da modalidade ou estrutura. Decida quais vão ser as regras e atribua pontos para elas. Dê vida ao seu torneio seja ele público ou privado.</p>
        </div>
        <div class="images">
            <img src="https://files.catbox.moe/1gcmvz.png" alt="Interface de Cadastro de Campeonato" height="300">
            <img src="https://files.catbox.moe/l6w0bm.png" alt="Interface de Cadastro de Regras" height="300">
        </div>
    </section>
    
    <section class="section">
        <div class="texto">
            <h3>Participe de inúmeros torneios</h3>
            <p>Crie suas próprias equipes, atribua jogadores fora ou dentro da plataforma. Cadastre suas equipes em torneios e acompanhe seus resultados.</p>
        </div>
        <img src="https://files.catbox.moe/gkera6.png" alt="Interface de Cadastro de Regras" height="300">
    </section>
</main>

<footer>
    Copyright 2023 &copy by Noobwire
</footer>

<style>
    footer {
        background-color: var(--tertiary-color);
        height: 50px;
        display: flex;
        align-items: center;
        justify-content: center;
        color: rgba(255, 255, 255, 0.438);
        font-size: 0.75rem;
    }

    .login a, .register a{
        text-decoration: none;
        color: var(--text-color);        
    }

    .register a{
        padding: 8px 15px;
        border: white 1px solid;
        border-radius: 10%;
    }

    .centered{
        text-align: center;
        flex-direction: column;
        gap: 35px;
    }

    
    .botoes {
        margin: 30px 0;
    }
    :global([ref=start-now]) {
        background-color: var(--secondary-color);
    }
    :global([ref=start-now]):hover {
        background-color: var(--quaternary-color);
    }

    .background-alt {
        background-color: var(--tertiary-color);
    }

    .section {
        min-height: 600px;
        /* border: red solid 1px;         */
        display: flex;
        align-items: center;
        justify-content: center;
        gap: 50px;
        flex-wrap: wrap;
    }
    
    .texto {
        /* border: red solid 1px;         */
        max-width: 500px;
    }
    .section h3 {
        font-size: 2rem;
    }
    nav {
        width: 100%;
        position: fixed;
        display: flex;
        justify-content: space-around;
        align-items: center;
        height: 70px;
        background-color: #110f36;
    }
    ul {
        display: flex;
        list-style: none;
        align-items: center;
        justify-content: space-around;
        width: 100%;
        height: 100%;
    }

    .group {
        display: flex;
        align-items: center;
        gap: 20px;  

    }

    /* .title {
        font-weight: bold;
        color: var(--gold-color);
    } */

    /* .title > span {
        display: block;
    } */

/* Medium devices (tablets, less than 992px) */
@media (max-width: 991.98px) {
    .section:first-child {
        padding-top: 100px;
    }
    
}
</style>