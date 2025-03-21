-- Terminal GUI Farben
vim.opt.termguicolors = true

-- Definiert Theme
function SetColor(color)
    color = color or "catppuccin"
    vim.cmd.colorscheme(color)
end

-- Theme setzen
SetColor(vim.g.colorscheme)
