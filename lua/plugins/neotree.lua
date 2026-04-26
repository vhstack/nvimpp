require'window-picker'.setup({
    autoselect_one = false,
    include_current = false,
    filter_rules = {
        bo = {
            filetype = {'neo-tree', "neo-tree-popup", "notify"},
            buftype = {'terminal', "quickfix"}
        }
    },
    other_win_hl_color = '#e35e4f'
})
vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

require("neo-tree").setup({})
