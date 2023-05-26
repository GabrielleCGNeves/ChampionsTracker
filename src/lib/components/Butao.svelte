<script>
    export let texto;
    export let ref;
</script>

<button {ref} class="btn-butao" type="button">{texto}</button>

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
    }

    .btn-butao:hover{
        /* background-color: var(--secondary-color); */
        border-color: var(--secondary-color);
        cursor: pointer;
    }


</style>