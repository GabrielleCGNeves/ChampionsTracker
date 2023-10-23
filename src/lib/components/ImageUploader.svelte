<script>
    import { createEventDispatcher } from "svelte";

    const dispatch = createEventDispatcher();
    

    let imageUrl = null;
    export let isLarge = false;
    let fileInput;

    function handleFileChange(event) {
        const file = event.target.files[0];
        if (file) {
            imageUrl = URL.createObjectURL(file);
            dispatch("message", { imageUrl });
        }
    }
</script>

{#if imageUrl}
    <img src={imageUrl} alt="Uploaded" width="120" height="120" />
{:else}
    <!-- svelte-ignore a11y-click-events-have-key-events -->
    <div class="normal placeholder" class:large={isLarge} on:click={() => fileInput.click()}>
        <input
            bind:this={fileInput}
            type="file"
            accept="image/*"
            on:change={handleFileChange}
            style="display: none;"
            name="image"
        />
    </div>
{/if}

<style>
    .normal {
        width: 120px;
    }

    .large {
        width: 350px;

    }
    .placeholder {
        height: 120px;
        background-color: var(--tertiary-color);
        border-radius: 20px;
        display: flex;
        align-items: center;
        justify-content: center;
        cursor: pointer;
    }
</style>
