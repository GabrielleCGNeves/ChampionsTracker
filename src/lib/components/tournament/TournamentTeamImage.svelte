<script>
    export let foto
    export let nome
</script>

<div class="image-wrapper">
    <img src={foto} class="equipe-img" alt="Foto da equipe {nome}" title={nome} />
</div>

<style>
    .image-wrapper {
        width: 60px;
        height: 60px;
        border-radius: 50%;
        overflow: hidden;
        border: #2e3856 solid 2px;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .equipe-img {
        max-width: auto;
        max-height: 100%;
        object-fit: cover;
    }
</style>
