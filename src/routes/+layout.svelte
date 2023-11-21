<script>
    import "../style.css";
    import Navbar from "$lib/components/Navbar.svelte";
    import { page } from "$app/stores";
    import { derived } from "svelte/store";
    import { getFlash } from "sveltekit-flash-message/client"
    import toast, { Toaster } from "svelte-french-toast";

    // This derived store computes whether the navbar should be shown
    const showNavbar = derived(page, ($page) => {
        // Check if the current path is "/" or starts with "/tournament"
        return !(
            $page.url.pathname === "/" ||
            $page.url.pathname.startsWith("/tournament-view")
        );
    });

    const flash = getFlash(page);


    $: if ($flash) {
        switch ($flash.type) {
            case "success":
                toast.success($flash.message);
                break;
            case "error":
                toast.error($flash.message);
                break;
            default:
                break;
        }
    }
</script>

<div>
    <Toaster />

    {#if $showNavbar}
        <Navbar />
    {/if}

    <main>
        <slot />
    </main>
</div>

<style>
</style>
