local function default_header()
	return {
	    '', '', '',
		'███╗   ██╗██╗   ██╗██╗███╗   ███╗               ',
		'████╗  ██║██║   ██║██║████╗ ████║  ██╗    ██╗   ',
		'██╔██╗ ██║██║   ██║██║██╔████╔██║██████╗██████╗ ',
		'██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║╚═██╔═╝╚═██╔═╝ ',
		'██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║  ╚═╝    ╚═╝   ',
		'╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝               ',
	    '', '', ''
	}
end

-- Lokale Funktionen
local functions = require("core.functions")

--Standard Buttons
local buttons = {
	{
		icon = '󰈙 ',
		icon_hl = 'Title',
		desc = 'New file',
		desc_hl = 'String',
		key = 'n',
		keymap = 'SPC n',
		key_hl = 'Number',
		action = ':enew'
	},
	{
		icon = '󰚰 ',
		icon_hl = 'Title',
		desc = 'Recent files',
		desc_hl = 'String',
		key = 'r',
		keymap = 'SPC SPC',
		key_hl = 'Number',
		action = ':Telescope oldfiles'
	},
	{
		icon = '󰙅 ',
		icon_hl = 'Title',
		desc = 'Open tree',
		desc_hl = 'String',
		key = 'e',
		keymap = 'SPC e',
		key_hl = 'Number',
		action = ':Neotree float'
	}, {
		icon = '󰈞 ',
		icon_hl = 'Title',
		desc = 'Find files',
		desc_hl = 'String',
		key = 'f',
		keymap = 'SPC f f',
		key_hl = 'Number',
		action = ':Telescope find_files'
	}, {
		icon = ' ',
		icon_hl = 'Title',
		desc = 'Live grep',
		desc_hl = 'String',
		key = 'g',
		keymap = 'SPC f g',
		key_hl = 'Number',
		action = ':Telescope live_grep'
	}
}

-- Optional: Git Branches Button nur wenn in Git-Repo
if vim.g.is_git_enabled then
    table.insert(buttons,
		{
			icon = ' ',
			icon_hl = 'Title',
			desc = 'Git Braches',
			desc_hl = 'String',
			key = 'b',
			keymap = 'SPC g b',
			key_hl = 'Number',
			action = ':Telescope git_branches'
		}
	)
end

-- Dashboard setup
require('dashboard').setup {
    theme = 'doom',
    config = {
        header = default_header(),
        center = buttons,
    }
}
