local M = {}

-- Polyfill / De-Deprecation: vim.tbl_flatten
-- Mehrere Plugins (lualine, bufferline, telescope, neo-tree, ...) rufen noch
-- vim.tbl_flatten auf. Ab nvim 0.10 ist die Funktion deprecated (Warnung beim
-- Start), in künftigen Versionen wird sie entfernt. Wir ersetzen sie durch eine
-- stille, verhaltensgleiche Implementierung:
--   * neueres nvim -> keine Deprecation-Warnung mehr, später kein Crash
--   * älteres nvim -> identisches Verhalten
local function tbl_flatten(t)
    local result = {}
    local function rec(list)
        for i = 1, #list do
            local v = list[i]
            if type(v) == "table" then
                rec(v)
            elseif v ~= nil then
                result[#result + 1] = v
            end
        end
    end
    rec(t)
    return result
end
vim.tbl_flatten = tbl_flatten
M.tbl_flatten = tbl_flatten

-- Feature-Detection, nicht Version-Detection
M.has_lsp_config = vim.lsp.config ~= nil
M.has_diagnostic_jump = vim.diagnostic.jump ~= nil
M.has_treesitter_new_api = vim.fn.has('nvim-0.11') == 1
M.has_vim_uv = vim.uv ~= nil

-- Version-String für Logging/Debugging
M.nvim_version = vim.version()
M.version_string = string.format("%d.%d.%d",
    M.nvim_version.major,
    M.nvim_version.minor,
    M.nvim_version.patch
)

-- Compat-Wrapper: uv statt loop
M.uv = vim.uv or vim.loop

-- Diagnostic-Jump-Wrapper — einheitliche API über alle Versionen
function M.diagnostic_jump_prev()
    if M.has_diagnostic_jump then
        vim.diagnostic.jump({ count = -1, float = true })
    else
        vim.diagnostic.goto_prev()
    end
end

function M.diagnostic_jump_next()
    if M.has_diagnostic_jump then
        vim.diagnostic.jump({ count = 1, float = true })
    else
        vim.diagnostic.goto_next()
    end
end

-- Hover-Wrapper
function M.lsp_hover()
    if vim.fn.has('nvim-0.11') == 1 then
        vim.lsp.buf.hover({ focusable = false, border = "rounded" })
    else
        vim.lsp.buf.hover()
    end
end

return M
