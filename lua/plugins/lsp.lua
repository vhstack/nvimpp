local ok, lspconfig = pcall(require, "lspconfig")

if vim.lsp.config then
  -- NVim 0.11+
  vim.lsp.config("clangd", {
    capabilities = capabilities,
    cmd = { "clangd", "--compile-commands-dir=build", "--clang-tidy", "--suggest-missing-includes" },
    settings = {
      clangd = {
        formatting = {
          enable = true,
          indentWidth = 4,
          tabWidth = 4,
        }
      }
    }
  })
  
  -- Server aktivieren
  vim.lsp.enable("clangd")
else
  -- NVim 0.10
  lspconfig.clangd.setup({
    capabilities = capabilities,
    cmd = { "clangd", "--compile-commands-dir=build", "--clang-tidy", "--suggest-missing-includes" },
    settings = {
      clangd = {
        formatting = {
          enable = true,
          indentWidth = 4,
          tabWidth = 4,
        }
      }
    }
  })
end

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

-- Kein Focus fuer Diagnostik Fenster
vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    vim.diagnostic.open_float(nil, { focus = false })
  end
})

-- Hover Fenster nicht fokusierbar
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover,
  { focusable = false }
)
