--require'nvim-treesitter.configs'.setup {
--  ensure_installed = { "c", "cpp", "lua", "vim" },
--
--  sync_install = false,
--  auto_install = true,
--  highlight = {
--    enable = true,
--  },
--  indent = {
--	  enable = true,
--  }
--}

require('nvim-treesitter').install({ 'lua', 'python', 'vim', 'vimdoc' })
vim.api.nvim_create_autocmd('FileType', {
  pattern = { "c", "cpp", 'lua', 'vim' },
  callback = function()
    vim.treesitter.start()
    vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})
