<script>
    import Butao from "$lib/components/Butao.svelte";
    import { superForm } from "sveltekit-superforms/client";
    import SuperDebug from "sveltekit-superforms/client/SuperDebug.svelte";

    export let data
    const { form, enhance } = superForm(data.form, {
        customValidity: true,
        validators: data.validators
    })
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
    
    <!-- <SuperDebug data={$form} /> -->

    <form method="POST" class="forms" use:enhance>

        <input type="text" class="input" name="nome" placeholder="Nome" bind:value={$form.nome}>
        
        <br>
        <input type="text" class="input" name="apelido" placeholder="Apelido" bind:value={$form.apelido}>
        
        <br>
        <input type="text" class="input" name="email" placeholder="Email" bind:value={$form.email}>
        
        <br>
        <input type="password" class="input" name="password" placeholder="Senha" bind:value={$form.password}>
        
        <br>
        <input type="password" class="input" name="confirmPassword" placeholder="Confirme a Senha" bind:value={$form.confirmPassword}>
        
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
