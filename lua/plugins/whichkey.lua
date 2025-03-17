local wk = require("which-key")

wk.add(
  -- Befehle 
  {
    { "<leader><leader>", desc = "Recent Files" },
    { "<leader>/", desc = "Comment" },
    { "<leader>e", desc = "Files left" },
    { "<leader>E", desc = "File float" },
    { "<leader>f", group = "Find" },
    { "<leader>fb", desc = "Find Buffer" },
    { "<leader>ff", desc = "Find File" },
    { "<leader>fh", desc = "Find Help" },
    { "<leader>fw", desc = "Find Text" },
    { "<leader>g", group = "Git" },
    { "<leader>gb", desc = "Branches" },
    { "<leader>gc", desc = "Commits" },
    { "<leader>gd", desc = "Diffs" },
    { "<leader>gs", desc = "Status" },
    { "<leader>h", desc = "No Highlight" },
    { "<leader>o", desc = "Git Status" },
    { "<leader>t", group = "Terminal" },
    { "<leader>tf", desc = "Float Terminal" },
    { "<leader>th", desc = "Horizontal Terminal" },
    { "<leader>tv", desc = "Vertical Terminal" },
    { "<leader>w", desc = "Save" },
    { "<leader>x", desc = "Close Buffer" },
    { "<leader>s", desc = "Sort Buffer" },
  }
)

if vim.g.is_lsp_enabled then
wk.add(
  -- Optionale Befehle
  {
    { "<leader>l", group = "LSP" },
    { "<leader>lD", desc = "Hover diagnostic" },
    { "<leader>la", desc = "Action" },
    { "<leader>ld", desc = "Diagnostic" },
    { "<leader>lf", desc = "Format" },
    { "<leader>lr", desc = "Rename" },
    { "<leader>ls", desc = "Symbol" },
    { "<leader>lm", "<cmd>Outline<cr>", desc = "Members" },
  }
)
end
