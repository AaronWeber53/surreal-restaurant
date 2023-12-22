fx_version 'cerulean'
game 'gta5'

shared_scripts {
    'config.lua',
	'jobs/*.lua'
}

client_scripts {
	'client/main.lua',
	'client/consumable.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
	'server/main.lua',
	'server/consumable.lua',
}
