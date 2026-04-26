local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
local uv = vim.uv or vim.loop
if not uv.fs_stat(lazypath) then
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
   	{'rebelot/kanagawa.nvim'},
	{'catppuccin/nvim'},

	-- Telescope
	{
		'nvim-telescope/telescope.nvim',
		cmd = "Telescope",
		commit = '84b9ba0',
		dependencies = {'nvim-lua/plenary.nvim'},
		config = function()
            require("plugins.telescope")
        end,

	}, 

	-- Transparenz
	{
		'xiyaowong/transparent.nvim',
		cmd = { "TransparentToggle", "TransparentEnable", "TransparentDisable" }
	},

	-- Indent Blankline
	{'lukas-reineke/indent-blankline.nvim',
		main = "ibl",
		scope = {enabled = true},
		---@module "ibl"
		---@type ibl.config
		opts = {},
	},

	-- Syntax Treesitter
	{
		'nvim-treesitter/nvim-treesitter',
		branch = vim.fn.has('nvim-0.11') == 1 and 'main' or 'master',
		lazy = false,
		build = ":TSUpdate",
		build = function()
			-- master: :TSUpdate existiert, main: install() wird anders gehandhabt
			if vim.fn.has('nvim-0.11') == 0 then
				vim.cmd('TSUpdate')
			end
		end,
	},

	-- LSP Konfiguration
	{
		'neovim/nvim-lspconfig',
		commit = "38de86f...",
		cond = function()
			return vim.g.is_lsp_enabled == true
		end,
	}, 

	-- Autocomplete
    {
		'hrsh7th/cmp-nvim-lsp',
		commit = "a8912b88ce488f411177fc8aed358b04dc246d7b"
	}, 
	{'hrsh7th/cmp-buffer'}, {'hrsh7th/cmp-path'},
    {'hrsh7th/cmp-cmdline'}, {'hrsh7th/nvim-cmp'}, 

	-- Git Signs
	{
		'lewis6991/gitsigns.nvim',
		cond = function()
			return vim.g.is_git_enabled == true
		end,
		event = { "BufReadPre", "BufNewFile" }
	},

	-- Status Line
    {
        'nvim-lualine/lualine.nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons', 
			'linrongbin16/lsp-progress.nvim'
        }
    }, 

	-- Mason Plugins
    {
		"williamboman/mason.nvim",
		cmd = { "Mason" },
		opts = {},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = { "tree-sitter-cli" },
			})
		end,
	},

	-- Terminal
    {
		'akinsho/toggleterm.nvim', 
		cmd = { "ToggleTerm" },
		version = "*", 
		config = function()
            require("plugins.toggleterm")
        end,
	},

	-- Conform Formatter
	{
		'stevearc/conform.nvim',
		cmd = { "ConformInfo" },
		opts = {
			formatters_by_ft = {
				c   = { "clang_format" },
				cpp = { "clang_format" },
			},
		},
	},

	-- Auto Klammern
	{
		'windwp/nvim-autopairs',
		event = { "InsertEnter" },
		config = function()
            require("plugins.autopairs")
        end,
	},

	-- Komments Plugin
	{'terrortylor/nvim-comment'},

	-- Neo Tree Explorer
	{
        "nvim-neo-tree/neo-tree.nvim",
		cmd = { "Neotree" },
        dependencies = {
            "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim", "s1n7ax/nvim-window-picker"
        },
		config = function()
            require("plugins.neotree")
        end,
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
	{
		'hedyhli/outline.nvim',
		cmd = {"Outline"},
		config = function()
            require("plugins.outline")
        end,
	},

	-- Dashboard
	{
        'nvimdev/dashboard-nvim',
		commit = "63e83ad",
        event = 'VimEnter',
        dependencies = {{'nvim-tree/nvim-web-devicons'}}
    }, 

	-- Key Binding Hilfe
	{
		'folke/which-key.nvim',
		event = "VeryLazy",
		config = function()
            require("plugins.whichkey")
        end,
	},

	-- Snips
	{'L3MON4D3/LuaSnip', version = "v2.*"},
	{'saadparwaiz1/cmp_luasnip'},

	-- Colorizer 
	{
		"catgoose/nvim-colorizer.lua",
		event = "BufReadPre",
		opts = {},  
	},

	-- Multiple Highlighting
	{'lfv89/vim-interestingwords'},

	-- Doxygen Autodokumentation
    {
		'danymat/neogen', 
		cmd = { "Neogen" },
	    config = true
	},

	-- Log Colorizer
	{
		'0xferrous/ansi.nvim',
		ft = { "log" }, 
	    config = function()
	      	require("ansi").setup({
				auto_enable = false,
				filetypes = { "log" },
				theme = 'catppuccin'
			})
	    end
	},
});
