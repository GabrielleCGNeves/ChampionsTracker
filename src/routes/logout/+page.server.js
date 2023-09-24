import { redirect } from '@sveltejs/kit'

export const load = async ({ cookies }) => {
 
    throw redirect(302, '/login')
}

/** @type {import('./$types').Actions} */
export const actions = {
    default({ cookies }){
        cookies.set('session', '', {
            path: '/',
            expires: new Date(0),
        })
    
        // redirect the user
        
        throw redirect(302, '/login')
    }
};