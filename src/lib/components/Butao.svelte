<script>
    export let texto;
    export let ref;
    export let tipo = "button";
    export let onClick = () => {};
    export let link = null;
</script>
{#if !link}
    <button {ref} class="btn-butao" type={tipo} on:click={onClick}>{texto}</button>
{:else}
    <a {ref} href={link} class="btn-butao">{texto}</a>
{/if}

<style>
    .btn-butao{
        /* background-color: var(--tertiary-color); */
        color: var(--text-color);
        padding: 0.75rem 1.5rem;
        font-size: 0.75rem;
        font-weight: bold;
        border-radius: 0.5rem;
        border-color: var(--tertiary-color);
        border-style: none;
        text-decoration: none;
    }

    .btn-butao:hover{
        /* background-color: var(--secondary-color); */
        border-color: var(--secondary-color);
        cursor: pointer;
    }


</style>