-- Terminal GUI Farben
vim.opt.termguicolors = true

-- Definiert Theme
function SetColor(color)
    color = color or "catppuccin"
    vim.cmd.colorscheme(color)
end

-- Theme setzen
SetColor(vim.g.colorscheme)

-- Definition Highlighting
vim.g.interestingWordsGUIColors = { "#A6E3A1", "#F9E2AF", "#89B4FA", "#94D2D5", "#FAB387", "#DDB6F2" }
vim.g.interestingWordsTermColors = { "154", "121", "211", "137", "214", "222" }
