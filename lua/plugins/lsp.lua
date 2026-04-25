local ok, lspconfig = pcall(require, "lspconfig")

-- cmp-Capabilities ermitteln mit Fallback, falls cmp-nvim-lsp nicht da ist
local capabilities = vim.lsp.protocol.make_client_capabilities()
local cmp_ok, cmp_lsp = pcall(require, "cmp_nvim_lsp")
if cmp_ok then
    capabilities = cmp_lsp.default_capabilities(capabilities)
end

if vim.lsp.config then
  -- NVim 0.11+
  vim.lsp.config("clangd", {
    capabilities = capabilities,
    cmd = { "clangd", "--compile-commands-dir=build", "--clang-tidy", "--suggest-missing-includes" },
	filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
	root_markers = { ".clangd", "compile_commands.json", "compile_flags.txt", ".git" },
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
    local diags = vim.diagnostic.get(0, {
      lnum = vim.api.nvim_win_get_cursor(0)[1] - 1
    })
    if #diags > 0 then
      vim.diagnostic.open_float(nil, { focus = false })
    end
  end
})

-- Hover Fenster nicht fokusierbar
if vim.fn.has('nvim-0.12') == 0 then
	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
		vim.lsp.handlers.hover,
		{ focusable = false }
	)
end
