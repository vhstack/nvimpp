local wk = require("which-key")

wk.add(
  -- Befehle 
  {
    { "<leader><leader>", desc = "Recent Files", icon = {icon="󰚰", color="cyan"}},
    { "<leader>/", desc = "Comment", icon = {icon="", color="orange"}},
    { "<leader>/", desc = "Comment", icon = {icon="", color="orange"}, mode = "v"},
    { "<leader>e", desc = "Files Left", icon = {icon="", color="cyan"}},
    { "<leader>E", desc = "Files Float",  icon = {icon="", color="cyan"}},
    { "<leader>f", group = "Find", icon = {icon="", color="cyan"}},
    { "<leader>fb", desc = "Find Buffer", icon = {icon="", color="cyan"} },
    { "<leader>ff", desc = "Find File", icon = {icon="", color="cyan"} },
    { "<leader>fh", desc = "Find Help", icon = {icon="", color="cyan"} },
    { "<leader>fw", desc = "Find Text", icon = {icon="", color="cyan"} },
    { "<leader>g", group = "Git", icon = {icon="", color="red"}},
    { "<leader>gb", desc = "Branches", icon = {icon="", color="red"}},
    { "<leader>gc", desc = "Commits", icon = {icon="", color="red"}},
    { "<leader>gd", desc = "Diffs", icon = {icon="", color="red"}},
    { "<leader>gs", desc = "Status", icon = {icon="", color="red"}},
    { "<leader>h", desc = "Highlight", icon = {icon="󰙒", color="yellow"} },
    { "<leader>h", desc = "Highlight", icon = {icon="󰙒", color="yellow"}, mode = "v" },
    { "<leader>H", desc = "No Highlights", icon = {icon="󰷙", color="white"} },
    { "<leader>t", group = "Terminal", icon = {icon="", color="grau"}},
    { "<leader>tf", desc = "Float Terminal", icon = {icon="", color="white"}},
    { "<leader>th", desc = "Horizontal Terminal", icon = {icon="", color="white"}},
    { "<leader>tv", desc = "Vertical Terminal", icon = {icon="", color="white"}},
    { "<leader>w", desc = "Save Buffer", icon = {icon ="󰆓", color = "azure"}},
    { "<leader>x", desc = "Close Buffer", icon ={icon = "", color = "red"}},
    { "<leader>s", desc = "Sort Buffer", icon ={icon = "", color = "blue"}},
    { "<leader>n", desc = "Linenumber", icon ={icon = "", color = "blue"}},
    { "<leader>T", desc = "Transparency", icon ={icon = "", color = "blue"}},
    { "<leader>p", group = "Plugins", icon ={icon = "", color = "blue"}},
    { "<leader>pl", desc = "Lazy", icon ={icon = "", color = "blue"}},
    { "<leader>pm", desc = "Mason", icon ={icon = "", color = "blue"}},
  }
)

if vim.g.is_lsp_enabled then
wk.add(
  -- Optionale Befehle
  {
    { "<leader>l", group = "LSP", icon ={icon = "", color = "yellow"}},
    { "<leader>ld", desc = "Definition", icon ={icon ="󰫍", color = "blue"}},
    { "<leader>lD", desc = "Declaration", icon ={icon ="󰫍", color = "blue"}},
    { "<leader>lg", desc = "Diagnostic List", icon ={icon ="󰨮", color = "purple"}},
    { "<leader>lG", desc = "Diagnostic Float",icon ={icon ="󰨮", color = "purple"} },
    { "<leader>la", desc = "Code Action",icon ={icon ="󰨮", color = "purple"} },
    { "<leader>lf", desc = "Format",icon ={icon ="", color = "green"} },
    { "<leader>lr", desc = "References",icon ={icon ="", color = "yellow"} },
    { "<leader>lR", desc = "Rename",icon ={icon ="󰑕", color = "red"} },
    { "<leader>lK", desc = "Typ Info",icon ={icon ="", color = "green"} },
    { "<leader>lt", desc = "Type Definition",icon ={icon ="󱄑", color = "green"} },
    { "<leader>lp", desc = "Build Projekt Flags",icon ={icon ="󰙵", color = "yellow"} },
    { "<leader>lm", "<cmd>Outline<cr>", desc = "Members", icon ={icon ="", color = "cyan"} },
  }
)
end
