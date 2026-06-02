-- Vim Enstellungen
-- vim.g.did_load_filetypes = 1
-- formatoptions ist buffer-lokal -> per FileType-Autocmd setzen,
-- sonst ueberschreiben ftplugins die Einstellung wieder.
vim.api.nvim_create_autocmd("FileType", {
  callback = function()
    vim.opt_local.formatoptions = "qrnj1"
  end,
})
vim.opt.showmode = false
vim.opt.updatetime = 500
vim.wo.signcolumn = "yes"
vim.opt.scrolloff = 8
vim.opt.wrap = true
vim.wo.linebreak = true
vim.opt.virtualedit = "block"
vim.opt.undofile = true
vim.opt.shell = "/bin/bash"

-- Letzte Cursor Position merken
vim.o.shada = "'100,f1"

-- Speichert automatisch, wenn nötig
vim.opt.autowrite = true 

-- Aktive Zeile
vim.opt.cursorline = true

-- Maus
vim.opt.mouse = ""
vim.opt.mousefocus = true

-- Linien Nummer
vim.opt.number = true
vim.opt.relativenumber = true

-- Splits
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Clipboard
vim.opt.clipboard = {}

-- Shorter Nachrichten
vim.opt.shortmess:append("c")

-- Indent Einstellungen
vim.opt.expandtab = false
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.cindent = true

-- Fuelchars
vim.opt.fillchars = {
    vert = "│",
    fold = "⠀",
    eob = " ", -- suppress ~ at EndOfBuffer
    -- diff = "⣿", -- alternatives = ⣿ ░ ─ ╱
    msgsep = "‾",
    foldopen = "▾",
    foldsep = "│",
    foldclose = "▸"
}

-- Hervorhebung zurücksetzen
vim.api.nvim_set_hl(0, "LineNr", {})
vim.api.nvim_set_hl(0, "SignColumn", {})

-- Letzte Cursor Position merken
vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "*",
  callback = function()
    local last_pos = vim.api.nvim_buf_get_mark(0, '"')
    local line_count = vim.api.nvim_buf_line_count(0)

    if last_pos[1] > 0 and last_pos[1] <= line_count then
      vim.api.nvim_win_set_cursor(0, last_pos)
    end
  end,
})

-- Diagnostics Config
vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN] = "",
      [vim.diagnostic.severity.INFO] = "",
      [vim.diagnostic.severity.HINT] = "",
    }
  }
})

-- AltGr-Fix für Windows Terminal über SSH:
-- CSI-u / modifyOtherKeys wieder abschalten, das WT bei AltGr verstümmelt.
vim.api.nvim_create_autocmd("UIEnter", {
  callback = function()
   io.stdout:write("\27[<1u")    -- Kitty/CSI-u-Flags zurücknehmen
   --io.stdout:write("\27[>4;0m")  -- modifyOtherKeys deaktivieren
  end,
})

-- Vervollständigung aktueller Pfad der Datei mit %% 
vim.keymap.set("c", "%%", function()
	return vim.fn.expand("%:h") .. "/"
end, { expr = true })
