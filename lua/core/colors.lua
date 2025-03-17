vim.opt.termguicolors = true

function SetColor(color)
    color = color or "catppuccin"
    vim.cmd.colorscheme(color)

    -- vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
    -- vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"})
    -- vim.api.nvim_set_hl(0, "ColorColumn", {bg = "none"})
    -- vim.api.nvim_set_hl(0, "LineNr", {bg = "none"})
end

-- Catppuchin Themes (catppuccini, catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha)
SetColor('catppuccin')

-- Andere Themen
--SetColor('kanagawa-wave')
--SetColor('onedark')

