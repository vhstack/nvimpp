local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git", "--branch=stable", -- latest stable release
        lazypath
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	-- Colorschemes
	{'cooperuser/glowbeam.nvim'}, 
	{'joshdick/onedark.vim'},
	{'catppuccin/nvim'}, 
    {'rebelot/kanagawa.nvim'},

	-- Telescope
    {
        'nvim-telescope/telescope.nvim',
        --tag = '0.1.8',
        dependencies = {'nvim-lua/plenary.nvim'}
    }, 

	-- Transparenz
	{'xiyaowong/transparent.nvim'},

	-- Indent Blankline
	{'lukas-reineke/indent-blankline.nvim',
		main = "ibl",
		scope = {enabled = true},
		---@module "ibl"
		---@type ibl.config
		opts = {},
	},

	-- Syntax Treesitter
    {'nvim-treesitter/nvim-treesitter'}, 

	-- LSP Konfiguration
	{'neovim/nvim-lspconfig'}, 
    {'hrsh7th/cmp-nvim-lsp'}, {'hrsh7th/cmp-buffer'}, {'hrsh7th/cmp-path'},
    {'hrsh7th/cmp-cmdline'}, {'hrsh7th/nvim-cmp'}, {'lewis6991/gitsigns.nvim'},

	-- Status Line
    {
        'nvim-lualine/lualine.nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons', 
			'linrongbin16/lsp-progress.nvim'
        }
    }, 

	-- Mason Plugins
    {"williamboman/mason.nvim", build = ":MasonUpdate"},

	-- Terminal
    {'akinsho/toggleterm.nvim', version = "*", config = true},

	-- Null LS Formatter
    --{'jose-elias-alvarez/null-ls.nvim'}, 
    {'nvimtools/none-ls.nvim'}, 

	-- Auto Klammern
	{'windwp/nvim-autopairs'},

	-- Komments Plugin
	{'terrortylor/nvim-comment'},

	-- Neo Tree Explorer
	{
        "nvim-neo-tree/neo-tree.nvim",
        --branch = "v2.x",
        dependencies = {
            "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim", "s1n7ax/nvim-window-picker"
        }
    },

	-- Buffer Zeile
    {"akinsho/bufferline.nvim", dependencies = {'nvim-tree/nvim-web-devicons'}},

	-- Anzeige Funktion Signaturen
    {'hrsh7th/cmp-nvim-lsp-signature-help'}, {
        'linrongbin16/lsp-progress.nvim',
        event = {'VimEnter'},
        dependencies = {'nvim-tree/nvim-web-devicons'},
        config = function() require('lsp-progress').setup() end
    }, 

	-- Anzeige Klassen Members
	{'hedyhli/outline.nvim'},

	-- Dashboard
	{
        'nvimdev/dashboard-nvim',
        event = 'VimEnter',
        dependencies = {{'nvim-tree/nvim-web-devicons'}}
    }, 

	-- Key Binding Hilfe
	{'folke/which-key.nvim'},

	-- Snips
    {'hrsh7th/vim-vsnip'},
    {'hrsh7th/vim-vsnip-integ'},

	-- Doxygen Autodokumentation
    {
		'danymat/neogen', 
	    config = true
	},
});
