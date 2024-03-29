<script>
    import { page } from "$app/stores";
    import { goto } from '$app/navigation';
    import { derived } from "svelte/store";
    import { dateFormat, capitalizeFirstLetter} from "$lib/util/helpers";
    // Create a derived store that tracks the current path
    const currentPath = derived(page, ($page) => $page.url.pathname);

    export let tournament;
    export let teams;
    export let owner;

    const tournamentId = $page.params.tournamentId;
    
    // Check if the current route matches a given segment
    const isActive = (segment) => {
        let path;
        currentPath.subscribe(($currentPath) => {
            path = $currentPath;
        })();
        return path === segment;
    };

    let countJogadores = 0;
    teams.forEach((team) => {
        countJogadores += team.numeroJogadores
    })

    const gotoIndex = () => {
        goto('/')
    }
</script>

<div class="tournament-header">
    <div class="back-arrow" on:keypress={gotoIndex} on:click={gotoIndex}>
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 79 71" fill="none">
            <path d="M35.3125 6L6 35.3125L35.3125 64.625" stroke="#BEBEBE" stroke-width="12" stroke-linecap="round" stroke-linejoin="round"/>
            <path d="M6 35.3125H73" stroke="#BEBEBE" stroke-width="12" stroke-linecap="round" stroke-linejoin="round"/>
        </svg>
    </div>
    <div class="tournament-image-wrapper">
        <img
            class="tournament-image"
            src={tournament.foto}
            alt="Tournament Banner"
        />
    </div>

    <div class="tournament-header-content">
        <div class="tournament-info">
            <h1>{tournament.nome}</h1>
            <div class="stats">
                <!-- Player stats -->
                <span class="stats-element players">
                    <svg
                        width="21"
                        height="16"
                        viewBox="0 0 21 16"
                        fill="none"
                        xmlns="http://www.w3.org/2000/svg"
                    >
                        <path
                            d="M3.01587 6.84692C4.11899 6.84692 5.01587 5.901 5.01587 4.73755C5.01587 3.5741 4.11899 2.62817 3.01587 2.62817C1.91274 2.62817 1.01587 3.5741 1.01587 4.73755C1.01587 5.901 1.91274 6.84692 3.01587 6.84692ZM17.0159 6.84692C18.119 6.84692 19.0159 5.901 19.0159 4.73755C19.0159 3.5741 18.119 2.62817 17.0159 2.62817C15.9127 2.62817 15.0159 3.5741 15.0159 4.73755C15.0159 5.901 15.9127 6.84692 17.0159 6.84692ZM18.0159 7.90161H16.0159C15.4659 7.90161 14.969 8.13562 14.6065 8.51465C15.8659 9.24304 16.7596 10.5581 16.9534 12.1204H19.0159C19.569 12.1204 20.0159 11.649 20.0159 11.0657V10.011C20.0159 8.84753 19.119 7.90161 18.0159 7.90161ZM10.0159 7.90161C11.9502 7.90161 13.5159 6.25037 13.5159 4.21021C13.5159 2.17004 11.9502 0.518799 10.0159 0.518799C8.08149 0.518799 6.51587 2.17004 6.51587 4.21021C6.51587 6.25037 8.08149 7.90161 10.0159 7.90161ZM12.4159 8.9563H12.1565C11.5065 9.28589 10.7846 9.48364 10.0159 9.48364C9.24712 9.48364 8.52837 9.28589 7.87524 8.9563H7.61587C5.62837 8.9563 4.01587 10.657 4.01587 12.7532V13.7024C4.01587 14.5758 4.68774 15.2844 5.51587 15.2844H14.5159C15.344 15.2844 16.0159 14.5758 16.0159 13.7024V12.7532C16.0159 10.657 14.4034 8.9563 12.4159 8.9563ZM5.42524 8.51465C5.06274 8.13562 4.56587 7.90161 4.01587 7.90161H2.01587C0.912744 7.90161 0.0158691 8.84753 0.0158691 10.011V11.0657C0.0158691 11.649 0.462744 12.1204 1.01587 12.1204H3.07524C3.27212 10.5581 4.16587 9.24304 5.42524 8.51465Z"
                            fill="#BEBEBE"
                        />
                    </svg>
                    {countJogadores} Jogadores
                </span>
                <!-- Game stats -->
                <span class="stats-element game">
                    <svg
                        width="21"
                        height="12"
                        viewBox="0 0 21 12"
                        fill="none"
                        xmlns="http://www.w3.org/2000/svg"
                    >
                        <path
                            d="M15.0177 0.628174H5.01623C4.19189 0.62805 3.38031 0.84292 2.65374 1.25365C1.92717 1.66439 1.30816 2.25824 0.851827 2.98235C0.395489 3.70645 0.11598 4.53834 0.0381843 5.40394C-0.0396114 6.26954 0.0867202 7.14201 0.405932 7.94366C0.725144 8.74531 1.22733 9.45127 1.86778 9.99869C2.50824 10.5461 3.26708 10.918 4.07676 11.0813C4.88644 11.2445 5.72183 11.1941 6.50856 10.9344C7.29528 10.6748 8.00893 10.214 8.58597 9.59302H11.4458C12.0227 10.2139 12.7363 10.6747 13.5229 10.9343C14.3095 11.194 15.1448 11.2445 15.9544 11.0814C16.764 10.9182 17.5229 10.5465 18.1633 9.99923C18.8038 9.45198 19.306 8.74621 19.6254 7.94472C19.9447 7.14324 20.0712 6.27091 19.9937 5.40538C19.9161 4.53985 19.6369 3.70797 19.1808 2.98379C18.7248 2.25961 18.106 1.66559 17.3797 1.25461C16.6534 0.843626 15.8419 0.62843 15.0177 0.628174ZM7.76603 6.29712C7.76603 6.40201 7.72652 6.50261 7.6562 6.57679C7.58588 6.65096 7.49051 6.69263 7.39106 6.69263H5.76617V8.40649C5.76617 8.51139 5.72667 8.61199 5.65635 8.68616C5.58602 8.76033 5.49065 8.802 5.3912 8.802H4.64125C4.5418 8.802 4.44643 8.76033 4.37611 8.68616C4.30579 8.61199 4.26628 8.51139 4.26628 8.40649V6.69263H2.6414C2.54195 6.69263 2.44657 6.65096 2.37625 6.57679C2.30593 6.50261 2.26642 6.40201 2.26642 6.29712V5.5061C2.26642 5.40121 2.30593 5.30061 2.37625 5.22644C2.44657 5.15227 2.54195 5.1106 2.6414 5.1106H4.26628V3.39673C4.26628 3.29183 4.30579 3.19123 4.37611 3.11706C4.44643 3.04289 4.5418 3.00122 4.64125 3.00122H5.3912C5.49065 3.00122 5.58602 3.04289 5.65635 3.11706C5.72667 3.19123 5.76617 3.29183 5.76617 3.39673V5.1106H7.39106C7.49051 5.1106 7.58588 5.15227 7.6562 5.22644C7.72652 5.30061 7.76603 5.40121 7.76603 5.5061V6.29712ZM14.5155 8.802C14.2683 8.802 14.0267 8.72468 13.8211 8.57982C13.6156 8.43496 13.4554 8.22906 13.3608 7.98816C13.2662 7.74726 13.2414 7.48218 13.2897 7.22644C13.3379 6.97071 13.4569 6.7358 13.6317 6.55142C13.8065 6.36705 14.0292 6.24148 14.2717 6.19062C14.5142 6.13975 14.7655 6.16585 14.9939 6.26564C15.2223 6.36542 15.4175 6.5344 15.5548 6.7512C15.6922 6.968 15.7655 7.2229 15.7655 7.48364C15.7655 7.83329 15.6338 8.16862 15.3994 8.41586C15.165 8.6631 14.847 8.802 14.5155 8.802ZM16.5154 5.63794C16.2682 5.63794 16.0265 5.56062 15.821 5.41576C15.6154 5.27089 15.4552 5.06499 15.3606 4.82409C15.266 4.5832 15.2413 4.31812 15.2895 4.06238C15.3377 3.80664 15.4568 3.57174 15.6316 3.38736C15.8064 3.20298 16.0291 3.07742 16.2716 3.02655C16.514 2.97568 16.7653 3.00179 16.9937 3.10157C17.2221 3.20136 17.4173 3.37034 17.5547 3.58714C17.692 3.80394 17.7653 4.05883 17.7653 4.31958C17.7653 4.66923 17.6336 5.00456 17.3992 5.2518C17.1648 5.49904 16.8469 5.63794 16.5154 5.63794Z"
                            fill="#BEBEBE"
                        />
                    </svg>
                    {tournament.jogo}
                </span>
                <!-- Type stats -->
                <span class="stats-element type">
                    <svg
                        width="21"
                        height="22"
                        viewBox="0 0 21 22"
                        fill="none"
                        xmlns="http://www.w3.org/2000/svg"
                    >
                        <path
                            d="M0.867497 0.358377C0.608792 0.4501 0.385665 0.628612 0.232193 0.866648C0.0787217 1.10468 0.0033426 1.38916 0.0175689 1.67662V14.8591C0.0175689 15.2087 0.149254 15.544 0.383654 15.7912C0.618055 16.0385 0.93597 16.1773 1.26746 16.1773H7.51693V18.8138H5.01714C3.64226 18.8138 2.51736 20.0003 2.51736 21.4503H17.5161C17.5161 20.0003 16.3912 18.8138 15.0163 18.8138H12.5165V16.1773H18.766C19.0975 16.1773 19.4154 16.0385 19.6498 15.7912C19.8842 15.544 20.0159 15.2087 20.0159 14.8591V1.67662C20.0159 1.327 19.8842 0.991702 19.6498 0.744483C19.4154 0.497264 19.0975 0.358377 18.766 0.358377L1.26746 0.358377C1.19262 0.351244 1.11732 0.351244 1.04248 0.358377C0.992531 0.35521 0.942445 0.35521 0.892495 0.358377L0.867497 0.358377ZM2.51736 2.99487H17.5161V13.5409H2.51736V2.99487Z"
                            fill="#BEBEBE"
                        />
                    </svg>
                    {capitalizeFirstLetter(tournament.tipo)}
                </span>
                <!-- Date stats -->
                <span class="stats-element date">
                    <svg
                        width="21"
                        height="22"
                        viewBox="0 0 21 22"
                        fill="none"
                        xmlns="http://www.w3.org/2000/svg"
                    >
                        <path
                            d="M17.0159 2.46411H16.0159V1.40942C16.0159 0.776611 15.6159 0.354736 15.0159 0.354736C14.4159 0.354736 14.0159 0.776611 14.0159 1.40942V2.46411H6.01587V1.40942C6.01587 0.776611 5.61587 0.354736 5.01587 0.354736C4.41587 0.354736 4.01587 0.776611 4.01587 1.40942V2.46411H3.01587C1.31587 2.46411 0.0158691 3.83521 0.0158691 5.62817V6.68286H20.0159V5.62817C20.0159 3.83521 18.7159 2.46411 17.0159 2.46411ZM0.0158691 18.2844C0.0158691 20.0774 1.31587 21.4485 3.01587 21.4485H17.0159C18.7159 21.4485 20.0159 20.0774 20.0159 18.2844V8.79224H0.0158691V18.2844ZM15.0159 10.9016C15.6159 10.9016 16.0159 11.3235 16.0159 11.9563C16.0159 12.5891 15.6159 13.011 15.0159 13.011C14.4159 13.011 14.0159 12.5891 14.0159 11.9563C14.0159 11.3235 14.4159 10.9016 15.0159 10.9016ZM15.0159 15.1204C15.6159 15.1204 16.0159 15.5422 16.0159 16.175C16.0159 16.8079 15.6159 17.2297 15.0159 17.2297C14.4159 17.2297 14.0159 16.8079 14.0159 16.175C14.0159 15.5422 14.4159 15.1204 15.0159 15.1204ZM10.0159 10.9016C10.6159 10.9016 11.0159 11.3235 11.0159 11.9563C11.0159 12.5891 10.6159 13.011 10.0159 13.011C9.41587 13.011 9.01587 12.5891 9.01587 11.9563C9.01587 11.3235 9.41587 10.9016 10.0159 10.9016ZM10.0159 15.1204C10.6159 15.1204 11.0159 15.5422 11.0159 16.175C11.0159 16.8079 10.6159 17.2297 10.0159 17.2297C9.41587 17.2297 9.01587 16.8079 9.01587 16.175C9.01587 15.5422 9.41587 15.1204 10.0159 15.1204ZM5.01587 10.9016C5.61587 10.9016 6.01587 11.3235 6.01587 11.9563C6.01587 12.5891 5.61587 13.011 5.01587 13.011C4.41587 13.011 4.01587 12.5891 4.01587 11.9563C4.01587 11.3235 4.41587 10.9016 5.01587 10.9016ZM5.01587 15.1204C5.61587 15.1204 6.01587 15.5422 6.01587 16.175C6.01587 16.8079 5.61587 17.2297 5.01587 17.2297C4.41587 17.2297 4.01587 16.8079 4.01587 16.175C4.01587 15.5422 4.41587 15.1204 5.01587 15.1204Z"
                            fill="#BEBEBE"
                        />
                    </svg>
                    {dateFormat(tournament.dataCriacao)}
                </span>
            </div>
        </div>
        <div class="tournament-owner">
            <div class="owner-info">
                <div class="owner-text">Organizado por</div>
                <div class="owner-name">{owner.apelido}</div>
            </div>
            <img src={owner.foto} alt="" class="owner-img" />
        </div>
    </div>

    <div class="tournament-nav">
        <ul class="tournament-nav-list">
            <li class:active={$currentPath && isActive("/tournament-view/" + tournamentId)}>
                <a href="/tournament-view/{tournamentId}">Informações</a>
            </li>
            <li class:active={$currentPath && isActive("/tournament-view/" + tournamentId + "/historico")}>
                <a href="/tournament-view/{tournamentId}/historico">Histórico</a>
            </li>
            <li class:active={$currentPath && isActive("/tournament-view/" + tournamentId + "/posicoes")}>
                <a href="/tournament-view/{tournamentId}/posicoes">Posições das equipes</a>
            </li>
            {#if $page.data.user.id == owner.id}
                <li class:active={$currentPath && isActive("/tournament-view/" + tournamentId + "/configs")}>
                    <a href="/tournament-view/{tournamentId}/configs">Configurações</a>
                </li>
            {/if}
        </ul>
    </div>
</div>

<style>
    .back-arrow{
        left: 20px;
        top: 20px;
        position: absolute;
        cursor: pointer;
    }

    .back-arrow svg {
        width: 60px;
    }
    .active {
        border-bottom: 3px solid #ffb300;
    }
    .tournament-nav-list > li > a {
        text-decoration: none;
        color: var(--text-color);
        line-height: 50px;
        vertical-align: middle;
        text-align: center;
        padding: 15px 1rem;
        /* border: red solid 1px; */
    }
    .tournament-nav-list > li {
        height: 50px;
    }
    .tournament-nav-list {
        display: flex;
        flex-direction: row;
        list-style: none;
        padding: 0;
        margin: 0;
        margin-left: 35px;
        gap: 1rem;
    }

    .tournament-owner {
        align-items: center;
        gap: 1rem;
        display: flex;
        flex-direction: row;
    }

    .owner-name {
        color: #638aff;
    }
    .owner-info {
        font-size: 1.25rem;
        line-height: 1.75rem;
        text-align: right;
    }

    .tournament-owner img {
        width: 7rem;
        border-radius: 100px;
    }
    .tournament-header {
        background-color: var(--secondary-color);
    }
    .tournament-header-content {
        display: flex;
        justify-content: space-between;
        padding: 1.75rem;
    }
    .tournament-info {
        display: flex;
        flex-direction: column;
        line-height: 0.2rem;
        justify-content: center;
        /* border: red solid 1px; */
    }

    .tournament-image-wrapper {
        width: 100vw;
        height: 33vh;
        overflow: hidden;
        border-radius: 10px;
    }
    .tournament-image {
        width: 100%;
        float: center;
    }

    .stats {
        display: flex;
        flex-direction: row;
        align-items: center;
        gap: 25px;
        flex-wrap: wrap;
    }

    .stats-element {
        display: flex;
        align-items: center;
    }
    .stats-element svg {
        margin-right: 0.5rem;
    }
</style>
