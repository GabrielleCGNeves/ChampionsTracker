import { prisma } from "$lib/server/prisma";

export const handle = async ({ event, resolve }) => {
    // get cookies from browser
    const session = event.cookies.get('session')
  
    if (!session) {
      // if there is no session load page as normal
      return await resolve(event)
    }
  
    // find the user based on the session
    const user = await prisma.Usuario.findUnique({
      where: { authToken: session },
      select: { 
        apelido: true, 
        email: true, 
        foto: true, 
        id: true ,
        role: true,
    },
    })
  
    // if `user` exists set `events.local`
    if (user) {
      event.locals.user = {
        username: user.apelido,
        email: user.email,
        image: user.foto,
        id: user.id,
        role: user.role
      }
    }
  
    // load page as normal
    return await resolve(event)
  }