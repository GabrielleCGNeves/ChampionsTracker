<script>
import '../style.css'
import Navbar from "$lib/components/Navbar.svelte";
import { page } from '$app/stores'
</script>

<div>
    {#if  $page.url.pathname === '/tournament'}
    
        <main>
            <slot />
        </main>

    {:else}

        <Navbar />

        <main>
            <slot />
        </main>

    {/if}
</div>

<style>

</style>