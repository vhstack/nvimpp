-- Globale Leader Taste
vim.g.mapleader = " "

-- Lokale Funktionen
local functions = require("core.functions")

-- Eigene Einstellungen von VIM
vim.keymap.set('n', '<F5>', ':Neogen<CR>')
vim.keymap.set('i', '<F5>', '<ESC>:Neogen<CR>')
vim.keymap.set('n', '<F9>', ':make<CR>');
vim.keymap.set('i', '<F9>', '<ESC>:make<CR>');
vim.keymap.set('n', '<F10>', ':make clean<CR>:make -j3<CR>');
vim.keymap.set('i', '<F10>', '<ESC>:make clean<CR>:make -j3<CR>');
vim.keymap.set('n', '<F12>', ':bd<CR>')
vim.keymap.set('i', '<F12>', '<ESC>:bd<CR>')

-- Zeilennummern umschalten
vim.keymap.set("n", "<leader>n", functions.ToggleLineNumber, { noremap = true, silent = true })

-- Komplette Zeile mit Y kopieren
vim.api.nvim_set_keymap('n', 'Y', 'yy', { noremap = true, silent = true })

-- NeoTree
vim.keymap.set('n', '<leader>E', ':Neotree float reveal<CR>')
vim.keymap.set('n', '<leader>e', ':Neotree left reveal<CR>')
vim.keymap.set('n', '<leader>gs', ':Neotree float git_status<CR>')
vim.keymap.set('n', '<c-e>', ':Neotree left toggle<CR>')

-- Telescope
vim.keymap.set("n", "<leader><leader>", ":Telescope oldfiles<CR>")
vim.keymap.set('n', '<leader>ff', ":Telescope find_files<CR>")
vim.keymap.set('n', '<leader>fw', ":Telescope live_grep<CR>")
vim.keymap.set('n', '<leader>fb', ":Telescope buffers<CR>")
vim.keymap.set('n', '<leader>fh', ":Telescope help_tags<CR>")
vim.keymap.set("n", "<c-f>", ":Telescope find_files<CR>")
vim.keymap.set("n", "<c-g>", ":Telescope live_grep<CR>")
vim.keymap.set("n", "<c-t>", ":Telescope buffers<CR>")

-- Telescope Git 
vim.keymap.set('n', '<leader>gb', ":Telescope git_branches<CR>")
vim.keymap.set('n', '<leader>gc', ":Telescope git_commits<CR>")
vim.keymap.set('n', '<leader>gd', ":Telescope git_status<CR>")

-- Navigation
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

-- Methoden Übersicht
vim.keymap.set('n', '<c-s>', ':Outline<CR>')

-- Kommentar
vim.keymap.set('n', '<leader>/', ':CommentToggle<CR>')
vim.keymap.set('v', '<leader>/', ':CommentToggle<CR>')

-- Splits
vim.keymap.set('n', '|', ':vsplit<CR>')
vim.keymap.set('n', '\\', ':split<CR>')

-- Andere
vim.keymap.set('n', '<leader>w', ':w<CR>')
vim.keymap.set('n', '<leader>x', ':BufferLinePickClose<CR>')
vim.keymap.set('n', '<leader>s', ':BufferLineSortByTabs<CR>')
vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')

-- Tabs
vim.keymap.set('n', '<Tab>', ':BufferLineCycleNext<CR>')
vim.keymap.set('n', '<s-Tab>', ':BufferLineCyclePrev<CR>')

-- Transparenz
vim.keymap.set('n', '<leader>T', ':TransparentToggle<CR>');

-- Terminal
vim.keymap.set('n', '<leader>tf', ':ToggleTerm direction=float<CR>')
vim.keymap.set('n', '<leader>th', ':ToggleTerm direction=horizontal<CR>')
vim.keymap.set('n', '<leader>tv', ':ToggleTerm direction=vertical size=40<CR>')

-- Update Plugins
vim.keymap.set('n', '<leader>pl', ':Lazy<CR>')
vim.keymap.set('n', '<leader>pm', ':Mason<CR>')

-- LSP
if vim.g.is_lsp_enabled then
	vim.keymap.set("n", "<leader>lg", vim.diagnostic.setqflist, { noremap = true, silent = true })
	vim.keymap.set("n", "<leader>lG", vim.diagnostic.open_float, { noremap = true, silent = true })
	vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { noremap = true, silent = true })
	vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { noremap = true, silent = true })
	vim.keymap.set('n', '<leader>ld', ':lua vim.lsp.buf.definition()<CR>')
	vim.keymap.set('n', '<leader>lD', ':lua vim.lsp.buf.declaration()<CR>')
	vim.keymap.set('n', '<leader>lK', ':lua vim.lsp.buf.hover()<CR>')
	vim.keymap.set('n', '<leader>lr', ':lua vim.lsp.buf.references()<CR>')
	vim.keymap.set('n', '<leader>lt', ':lua vim.lsp.buf.type_definition()<CR>')
	vim.keymap.set('n', '<leader>lR', ':lua vim.lsp.buf.rename()<CR>')
	vim.keymap.set('n', '<leader>lf', ':lua vim.lsp.buf.format()<CR>')
	vim.keymap.set('n', '<leader>lp', functions.GenerateCompileCommands, { noremap = true, silent = true })
	vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
	vim.keymap.set('n', 't', vim.lsp.buf.declaration, opt)
	vim.keymap.set('n', 'T', vim.lsp.buf.definition, opt)
end

