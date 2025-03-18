local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Language Servers
local lspconfig = require('lspconfig')
lspconfig.clangd.setup {
	cmd = { "clangd", "--compile-commands-dir=build", "--clang-tidy", "--suggest-missing-includes" },
	settings = {
		clangd = {
		formatting = {
			enable = true,
			indentWidth = 4,   -- Setzt die Einrückung auf 4 Leerzeichen
			tabWidth = 4,      -- Setzt die Tabulatorbreite auf 4
			--useTab = "never",  -- Verwendet nur Leerzeichen, keine echten Tabs
      }
    }
  }
}

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
-- LspAttach wird dann aufgerufen, wenn Verbindung mit Language Server entsteht
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        -- local opts = {buffer = ev.buf}
        -- vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        -- vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        -- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        -- vim.keymap.set('n', '<Leader>lR', vim.lsp.buf.rename, opts)
        -- vim.keymap.set({'n', 'v'}, '<Leader>la', vim.lsp.buf.code_action, opts)
        -- vim.keymap.set('n', '<Leader>lf',
        --                function() vim.lsp.buf.format {async = true} end, opts)
    end
})
