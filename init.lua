-- NeoVim Konfiguration zusammengestellt für C/C++ Development
-- Author: Viktor Herzog
-- GitHub: https://github.com/vhstack/nvimpp

-- Basic config
require("core.plugins")
require("core.configs")
require("core.mappings")
require("core.colors")

-- Plugins config
require("plugins.telescope")
require("plugins.mason")
require("plugins.nullls")
require("plugins.lualine")
require("plugins.gitsigns")
require("plugins.treesitter")
require("plugins.toggleterm")
require("plugins.outline")
require("plugins.autopairs")
require("plugins.comments")
require("plugins.buffline")
require("plugins.blankline")
require("plugins.neotree")
require("plugins.dashboard")
require("plugins.whichkey")
require("plugins.outline")

-- LSP Konfiguration
if vim.g.is_lsp_enabled then
	require("plugins.cmp")
	require("plugins.lsp")
end

-- Transparenz
if vim.g.is_transparency_enabled then
	require('transparent').clear_prefix('BufferLine')
	require('transparent').clear_prefix('NeoTree')
	require('transparent').clear_prefix('whichkey')
	--require('transparent').clear_prefix('lualine')
	vim.cmd('TransparentEnable')
else
	vim.cmd('TransparentDisable')
end
