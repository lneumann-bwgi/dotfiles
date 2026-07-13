local M = {
  "saghen/blink.cmp",
  version = "*",
  event = "InsertEnter",
  ---@module "blink.cmp"
  ---@type blink.cmp.Config
  opts = {
    keymap = { preset = "default" },
    completion = {
      accept = { auto_brackets = { enabled = false } },
      documentation = { auto_show = true, auto_show_delay_ms = 200 },
      list = { selection = { preselect = false, auto_insert = false } },
      menu = { border = "rounded" },
      ghost_text = { enabled = false },
    },
    signature = { enabled = true, window = { border = "rounded" } },
    sources = {
      default = { "lsp", "path", "buffer" },
    },
    fuzzy = { implementation = "prefer_rust_with_warning" },
  },
  opts_extend = { "sources.default" },
}
return M
