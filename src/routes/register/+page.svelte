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
    
    <form action="POST" class="forms">

        <input type="text" class="input" name="name" placeholder="Nome">
        <br>
        <input type="text" class="input" name="username" placeholder="Apelido">
        <br>
        <input type="text" class="input" name="email" placeholder="Email">
        <br>
        <input type="password" class="input" name="pass" placeholder="Senha">
    </form>
    
    <br>
    
    <Butao ref="confirmar" texto={"REGISTRAR"} />
</main>

<style>
    :global([ref=confirmar]) {
        background-color: var(--secondary-color);
    }
    :global([ref=confirmar]):hover {
        background-color: var(--forms-color);
    }
</style>
