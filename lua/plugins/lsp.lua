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

-- Konfiguration LSP Diagnostics
vim.diagnostic.config({
  virtual_text = true,       -- zeigt Text inline (in der Codezeile)
  signs = {                  -- zeigt die Gutter-Zeichen (❌ etc.)
    text = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN] = "",
      [vim.diagnostic.severity.INFO] = "",
      [vim.diagnostic.severity.HINT] = "",
    }
  },
  underline = true,          -- unterstreicht problematische Stellen
  update_in_insert = false,
  severity_sort = true,
  float = {
    source = "always",       -- zeige Quelle des Fehlers (z.B. clangd)
    border = "rounded",
  },
})

vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    vim.diagnostic.open_float(nil, { focus = false })
  end
})
