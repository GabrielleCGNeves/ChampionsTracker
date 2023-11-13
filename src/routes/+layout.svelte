<script>
    import "../style.css";
    import Navbar from "$lib/components/Navbar.svelte";
    import { page } from "$app/stores";
    import { derived } from "svelte/store";

    // This derived store computes whether the navbar should be shown
    const showNavbar = derived(page, ($page) => {
        // Check if the current path is "/" or starts with "/tournament"
        return !(
            $page.url.pathname === "/" ||
            $page.url.pathname.startsWith("/tournament-view")
        );
    });
</script>

<div>
    {#if $showNavbar}
        <Navbar />
    {/if}

    <main>
        <slot />
    </main>
</div>

<style>
</style>
