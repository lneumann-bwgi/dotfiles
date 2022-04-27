local opt = vim.opt
HOME = os.getenv("HOME")

-- [[ context ]]
opt.list = true                  -- bool: change how vim shows whitespace characters
opt.listchars= {}                -- dict: strings to use in list mode
opt.number = true                -- bool: show line numbers
opt.relativenumber = true        -- bool: show relative line numbers
opt.scrolloff = 4                -- int:  min num lines of context
opt.signcolumn = "yes"           -- str:  show the sign column
opt.wrap = false                 -- bool: wrap lines

-- [[ filetypes ]]
opt.encoding = 'utf8'            -- str:  string encoding to use
opt.fileencoding = 'utf8'        -- str:  file encoding to use
opt.fileformat = 'unix'          -- str:  gives the <eol> of the current buffer

-- [[ search ]]
opt.ignorecase = true            -- bool: ignore case in search patterns
opt.smartcase = true             -- bool: override ignorecase if search contains capitals
opt.incsearch = false            -- bool: use incremental search
opt.hlsearch = true              -- bool: highlight search matches

-- [[ tabs ]]
opt.expandtab = true             -- bool: use spaces instead of tabs
opt.shiftround = true            -- bool: round indent to multiple of 'shiftwidth'
opt.shiftwidth = 4               -- num:  size of an indent
opt.smarttab = true              -- bool: <tab> in front of a line inserts blanks according to 'shiftwidth'
opt.softtabstop = 4              -- num:  number of spaces tabs count for in insert mode
opt.tabstop = 4                  -- num:  number of spaces tabs count

-- [[ splits ]]
opt.splitright = true            -- bool: place new window to right of current one.
opt.splitbelow = true            -- bool: place new window below the current one.

-- [[ folds ]] --
opt.foldmethod = 'expr'
opt.foldexpr = 'nvim_treesitter#foldexpr()'

-- [[ backups ]] --
opt.autoread = true              -- bool: when a file has been detected to have been changed, automatically read it again.
opt.swapfile = false             -- bool: do not create a swapfile for a new buffer.
opt.backup = false               -- bool: do not make a backup before overwriting a file.
opt.undofile = true              -- bool: automatically saves undo history to an undo file
opt.undodir = HOME .. '/.vim/undodir//'

-- [[ display ]] --
opt.background = 'dark'          -- str:  background color
opt.termguicolors = true         -- bool: if term supports ui color then enable
vim.cmd('colorscheme gruvbox')

-- [[ clipboard ]] --
opt.clipboard = 'unnamed,unnamedplus' -- str: set clipboard registers

-- [[ wildmenu ]] --
opt.path = opt.path + '.,**' -- str:  this is a list of directories which will be searched
opt.wildmenu = true              -- bool: enables tab completion window
opt.wildignore = '.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,.DS_Store,*.aux,*.out,*.toc'

-- [[ misc ]] --
opt.ttimeout = true              -- exit insert mode faster
opt.ttimeoutlen = 100            -- timeout for keystrokes
opt.formatoptions = 'croql'      -- nice format
opt.spell = false                -- set spell language
opt.showmatch = true             -- when a bracket is inserted, briefly jump to the matching one.
opt.backspace='indent,eol,start' -- makes backspace work
opt.cmdheight=1                  -- number of screen lines to use for the command-line
opt.cursorline = true            -- highlight the screen line of the cursor
opt.hidden = true                -- buffer is not unloaded when it is abandoned
opt.laststatus= 2                -- always show status line
opt.showmode = true              -- insert, replace or visual mode do not put a message on the last line.
opt.ruler = true                 -- show the line and column number of the cursor position,
opt.scrolloff= 8                 -- minimal number of screen lines to keep above and below the cursor.
opt.showcmd= true                -- show partial command in the last line of the screen.
opt.title= true                  -- the title of the window will be set to the value of 'titlestring'
opt.virtualedit= 'block'         -- cursor can be positioned where there is no actual character

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
