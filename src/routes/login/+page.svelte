<script>
    import Butao from "$lib/components/Butao.svelte";
</script>

<main class="main-content">
    <p class="page-title">Logue no Champions Tracker</p>
    <p class="details">Logar com</p>
    
    <div class="grid-container">
        <div class="grid-item">
            <button class="discord">Discord</button>
            <button class="twitter">Twitter</button>
            <button class="google">Google</button>
        </div>
    </div>
    
    <form action="POST" class="forms">
        <input type="text" class="input" name="username" placeholder="Nome de Usuário ou Email">
        <br>
        <input type="password" class="input" name="pass" placeholder="Senha">
    </form>
    
    <div class="div">
        <input type="checkbox" name="rememberMe">
        <label for="" class="details">Lembrar minha senha</label>
    </div>
    
    <Butao ref="confirmar" texto={"LOGAR"} />
</main>

<style>
    :global([ref=confirmar]) {
        background-color: var(--secondary-color);
    }
    :global([ref=confirmar]):hover {
        background-color: var(--forms-color);
    }
</style>
