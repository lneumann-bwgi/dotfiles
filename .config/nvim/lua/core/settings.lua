local vim = vim
HOME = os.getenv("HOME")

-- [[ context ]]
vim.opt.list = true                  -- bool: change how vim shows whitespace characters
vim.opt.listchars= {}                -- dict: strings to use in list mode
vim.opt.number = true                -- bool: show line numbers
vim.opt.relativenumber = true        -- bool: show relative line numbers
vim.opt.scrolloff = 4                -- int:  min num lines of context
vim.opt.signcolumn = "yes"           -- str:  show the sign column
vim.opt.wrap = false                 -- bool: wrap lines

-- [[ filetypes ]]
vim.opt.encoding = 'utf8'            -- str:  string encoding to use
vim.opt.fileencoding = 'utf8'        -- str:  file encoding to use
vim.opt.fileformat = 'unix'          -- str:  gives the <eol> of the current buffer

-- [[ search ]]
vim.opt.ignorecase = true            -- bool: ignore case in search patterns
vim.opt.smartcase = true             -- bool: override ignorecase if search contains capitals
vim.opt.incsearch = false            -- bool: use incremental search
vim.opt.hlsearch = true              -- bool: highlight search matches

-- [[ tabs ]]
vim.opt.expandtab = true             -- bool: use spaces instead of tabs
vim.opt.shiftround = true            -- bool: round indent to multiple of 'shiftwidth'
vim.opt.shiftwidth = 4               -- num:  size of an indent
vim.opt.smarttab = true              -- bool: <tab> in front of a line inserts blanks according to 'shiftwidth'
vim.opt.softtabstop = 4              -- num:  number of spaces tabs count for in insert mode
vim.opt.tabstop = 4                  -- num:  number of spaces tabs count

-- [[ splits ]]
vim.opt.splitright = true            -- bool: place new window to right of current one.
vim.opt.splitbelow = true            -- bool: place new window below the current one.

-- [[ folds ]] --
vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'nvim_treesitter#foldexpr()'

-- [[ backups ]] --
vim.opt.autoread = true              -- bool: when a file has been detected to have been changed, automatically read it again.
vim.opt.swapfile = false             -- bool: do not create a swapfile for a new buffer.
vim.opt.backup = false               -- bool: do not make a backup before overwriting a file.
vim.opt.undofile = true              -- bool: automatically saves undo history to an undo file
vim.opt.undodir = HOME .. '/.vim/undodir//'

-- [[ display ]] --
vim.opt.background = 'dark'          -- str:  background color
vim.opt.termguicolors = true         -- bool: if term supports ui color then enable
vim.cmd('colorscheme gruvbox')

-- [[ clipboard ]] --
vim.opt.clipboard = 'unnamed,unnamedplus' -- str: set clipboard registers

-- [[ wildmenu ]] --
vim.opt.path = vim.opt.path + '.,**' -- str:  this is a list of directories which will be searched
vim.opt.wildmenu = true              -- bool: enables tab completion window
vim.opt.wildignore = '.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,.DS_Store,*.aux,*.out,*.toc'

-- [[ misc ]] --
vim.opt.ttimeout = true              -- exit insert mode faster
vim.opt.ttimeoutlen = 100            -- timeout for keystrokes
vim.opt.formatoptions = 'croql'      -- nice format
vim.opt.spell = false                -- set spell language
vim.opt.showmatch = true             -- when a bracket is inserted, briefly jump to the matching one.
vim.opt.backspace='indent,eol,start' -- makes backspace work
vim.opt.cmdheight=1                  -- number of screen lines to use for the command-line
vim.opt.cursorline = true            -- highlight the screen line of the cursor
vim.opt.hidden = true                -- buffer is not unloaded when it is abandoned
vim.opt.laststatus= 2                -- always show status line
vim.opt.showmode = true              -- insert, replace or visual mode do not put a message on the last line.
vim.opt.ruler = true                 -- show the line and column number of the cursor position,
vim.opt.scrolloff= 8                 -- minimal number of screen lines to keep above and below the cursor.
vim.opt.showcmd= true                -- show partial command in the last line of the screen.
vim.opt.title= true                  -- the title of the window will be set to the value of 'titlestring'
vim.opt.virtualedit= 'block'         -- cursor can be positioned where there is no actual character

-- Disables automatic commenting on newline
vim.cmd('autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o')

-- Highlight Column
vim.cmd[[
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)
]]

-- highlight yanked text
vim.cmd[[
augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Visual", timeout=250})
augroup END
]]

-- performanse disable builtins plugins
local disabled_built_ins = {
    "netrw",
    "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers",
    "gzip",
    "zip",
    "zipPlugin",
    "tar",
    "tarPlugin",
    "getscript",
    "getscriptPlugin",
    "vimball",
    "vimballPlugin",
    "2html_plugin",
    "logipat",
    "rrhelper",
    "spellfile_plugin",
    "matchit"
}
for _, plugin in pairs(disabled_built_ins) do
    vim.g["loaded_" .. plugin] = 1
end
