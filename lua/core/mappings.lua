vim.g.mapleader = " "

-- Eigene Einstellungen von VIM
vim.keymap.set('n', '<F5>', ':Neogen<CR>')
vim.keymap.set('i', '<F5>', '<ESC>:Neogen<CR>')
vim.keymap.set('n', '<F9>', ':make<CR>');
vim.keymap.set('i', '<F9>', '<ESC>:make<CR>');
vim.keymap.set('n', '<F10>', ':make clean<CR>:make -j3<CR>');
vim.keymap.set('i', '<F10>', '<ESC>:make clean<CR>:make -j3<CR>');
vim.keymap.set('n', '<F12>', ':bd<CR>')
vim.keymap.set('i', '<F12>', '<ESC>:bd<CR>')

-- NeoTree
vim.keymap.set('n', '<leader>E', ':Neotree float reveal<CR>')
vim.keymap.set('n', '<leader>e', ':Neotree left reveal<CR>')
vim.keymap.set('n', '<leader>o', ':Neotree float git_status<CR>')
vim.keymap.set('n', '<leader>o', ':Neotree float git_status<CR>')
vim.keymap.set('n', '<c-e>', ':Neotree left toggle<CR>')

-- Telescope
vim.keymap.set("n", "<leader><leader>", ":Telescope oldfiles<CR>")
vim.keymap.set("n", "<c-p>", ":Telescope find_files<CR>")
vim.keymap.set("n", "<c-f>", ":Telescope live_grep<CR>")
vim.keymap.set("n", "<c-t>", ":Telescope buffers<CR>")

-- Navigation
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')
vim.keymap.set('n', '<leader>/', ':CommentToggle<CR>')

-- Methoden Übersicht
vim.keymap.set('n', '<c-s>', ':Outline<CR>')

-- Splits
vim.keymap.set('n', '|', ':vsplit<CR>')
vim.keymap.set('n', '\\', ':split<CR>')

-- Andere
vim.keymap.set('n', '<leader>w', ':w<CR>')
vim.keymap.set('n', '<leader>x', ':BufferLinePickClose<CR>')
vim.keymap.set('n', '<leader>X', ':BufferLineCloseRight<CR>')
vim.keymap.set('n', '<leader>s', ':BufferLineSortByTabs<CR>')
vim.keymap.set('i', 'jj', '<Esc>')
vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')

-- Tabs
vim.keymap.set('n', '<Tab>', ':BufferLineCycleNext<CR>')
vim.keymap.set('n', '<s-Tab>', ':BufferLineCyclePrev<CR>')

-- Terminal
vim.keymap.set('n', '<leader>tf', ':ToggleTerm direction=float<CR>')
vim.keymap.set('n', '<leader>th', ':ToggleTerm direction=horizontal<CR>')
vim.keymap.set('n', '<leader>tv', ':ToggleTerm direction=vertical size=40<CR>')
