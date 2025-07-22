local wk = require("which-key")

-- Allgemeine Funktionen 
wk.add(
  {
    { "<leader><leader>", desc = "Recent Files", icon = {icon="󰚰", color="cyan"}},
    { "<leader>/", desc = "Comment", icon = {icon="", color="orange"}},
    { "<leader>/", desc = "Comment", icon = {icon="", color="orange"}, mode = "v"},
    { "<leader>m", desc = "Make", icon = {icon="", color="purple"}},
    { "<leader>e", desc = "Files Left <c-e>", icon = {icon="", color="cyan"}},
    { "<leader>E", desc = "Files Float",  icon = {icon="", color="cyan"}},
    { "<leader>f", group = "Find", icon = {icon="", color="cyan"}},
    { "<leader>fb", desc = "Find Buffer <c-b>", icon = {icon="", color="cyan"} },
    { "<leader>ff", desc = "Find File <c-f>", icon = {icon="", color="cyan"} },
    { "<leader>fw", desc = "Find Word <c-w>", icon = {icon="", color="cyan"} },
    { "<leader>fg", desc = "Live Grep <c-g>", icon = {icon="", color="cyan"} },
    { "<leader>fh", desc = "Find Help", icon = {icon="", color="cyan"} },
    { "<leader>h", desc = "Highlight", icon = {icon="󰙒", color="yellow"} },
    { "<leader>h", desc = "Highlight", icon = {icon="󰙒", color="yellow"}, mode = "v" },
    { "<leader>H", desc = "No Highlights", icon = {icon="󰷙", color="white"} },
    { "<leader>t", group = "Terminal", icon = {icon="", color="grau"}},
    { "<leader>tf", desc = "Float Terminal", icon = {icon="", color="white"}},
    { "<leader>th", desc = "Horizontal Terminal", icon = {icon="", color="white"}},
    { "<leader>tv", desc = "Vertical Terminal", icon = {icon="", color="white"}},
    { "<leader>w", desc = "Save Buffer", icon = {icon ="󰆓", color = "azure"}},
    { "<leader>x", desc = "Close Buffer", icon ={icon = "", color = "red"}},
    { "<leader>s", desc = "Sort Buffers", icon ={icon = "", color = "blue"}},
    { "<leader>n", desc = "Linenumber", icon ={icon = "", color = "blue"}},
    { "<leader>T", desc = "Transparency", icon ={icon = "", color = "blue"}},
    { "<leader>p", group = "Plugins", icon ={icon = "", color = "blue"}},
    { "<leader>pl", desc = "Lazy", icon ={icon = "", color = "blue"}},
    { "<leader>pm", desc = "Mason", icon ={icon = "", color = "blue"}},
  }
)

-- GIT Funktionen anzeigen nur wenn im Git Repo
if vim.g.is_git_enabled then
wk.add(
  {
    { "<leader>g", group = "Git", icon = {icon="", color="red"}},
    { "<leader>gb", desc = "Branches", icon = {icon="", color="red"}},
    { "<leader>gc", desc = "Commits", icon = {icon="", color="red"}},
    { "<leader>gd", desc = "Diffs", icon = {icon="", color="red"}},
    { "<leader>gs", desc = "Status", icon = {icon="", color="red"}},
  }
)
end

-- LSP Funktionen, die ohne LSP Server gehen
wk.add(
  {
	{ "<leader>l", group = "LSP", icon ={icon = "", color = "yellow"}},
	{ "<leader>lp", desc = "Build Projekt Flags",icon ={icon ="󰙵", color = "yellow"} },
	{ "<leader>ls", "<cmd>Outline<cr>", desc = "Symbols <c-s>", icon ={icon ="", color = "cyan"} }
  }
)


-- LSP Funktionen, die LSP Server veraussetzen
if vim.g.is_lsp_enabled then
wk.add(
  -- LSP Befehle
  {
    { "<leader>ld", desc = "Definition <c-p>", icon ={icon ="󰫍", color = "blue"}},
    { "<leader>lD", desc = "Declaration", icon ={icon ="󰫍", color = "blue"}},
    { "<leader>lx", desc = "Diagnostic List <c-x>", icon ={icon ="󰨮", color = "purple"}},
    { "<leader>lX", desc = "Diagnostic Float",icon ={icon ="󰨮", color = "purple"} },
    { "<leader>la", desc = "Code Action",icon ={icon ="󰨮", color = "purple"} },
    { "<leader>lF", desc = "Format",icon ={icon ="", color = "green"} },
    { "<leader>lr", desc = "References",icon ={icon ="", color = "yellow"} },
    { "<leader>lR", desc = "Rename",icon ={icon ="󰑕", color = "red"} },
    { "<leader>lk", desc = "Typ Info <s-k>",icon ={icon ="", color = "green"} },
    { "<leader>lt", desc = "Type Definition",icon ={icon ="󱄑", color = "green"} }
  }
)
end
