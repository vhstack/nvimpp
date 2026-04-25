-- Prüfen, ob das Plugin überhaupt schon geladen wurde
local has_new_api = vim.fn.has('nvim-0.11') == 1

if has_new_api then
	require('nvim-treesitter').install({ "c", "cpp", "lua", "python", "vim", "vimdoc" })
	vim.api.nvim_create_autocmd('FileType', {
	  pattern = { "c", "cpp", 'lua', 'vim' },
	  callback = function()
		vim.treesitter.start()
		vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
		vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
	  end,
	})
else
	require'nvim-treesitter.configs'.setup {
		ensure_installed = { "c", "cpp", "lua", "python", "vim", "vimdoc" },

		sync_install = false,
		auto_install = true,
		highlight = {
			enable = true,
		},
		indent = {
			enable = true,
		}
	}
end
