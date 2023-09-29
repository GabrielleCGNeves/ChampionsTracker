<script>
    import Butao from "$lib/components/Butao.svelte";
	export let showModal; // boolean

	let dialog; // HTMLDialogElement

	$: if (dialog && showModal) dialog.showModal();

    
</script>

<!-- svelte-ignore a11y-click-events-have-key-events a11y-no-noninteractive-element-interactions -->
<dialog
	bind:this={dialog}
	on:close={() => (showModal = false)}
	on:click|self={() => dialog.close()}
>
	<!-- svelte-ignore a11y-no-static-element-interactions -->
	<div class="header">
		<svg on:click={() => dialog.close()} class="closeButton" width="60" height="60" viewBox="0 0 60 60" fill="none" xmlns="http://www.w3.org/2000/svg">
			<path d="M60 3.9622L56.0375 0L30 26.0375L3.96255 0L0 3.9622L26.0376 29.9998L0 56.0375L3.96255 59.9996L30 33.9622L56.0375 59.9996L60 56.0375L33.9624 29.9998L60 3.9622Z" fill="#76809D"/>
		</svg>
		<slot name="header" />
	</div>
	<div on:click|stopPropagation>
		<!-- <hr /> -->
		<slot />
		<!-- svelte-ignore a11y-autofocus -->
		<!-- <button autofocus on:click={() => dialog.close()}>close modal</button> -->
	</div>

        
</dialog>


<style>
    .closeButton{
        position: fixed;
        z-index: 2;
        margin-left: 32em;
		margin-top: 0.25rem;
        
    }

	.header {
		background-color: var(--secondary-color);
		border-radius: 0.625rem;
		margin: 0;
		padding: 0.2rem 1.25rem 0.2rem 1.25rem;
	}

	dialog {
		color: white;
		max-width: 32em;
		border-radius: 0.625em;
		border: none;
		padding: 0;
        overflow-x: hidden;
		background-color: var(--tertiary-color);
	}
	dialog::backdrop {
		background-color: rgba(10, 9, 45, 0.75);
		backdrop-filter: blur(7.5px);
	}
	dialog > div {
		padding: 1em;
	}
	dialog[open] {
		animation: zoom 0.3s cubic-bezier(0.34, 1.56, 0.64, 1);
	}
	@keyframes zoom {
		from {
			transform: scale(0.95);
		}
		to {
			transform: scale(1);
		}
	}
	dialog[open]::backdrop {
		animation: fade 0.2s ease-out;
	}
	@keyframes fade {
		from {
			opacity: 0;
		}
		to {
			opacity: 1;
		}
	}
</style>