local opt = vim.opt
HOME = os.getenv("HOME")

-- [[ context ]] --
opt.number = true
opt.relativenumber = true
opt.scrolloff = 4
opt.signcolumn = "yes"
opt.wrap = false

-- [[ filetypes ]] --
opt.encoding = "utf8"
opt.fileencoding = "utf8"
opt.fileformat = "unix"

-- [[ search ]] --
opt.ignorecase = true -- bool: ignore case in search patterns
opt.smartcase = true -- bool: override ignorecase if search contains capitals
opt.incsearch = false -- bool: use incremental search
opt.hlsearch = true -- bool: highlight search matches

-- [[ tabs ]] --
opt.expandtab = true -- bool: use spaces instead of tabs
opt.shiftround = true -- bool: round indent to multiple of 'shiftwidth'
opt.shiftwidth = 4 -- num:  size of an indent
opt.smarttab = true -- bool: <tab> in front of a line inserts blanks according to 'shiftwidth'
opt.softtabstop = 4 -- num:  number of spaces tabs count for in insert mode
opt.tabstop = 4 -- num:  number of spaces tabs count

-- [[ splits ]] --
opt.splitright = true -- bool: place new window to right of current one.
opt.splitbelow = true -- bool: place new window below the current one.

-- [[ folds ]] --
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"

-- [[ backups ]] --
opt.autoread = true
opt.swapfile = false
opt.backup = false
opt.undofile = true
opt.undodir = HOME .. "/.vim/undodir//"

-- [[ display ]] --
opt.background = "dark" -- str:  background color
opt.termguicolors = true -- bool: if term supports ui color then enable
vim.cmd("colorscheme gruvbox")

-- [[ clipboard ]] --
opt.clipboard = "unnamed,unnamedplus" -- str: set clipboard registers

-- [[ wildmenu ]] --
opt.path = opt.path + ".,**" -- str:  this is a list of directories which will be searched
opt.wildmenu = true -- bool: enables tab completion window
opt.wildignore =
	".git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,.DS_Store,*.aux,*.out,*.toc"

-- [[ misc ]] --
opt.cursorline = true
opt.updatetime = 500
opt.hidden = true
opt.scrolloff = 8
opt.spell = false
opt.title = true
opt.ttimeoutlen = 100
opt.virtualedit = "block"

-- [[ AutoCMDs ]] --

-- highlight column
vim.cmd([[
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)
]])

-- highlight yanked text
vim.cmd([[
augroup LuaHighlight
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Visual", timeout=250})
augroup END
]])

-- open folds
vim.cmd([[autocmd BufWinEnter * normal zR]])

-- [[ Performanse ]] --

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
	"matchit",
}
for _, plugin in pairs(disabled_built_ins) do
	vim.g["loaded_" .. plugin] = 1
end
