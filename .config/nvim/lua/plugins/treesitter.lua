require('nvim-treesitter.configs').setup {
  -- One of "all", "maintained" (parsers with maintainers), or a list of languages
  ensure_installed = {"bash", "c", "go", "haskell", "html", "javascript", "json", "julia", "lua", "python", "vim"},
  highlight = { enable = true },
  incremental_selection = { enable = false },
  indent = { enable = true },
  rainbow = { enable = true },
}


