fx_version 'cerulean'
game 'gta5'

author 'YourName'
description 'QBCore Pawnshop using ox_inventory and interact'
version '1.0.0'

-- What to load
shared_script 'config.lua'
server_script 'server.lua'
client_script 'client.lua'

-- Dependencies
dependency 'qb-core'
dependency 'ox_inventory'
dependency 'interact'

-- Optional: if you want to use QBCore input dialog for menu
lua54 'yes'
