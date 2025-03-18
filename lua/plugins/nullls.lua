local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
    sources = {
		-- clang-format nur für C und C++-Dateien
		null_ls.builtins.formatting.clang_format.with({
			filetypes = { "c", "cpp", "cc", "cxx" },  
		}),

		-- clang-format als Formatierer
		null_ls.builtins.formatting.clang_format,
    
		-- cppcheck als Linter
		-- null_ls.builtins.diagnostics.cppcheck,
		-- null_ls.builtins.diagnostics.cpplint,
    
		-- clangd für die Sprache
		-- null_ls.builtins.completion.lsp,

		-- Optional: clangd für LSP-Completion nur für C/C++ aktiv
		-- null_ls.builtins.completion.lsp.with({
		--	filetypes = { "c", "cpp", "cc", "cxx" },  
		--}),
    },
	-- on_attach = function(client, bufnr)
	--         if client.supports_method("textDocument/formatting") then
	--             vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
	--             vim.api.nvim_create_autocmd("BufWritePre", {
	--                 group = augroup,
	--                 buffer = bufnr,
	--                 callback = function()
	--                     vim.lsp.buf.format({ 
	-- 					bufnr = bufnr,
	-- 					filter = function(client)
	-- 						return client.name == "null-ls"
	-- 					end
	-- 				 })
	--                     -- vim.lsp.buf.formatting_sync()
	--                 end,
	--             })
	--         end
	--     end,
})
