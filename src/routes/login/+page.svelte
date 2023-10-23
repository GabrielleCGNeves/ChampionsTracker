<script>
    import Butao from "$lib/components/Butao.svelte";
    export let form
</script>

<main class="main-content">
    <p class="page-title">Logue no Champions Tracker</p>
    <!-- <p class="details">Logar com</p> -->

    <!-- <div class="grid-container">
        <div class="grid-item">
            <button class="discord">Discord</button>
            <button class="twitter">Twitter</button>
            <button class="google">Google</button>
        </div>
    </div> -->

    <form method="POST" class="forms">
        {#if form?.invalid}
            <p class="error">Email e senha são obrigatórios</p>
        {/if}

        {#if form?.credentials}
            <p class="error">Email ou senha incorretos</p>
        {/if}
        <input
            type="text"
            class="input"
            name="email"
            placeholder="Email"
        />
        <br />
        <input
            type="password"
            class="input"
            name="password"
            placeholder="Senha"
        />
        <br />
        <div class="div">
            <input type="checkbox" name="rememberMe" />
            <label for="" class="details">Lembrar minha senha</label>
        </div>
        <br />
        <Butao ref="confirmar" texto={"LOGAR"} tipo="submit" />
    </form>
    <p>
        Não possui uma conta? <a class="link" href="/register">Inscreva-se</a>
    </p>
</main>

<style>
    .error {
        color: red;
    }
    .link {
        color: var(--gold-color);
    }
    :global([ref="confirmar"]) {
        background-color: var(--secondary-color);
    }
    :global([ref="confirmar"]):hover {
        background-color: var(--forms-color);
    }
</style>
