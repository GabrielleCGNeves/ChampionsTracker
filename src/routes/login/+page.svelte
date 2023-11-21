<script>
    import Butao from "$lib/components/Butao.svelte";
    import { superForm } from "sveltekit-superforms/client";
    import SuperDebug from "sveltekit-superforms/client/SuperDebug.svelte";
    import Title from "$lib/components/Title.svelte";

    export let data
    const { form, enhance } = superForm(data.form, {
        customValidity: true,
        validators: data.validators
    })
    

</script>
<Title title="Login" />
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

    <!-- <SuperDebug data={$form} /> -->

    <form method="POST" class="forms" use:enhance>

        <input type="text" class="input" name="email" placeholder="Email" bind:value={$form.email}>
        <br />
        <input type="password" class="input" name="password" placeholder="Senha" bind:value={$form.password}>
        <br />
        <br />
        <div class="div">
            <input type="checkbox" name="rememberMe"/>
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
