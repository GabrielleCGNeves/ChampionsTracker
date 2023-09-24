<script>
    import Butao from "$lib/components/Butao.svelte";
</script>

<main class="main-content">
    <p class="page-title">Registre-se no Champions Tracker</p>
    <!-- <p class="details">Logar com</p> -->
    
    <!-- <div class="grid-container">
        <div class="grid-item">
            <button class="discord">Discord</button>
            <button class="twitter">Twitter</button>
            <button class="google">Google</button>
        </div>
    </div> -->
    
    <form method="POST" class="forms" >

        <input type="text" class="input" name="usu_nome" placeholder="Nome">
        <br>
        <input type="text" class="input" name="usu_apelido" placeholder="Apelido">
        <br>
        <input type="text" class="input" name="usu_email" placeholder="Email">
        <br>
        <input type="password" class="input" name="password" placeholder="Senha">
        <br>
        <br>
        <Butao ref="confirmar" texto={"REGISTRAR"} tipo="submit" />
    </form>
    
    
</main>

<style>
    :global([ref=confirmar]) {
        background-color: var(--secondary-color);
    }
    :global([ref=confirmar]):hover {
        background-color: var(--forms-color);
    }
</style>
