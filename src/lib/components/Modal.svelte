<script>
    export let isOpen = false;
    export let title = "";
    export let close = () => {};
</script>

{#if isOpen}
<!-- svelte-ignore a11y-click-events-have-key-events -->
    <div class="modal-background" on:click={close}>
        <div class="modal" on:click|stopPropagation>
            <h2>{title}</h2>
            <slot />
            <button on:click={close}>Fechar</button>
        </div>
    </div>
{/if}

<style>
    .modal-background {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        fill: rgba(10, 9, 45, 0.75);
        backdrop-filter: blur(7.5px);
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .modal {
        background-color: var(--tertiary-color);
        padding: 20px;
        border-radius: 8px;
        width: 80%;
        max-width: 500px;
    }
</style>
