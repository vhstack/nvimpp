local wk = require("which-key")

wk.add(
  -- Suggested Spec:
  {
    { "<leader>c", group = "Comment" },
    { "<leader>cl", desc = "Comment Line" },
    { "<leader>e", desc = "File Manager" },
    { "<leader>f", group = "Find" },
    { "<leader>fb", desc = "Find Buffer" },
    { "<leader>ff", desc = "Find File" },
    { "<leader>fh", desc = "Find Help" },
    { "<leader>fw", desc = "Find Text" },
    { "<leader>g", group = "Git" },
    { "<leader>gb", desc = "Branches" },
    { "<leader>gc", desc = "Commits" },
    { "<leader>gs", desc = "Status" },
    { "<leader>h", desc = "No highlight" },
    { "<leader>l", group = "LSP" },
    { "<leader>lD", desc = "Hover diagnostic" },
    { "<leader>la", desc = "Action" },
    { "<leader>ld", desc = "Diagnostic" },
    { "<leader>lf", desc = "Format" },
    { "<leader>lr", desc = "Rename" },
    { "<leader>ls", desc = "Symbol" },
    { "<leader>lm", "<cmd>Outline<cr>", desc = "Members" },
    { "<leader>o", desc = "Git status" },
    { "<leader>t", group = "Terminal" },
    { "<leader>tf", desc = "Float terminal" },
    { "<leader>th", desc = "Horizontal terminal" },
    { "<leader>w", desc = "Save" },
    { "<leader>x", desc = "Close Buffer" },
  }
)
-- wk.register({
--
--     f = {
--         name = "Find",
--         f = {"Find File"},
--         b = {"Find Buffer"},
--         h = {"Find Help"},
--         w = {"Find Text"}
--     },
--     e = {"File Manager"},
--     o = {"Git status"},
--     x = {"Close Buffer"},
--     w = {"Save"},
--     t = {name = "Terminal", f = {"Float terminal"}, h = {"Horizontal terminal"}},
--     h = {"No highlight"},
--     g = {name = "Git", b = "Branches", c = "Commits", s = "Status"},
--     c = {name = "Comment", l = "Comment Line"},
--     l = {
--         name = "LSP",
--         d = "Diagnostic",
--         D = "Hover diagnostic",
--         f = "Format",
--         r = "Rename",
--         a = "Action",
--         s = "Symbol"
--     }
-- }, {prefix = "<leader>"})
