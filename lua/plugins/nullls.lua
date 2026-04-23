local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
    sources = {
		-- clang-format nur für C und C++-Dateien
		null_ls.builtins.formatting.clang_format.with({
			filetypes = { "c", "cpp", "cc", "cxx" },  
		}),
})
