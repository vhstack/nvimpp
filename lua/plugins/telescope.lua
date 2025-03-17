require("telescope").setup({
  defaults = {
    file_ignore_patterns = { "%.o", "%.git", "%.lock", "Debug/", "tags" }
  }
})
