require('nvim-treesitter.configs').setup {
  -- One of "all", "maintained" (parsers with maintainers), or a list of languages
  ensure_installed = 
        {"bash", "c", "go", "haskell", "html", "javascript", "json", "julia", "lua", "python", "vim"},
  highlight = { enable = true , additional_vim_regex_highlightimg = false},
  incremental_selection = { enable = false },
  indent = { enable = true },
  -- See: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
  textobjects = {
      select = {
          enable = true,
          -- Automatically jump forward to textobj, similar to targets.vim
          lookahead = true,
          keymaps = {
              -- You can use the capture groups defined in textobjects.scm
              ['af'] = '@function.outer',
              ['if'] = '@function.inner',
              ['ac'] = '@class.outer',
              ['ic'] = '@class.inner',
          },
      },
      move = {
          enable = true,
          set_jumps = true, -- whether to set jumps in the jumplist
          goto_next_start = {
              ["]m"] = "@function.outer",
              ["]]"] = "@class.outer",
          },
          goto_next_end = {
              ["]M"] = "@function.outer",
              ["]["] = "@class.outer",
          },
          goto_previous_start = {
              ["[m"] = "@function.outer",
              ["[["] = "@class.outer",
          },
          goto_previous_end = {
              ["[M"] = "@function.outer",
              ["[]"] = "@class.outer",
          },
          }
    },
  autotag = {
      enable = true,
      filetypes = {
          'html',
          'javascript',
          'javascriptreact',
          'typescriptreact',
      }
  },
  rainbow = { enable = true },
}
