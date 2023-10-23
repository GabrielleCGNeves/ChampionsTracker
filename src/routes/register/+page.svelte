<script>
    import Butao from "$lib/components/Butao.svelte";
    import { superForm } from "sveltekit-superforms/client";
    import SuperDebug from "sveltekit-superforms/client/SuperDebug.svelte";

    export let data
    const { form, errors, enhance } = superForm(data.form)
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
        {#if $errors.nome}
        <small>{$errors.nome}</small>
        {/if}
        <br>
        <input type="text" class="input" name="apelido" placeholder="Apelido" bind:value={$form.apelido}>
        {#if $errors.apelido}
        <small>{$errors.apelido}</small>
        {/if}
        <br>
        <input type="text" class="input" name="email" placeholder="Email" bind:value={$form.email}>
        {#if $errors.email}
        <small>{$errors.email}</small>
        {/if}
        <br>
        <input type="password" class="input" name="password" placeholder="Senha" bind:value={$form.password}>
        {#if $errors.password}
        <small>{$errors.password}</small>
        {/if}
        <br>
        <input type="password" class="input" name="confirmPassword" placeholder="Confirme a Senha" bind:value={$form.confirmPassword}>
        {#if $errors.confirmPassword}
        <small>{$errors.confirmPassword}</small>
        {/if}
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
