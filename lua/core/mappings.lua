-- Globale Leader Taste
vim.g.mapleader = " "

-- Lokale Funktionen
local functions = require("core.functions")

-- Lokale Variablen
local opts = { noremap = true, silent = true }

-- Eigene Einstellungen von VIM
vim.keymap.set('n', '<F5>', ':Neogen<CR>', opts)
vim.keymap.set('i', '<F5>', '<ESC>:Neogen<CR>', opts)
vim.keymap.set('n', '<F9>', ':make<CR>', opts);
vim.keymap.set('i', '<F9>', '<ESC>:make<CR>', opts);
vim.keymap.set('n', '<F10>', ':make clean<CR>:make -j3<CR>', opts);
vim.keymap.set('i', '<F10>', '<ESC>:make clean<CR>:make -j3<CR>', opts);
vim.keymap.set('n', '<F12>', ':bd<CR>', opts)
vim.keymap.set('i', '<F12>', '<ESC>:bd<CR>', opts)

-- Terminal Normalmodus
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], opts)

-- Zeilennummern umschalten
vim.keymap.set("n", "<leader>n", functions.ToggleLineNumber, opts)

-- Komplette Zeile mit Y kopieren
vim.api.nvim_set_keymap('n', 'Y', 'yy', opts)

-- Addition/Substraktion
vim.keymap.set('n', '+', '<C-a>', opts)
vim.keymap.set('n', '-', '<C-x>', opts)

-- NeoTree
vim.keymap.set('n', '<leader>E', ':Neotree float reveal<CR>', opts)
vim.keymap.set('n', '<leader>e', ':Neotree left reveal<CR>', opts)
if vim.g.is_git_enabled then
	vim.keymap.set('n', '<leader>gs', ':Neotree float git_status<CR>', opts)
end
vim.keymap.set('n', '<c-e>', ':Neotree left toggle<CR>', opts)

-- Telescope
vim.keymap.set("n", "<leader><leader>", ":Telescope oldfiles<CR>", opts)
vim.keymap.set('n', '<leader>ff', ":Telescope find_files<CR>", opts)
vim.keymap.set('n', '<leader>fg', ":Telescope live_grep<CR>", opts)
vim.keymap.set('n', '<leader>fb', ":Telescope buffers<CR>", opts)
vim.keymap.set('n', '<leader>fh', ":Telescope help_tags<CR>", opts)
vim.keymap.set("n", "<c-f>", ":Telescope find_files<CR>", opts)
vim.keymap.set("n", "<c-g>", ":Telescope live_grep<CR>", opts)
vim.keymap.set("n", "<c-b>", ":Telescope buffers<CR>", opts)

-- Telescope Git 
if vim.g.is_git_enabled then
	vim.keymap.set('n', '<leader>gb', ":Telescope git_branches<CR>", opts)
	vim.keymap.set('n', '<leader>gc', ":Telescope git_commits<CR>", opts)
	vim.keymap.set('n', '<leader>gd', ":Telescope git_status<CR>", opts)
end

-- Navigation Fenster
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>', opts)
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>', opts)
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>', opts)
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>', opts)

-- Methoden Übersicht
vim.keymap.set('n', '<c-s>', ':Outline<CR>', opts)

-- Kommentar
vim.keymap.set('n', '<leader>/', ':CommentToggle<CR>', opts)
vim.keymap.set('v', '<leader>/', ':CommentToggle<CR>', opts)

-- Splits
vim.keymap.set('n', '|', ':vsplit<CR>', opts)
vim.keymap.set('n', '\\', ':split<CR>', opts)

--Highlighting
vim.keymap.set('n', '<leader>h', ":call InterestingWords('n')<CR>", opts)
vim.keymap.set('v', '<leader>h', ":call InterestingWords('v')<CR>", opts)
vim.keymap.set('n', '<leader>H', functions.DisableAllHighlights, opts)

-- Andere
vim.keymap.set('n', '<leader>w', ':w<CR>', opts)
vim.keymap.set('n', '<leader>x', ':BufferLinePickClose<CR>', opts)
vim.keymap.set('n', '<leader>s', ':BufferLineSortByTabs<CR>', opts)

-- Tabs
vim.keymap.set('n', '<Tab>', ':BufferLineCycleNext<CR>', opts)
vim.keymap.set('n', '<s-Tab>', ':BufferLineCyclePrev<CR>', opts)
vim.keymap.set('n', '<c-right>', ':BufferLineCycleNext<CR>', opts)
vim.keymap.set('n', '<c-left>', ':BufferLineCyclePrev<CR>', opts)
vim.keymap.set('n', '<c-s-right>', ':BufferLineMoveNext<CR>', opts)
vim.keymap.set('n', '<c-s-left>', ':BufferLineMovePrev<CR>', opts)

-- Transparenz
vim.keymap.set('n', '<leader>T', ':TransparentToggle<CR>', opts);

-- Terminal
vim.keymap.set('n', '<leader>tt', ':ToggleTerm direction=float<CR>', opts)
vim.keymap.set('n', '<leader>th', ':ToggleTerm direction=horizontal<CR>', opts)
vim.keymap.set('n', '<leader>tv', ':ToggleTerm direction=vertical size=40<CR>', opts)

-- Update Plugins
vim.keymap.set('n', '<leader>pl', ':Lazy<CR>', opts)
vim.keymap.set('n', '<leader>pm', ':Mason<CR>', opts)

-- Schnell zwischen Änderungen mit 'g,' und 'g-' springen
vim.keymap.set("n", "g-", "g;", opts)

-- LSP
if vim.g.is_lsp_enabled then
	vim.keymap.set("n", "<leader>lx", functions.TelescopeDiagnostics, opts)
	vim.keymap.set("n", "<leader>lX", vim.diagnostic.open_float, opts)
	vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, opts)
	vim.keymap.set('n', '<leader>ld', vim.lsp.buf.definition, opts)
	vim.keymap.set('n', '<leader>lD', vim.lsp.buf.declaration, opts)
	vim.keymap.set('n', '<leader>lk', vim.lsp.buf.hover, opts)
	vim.keymap.set('n', '<leader>lr', functions.TelescopeReferences, opts)
	vim.keymap.set('n', '<leader>lt', vim.lsp.buf.type_definition, opts)
	vim.keymap.set('n', '<leader>lR', vim.lsp.buf.rename, opts)
	vim.keymap.set('n', '<leader>lF', vim.lsp.buf.format, opts)
	vim.keymap.set('n', '<leader>lp', functions.GenerateCompileCommands, opts)
	vim.keymap.set("n", "<c-x>", functions.TelescopeDiagnostics, opts)
	vim.keymap.set('n', '<c-p>', vim.lsp.buf.definition, opt)
	vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
	vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
	vim.keymap.set("n", "ö", vim.diagnostic.goto_prev, opts)
	vim.keymap.set("n", "ä", vim.diagnostic.goto_next, opts)
	vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, vim.tbl_extend('force', opts, { desc = 'Definition' }))
	vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, vim.tbl_extend('force', opts, { desc = 'Declaration' })) 
	vim.keymap.set('n', 'gr', functions.TelescopeReferences, vim.tbl_extend('force', opts, { desc = 'References' })) 
	vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, vim.tbl_extend('force', opts, { desc = 'Implementation' }))
end

