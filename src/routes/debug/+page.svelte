<script>
	import Modal from '$lib/components/Modal.svelte';
    import Butao from '$lib/components/Butao.svelte';

	let showModal = false;
</script>

<Butao ref="confirmar" texto={"show modal"} tipo="button" onClick={()=>{ showModal = true }}/>

<Modal bind:showModal>
	<h2 slot="header">
		Teste de Modal
	</h2>

	<p>
        Um modal, em termos simples, é uma janela ou caixa de diálogo que aparece temporariamente na frente do conteúdo principal de uma página da web ou aplicativo para fornecer informações adicionais, interações ou opções ao usuário. Geralmente, ele é usado para destacar informações importantes sem a necessidade de navegar para uma página diferente. Modais podem conter formulários de login, avisos, mensagens de confirmação, ou qualquer outra informação relevante que precise ser exibida de maneira focalizada e temporária, melhorando assim a experiência do usuário. Eles são populares em design de interface de usuário para oferecer interatividade e informações contextuais de forma mais eficiente.
    </p>
</Modal>

<style>
    :global([ref="confirmar"]) {
        background-color: var(--secondary-color);
    }
    :global([ref="confirmar"]):hover {
        background-color: var(--forms-color);
    }
</style>