-----------------------------------------------------------------------
--                    Servertime v1.2.0 by Buschfuss©
--                www.respawn-nation.de / discord.gg/rnmg
-----------------------------------------------------------------------


fx_version 'cerulean'
game 'rdr3'

author 'Respawn Nation'
description 'RN Servertime System'
version '1.2.0'

shared_scripts {
    'config.lua',
    'lang.lua'
}

server_script 'server.lua'
client_script 'client.lua'

rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

lua54 'yes'

