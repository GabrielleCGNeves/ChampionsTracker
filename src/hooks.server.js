import { prisma } from "$lib/server/prisma";

export const handle = async ({ event, resolve }) => {
    // get cookies from browser
    const session = event.cookies.get('session')
  
    if (!session) {
      // if there is no session load page as normal
      return await resolve(event)
    }
  
    // find the user based on the session
    const user = await prisma.tb_usuario.findUnique({
      where: { usu_authToken: session },
      select: { 
        usu_apelido: true, 
        usu_email: true, 
        usu_foto: true, 
        usu_idUsuario: true 
    },
    })
  
    // if `user` exists set `events.local`
    if (user) {
      event.locals.user = {
        username: user.usu_apelido,
        email: user.usu_email,
        image: user.usu_foto,
        id: user.usu_idUsuario
      }
    }
  
    // load page as normal
    return await resolve(event)
  }