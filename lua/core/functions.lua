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
		local current_dir = vim.fn.getcwd()
		local file = io.open(current_dir .. "/compile_commands.json", "w")
		file:write("[\n")
		for line in str:gmatch("[^\r\n]+") do
			local filename = line:match("[^%s]+$")
			if filename ~= nill then
				local command = line:sub(1, #line - #filename)
				local json = string.format(
					'\t{\n\t\t"directory": "%s",\n\t\t"command": "%s",\n\t\t"file": "%s"\n\t},\n',
					current_dir,
					command,
					filename
				)
				file:write(json)
			end
		end
		file:write("]")
		f:close()
		file:close()
		os.remove(tmpfile)
		vim.cmd("silent! LspRestart")
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

-- Funktionen exportieren
return M

