-- Funktionen kapseln
local M = {}

-- Toggle Zeilennummer 
-- relative->keine->absolute
function M.ToggleLineNumber()
	if not vim.wo.number and not vim.wo.relativenumber then
		vim.wo.number = true
		vim.wo.relativenumber = false
	elseif vim.wo.number and not vim.wo.relativenumber then
		vim.wo.relativenumber = true
	else
		vim.wo.number = false
		vim.wo.relativenumber = false
	end
end

-- Generiert clang Projekt compile_commands.json
function M.GenerateCompileCommands()
	vim.cmd("silent! !(make clean)")
	local tmpfile = vim.fn.expand('/tmp/compilecommands$USER.txt')
	local cmd = "make 2>&1 -wn | egrep 'gcc|clang|clang\\+\\+|c\\+\\+|g\\+\\+.*' > " .. tmpfile
	vim.cmd("silent! !" .. cmd)
	if vim.v.shell_error == 0 then
		local f = io.open(tmpfile, "r")
		if f == nil then
			print("Cannot open file " .. tmpfile)
			return
		end
		local str = f:read("*a")
		f:close()
		os.remove(tmpfile)
		local current_dir = vim.fn.getcwd()
		local entries = {}
		for line in str:gmatch("[^\r\n]+") do
			-- Quelldatei ist das Token mit C/C++-Endung, nicht das letzte Wort
			local filename = line:match("(%S+%.c[cp]?p?)%s") or line:match("(%S+%.cxx)%s")
			if filename ~= nil then
				table.insert(entries, string.format(
					'\t{\n\t\t"directory": "%s",\n\t\t"command": "%s",\n\t\t"file": "%s"\n\t}',
					current_dir, (line:gsub('"', '\\"')), filename))
			end
		end
		local file = io.open(current_dir .. "/compile_commands.json", "w")
		file:write("[\n" .. table.concat(entries, ",\n") .. "\n]\n")
		file:close()
		-- clangd stoppen und in allen Buffern neu anhaengen
		for _, client in ipairs(vim.lsp.get_clients({ name = "clangd" })) do
			client:stop()
		end
		vim.defer_fn(function()
			for _, buf in ipairs(vim.api.nvim_list_bufs()) do
				if vim.api.nvim_buf_is_loaded(buf) and vim.bo[buf].filetype:match("^c") then
					vim.api.nvim_buf_call(buf, function() vim.cmd("doautocmd FileType") end)
				end
			end
		end, 400)
		print("compile_commands.json generated, LSP restarted")
	else
		print("Make failed, error: " .. vim.v.shell_error)
	end
end

-- Zeigt Diagnostic Liste im Telescope
function M.TelescopeDiagnostics()
	require("telescope.builtin").diagnostics() 
end

-- Zeigt Referenzen Liste im Telescope
function M.TelescopeReferences()
	require("telescope.builtin").lsp_references() 
end

-- Deaktiviert alle Highligts
function M.DisableAllHighlights()
	vim.cmd([[
        call UncolorAllWords()
        nohlsearch
    ]])
end

-- Funktion zum Prüfen ob aktuelles Verzeichnis ein Git-Repo ist
function M.IsGitRepo()
	-- GIT muss installiert sein
	if vim.fn.executable("git") ~= 1 then
		return false
	end

	-- Handelt es um GIT Repository
	local git_dir = vim.fn.systemlist("git rev-parse --is-inside-work-tree")[1]
	return git_dir == "true"
end

-- Funktion für farbige Log Ascii Sequenzen 
function M.ToggleAnsiColors() 
  if vim.wo.conceallevel > 0 then
    vim.cmd("AnsiDisable")
  else
    vim.cmd("AnsiEnable")
  end
end

-- Funktionen exportieren
return M

