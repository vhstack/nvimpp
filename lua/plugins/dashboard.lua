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

-- Funktion zum Prüfen ob aktuelles Verzeichnis ein Git-Repo ist
local function in_git_repo()
  local git_dir = vim.fn.systemlist("git rev-parse --is-inside-work-tree")[1]
  return git_dir == "true"
end

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
		desc = 'Find text',
		desc_hl = 'String',
		key = 'w',
		keymap = 'SPC f w',
		key_hl = 'Number',
		action = ':Telescope live_grep'
	}
}

-- Optional: Git Branches Button nur wenn in Git-Repo
if in_git_repo() then
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
