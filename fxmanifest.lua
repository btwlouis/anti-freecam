fx_version 'adamant'
game 'gta5'

author 'btwlouis'
version '0.0.1'
description 'FreeCam detector'

escrow_ignore {
    'config/serverconfig.lua'
}

client_scripts {
    'client/*.lua',
}

server_scripts {
    'config/serverconfig.lua',
    'server/server.lua'
}

dependencies  {
    '/server:12882',
    'screenshot-basic'
}