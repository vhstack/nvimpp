-- Globale Leader Taste
vim.g.mapleader = " "

-- Lokale Funktionen
local functions = require("core.functions")

-- Eigene Einstellungen von VIM
vim.keymap.set('n', '<F5>', ':Neogen<CR>', { silent = true })
vim.keymap.set('i', '<F5>', '<ESC>:Neogen<CR>', { silent = true })
vim.keymap.set('n', '<F9>', ':make<CR>', { silent = true });
vim.keymap.set('i', '<F9>', '<ESC>:make<CR>', { silent = true });
vim.keymap.set('n', '<F10>', ':make clean<CR>:make -j3<CR>', { silent = true });
vim.keymap.set('i', '<F10>', '<ESC>:make clean<CR>:make -j3<CR>', { silent = true });
vim.keymap.set('n', '<F12>', ':bd<CR>', { silent = true })
vim.keymap.set('i', '<F12>', '<ESC>:bd<CR>', { silent = true })

-- Zeilennummern umschalten
vim.keymap.set("n", "<leader>n", functions.ToggleLineNumber, { noremap = true, silent = true })

-- Komplette Zeile mit Y kopieren
vim.api.nvim_set_keymap('n', 'Y', 'yy', { noremap = true, silent = true })

-- NeoTree
vim.keymap.set('n', '<leader>E', ':Neotree float reveal<CR>', { silent = true })
vim.keymap.set('n', '<leader>e', ':Neotree left reveal<CR>', { silent = true })
vim.keymap.set('n', '<leader>gs', ':Neotree float git_status<CR>', { silent = true })
vim.keymap.set('n', '<c-e>', ':Neotree left toggle<CR>', { silent = true })

-- Telescope
vim.keymap.set("n", "<leader><leader>", ":Telescope oldfiles<CR>", { silent = true })
vim.keymap.set('n', '<leader>ff', ":Telescope find_files<CR>", { silent = true })
vim.keymap.set('n', '<leader>fw', ":Telescope live_grep<CR>", { silent = true })
vim.keymap.set('n', '<leader>fb', ":Telescope buffers<CR>", { silent = true })
vim.keymap.set('n', '<leader>fh', ":Telescope help_tags<CR>", { silent = true })
vim.keymap.set("n", "<c-f>", ":Telescope find_files<CR>", { silent = true })
vim.keymap.set("n", "<c-g>", ":Telescope live_grep<CR>", { silent = true })
vim.keymap.set("n", "<c-t>", ":Telescope buffers<CR>", { silent = true })

-- Telescope Git 
vim.keymap.set('n', '<leader>gb', ":Telescope git_branches<CR>", { silent = true })
vim.keymap.set('n', '<leader>gc', ":Telescope git_commits<CR>", { silent = true })
vim.keymap.set('n', '<leader>gd', ":Telescope git_status<CR>", { silent = true })

-- Navigation Fenster
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>', { silent = true })
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>', { silent = true })
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>', { silent = true })
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>', { silent = true })

-- Methoden Übersicht
vim.keymap.set('n', '<c-s>', ':Outline<CR>', { silent = true })

-- Kommentar
vim.keymap.set('n', '<leader>/', ':CommentToggle<CR>', { silent = true })
vim.keymap.set('v', '<leader>/', ':CommentToggle<CR>', { silent = true })

-- Splits
vim.keymap.set('n', '|', ':vsplit<CR>', { silent = true })
vim.keymap.set('n', '\\', ':split<CR>', { silent = true })

--Highlighting
vim.keymap.set('n', '<leader>h', ":call InterestingWords('n')<CR>", { silent = true })
vim.keymap.set('v', '<leader>h', ":call InterestingWords('v')<CR>", { silent = true })
vim.keymap.set('n', '<leader>H', functions.DisableAllHighlights, { silent = true })

-- Andere
vim.keymap.set('n', '<leader>w', ':w<CR>', { silent = true })
vim.keymap.set('n', '<leader>x', ':BufferLinePickClose<CR>', { silent = true })
vim.keymap.set('n', '<leader>s', ':BufferLineSortByTabs<CR>', { silent = true })

-- Tabs
vim.keymap.set('n', '<Tab>', ':BufferLineCycleNext<CR>', { silent = true })
vim.keymap.set('n', '<s-Tab>', ':BufferLineCyclePrev<CR>', { silent = true })
vim.keymap.set('n', '<c-right>', ':BufferLineCycleNext<CR>', { silent = true })
vim.keymap.set('n', '<c-left>', ':BufferLineCyclePrev<CR>', { silent = true })

-- Transparenz
vim.keymap.set('n', '<leader>T', ':TransparentToggle<CR>', { silent = true });

-- Terminal
vim.keymap.set('n', '<leader>tt', ':ToggleTerm direction=float<CR>', { silent = true })
vim.keymap.set('n', '<leader>th', ':ToggleTerm direction=horizontal<CR>', { silent = true })
vim.keymap.set('n', '<leader>tv', ':ToggleTerm direction=vertical size=40<CR>', { silent = true })

-- Update Plugins
vim.keymap.set('n', '<leader>pl', ':Lazy<CR>', { silent = true })
vim.keymap.set('n', '<leader>pm', ':Mason<CR>', { silent = true })

-- Schnell zwischen Änderungen mit 'g,' und 'g-' springen
vim.keymap.set("n", "g-", "g;", { noremap = true, silent = true })

-- LSP
if vim.g.is_lsp_enabled then
	vim.keymap.set("n", "<leader>lg", functions.TelescopeDiagnostics, { noremap = true, silent = true })
	vim.keymap.set("n", "<leader>lG", vim.diagnostic.open_float, { noremap = true, silent = true })
	vim.keymap.set('n', '<leader>ld', vim.lsp.buf.definition, { silent = true })
	vim.keymap.set('n', '<leader>lD', vim.lsp.buf.declaration, { silent = true })
	vim.keymap.set('n', '<leader>lK', vim.lsp.buf.hover, { silent = true })
	vim.keymap.set('n', '<leader>lr', functions.TelescopeReferences, { silent = true })
	vim.keymap.set('n', '<leader>lt', vim.lsp.buf.type_definition, { silent = true })
	vim.keymap.set('n', '<leader>lR', vim.lsp.buf.rename, { silent = true })
	vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format, { silent = true })
	vim.keymap.set('n', '<leader>lp', functions.GenerateCompileCommands, { noremap = true, silent = true })
	vim.keymap.set("n", "<c-d>", functions.TelescopeDiagnostics, { noremap = true, silent = true })
	vim.keymap.set("n", "<c-b>", functions.TelescopeReferences, { noremap = true, silent = true })
	vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { noremap = true, silent = true })
	vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { noremap = true, silent = true })
	vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
	vim.keymap.set('n', '<c-p>', vim.lsp.buf.definition, opt)
	vim.keymap.set('n', 't', vim.lsp.buf.declaration, opt)
	vim.keymap.set('n', 'T', vim.lsp.buf.definition, opt)
end

