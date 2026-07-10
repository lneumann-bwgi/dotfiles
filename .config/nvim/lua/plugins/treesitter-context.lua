local M = {
  "nvim-treesitter/nvim-treesitter-context",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    max_lines = 3,
    trim_scope = "outer",
    mode = "cursor",
  },
  keys = {
    { "[x", function() require("treesitter-context").go_to_context(vim.v.count1) end, desc = "Jump to context" },
  },
}
return M
