
import { redirect } from "@sveltejs/kit"
export const load = ({ locals }) => {
    // Check if the user is authenticated
    if (locals.user) {
        // If not, throw a redirect exception to the home page
        throw redirect(302, '/home')
    }
}