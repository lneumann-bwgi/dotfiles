local function map(mode, shortcut, command)
	vim.keymap.set(mode, shortcut, command, { noremap = true, silent = true })
end

local function nmap(shortcut, command)
	map("n", shortcut, command)
end

local function vmap(shortcut, command)
	map("v", shortcut, command)
end

local function imap(shortcut, command)
	map("i", shortcut, command)
end

local function cmap(shortcut, command)
	map("c", shortcut, command)
end

-- LEADER MAPPINGS

vim.g.mapleader = " "

-- test
-- nmap("<leader>/", ":nohlsearch<cr>")
nmap("<esc>", ":nohlsearch<cr><esc>")

-- write shell cmd to file
map({ "n", "v" }, "<leader>S", ":.!bash<CR>")

-- dictionaries
-- vim.cmd [[
-- nnoremap <space>we :execute '!dict -d wn ' . shellescape(expand('<cword>')) . ' \| head -n 25'<Cr>
-- nnoremap <space>wt :execute '!dict -d moby-thesaurus ' . shellescape(expand('<cword>')) . ' \| head -n 25'<Cr>
-- nnoremap <space>wp :execute '!dict -d fd-por-eng ' . shellescape(expand('<cword>'))<Cr>
-- nnoremap <space>wd :execute '!dict -d fd-deu-eng ' . shellescape(expand('<cword>'))<Cr>
-- ]]

-- MAJOR MAPPINGS

-- common sense
map({ "n", "v" }, "H", "^")
map({ "n", "v" }, "L", "g_")
map({ "n", "v" }, "H", "^")
map({ "n", "v" }, "L", "g_")

map("n", "U", "<c-r>")

-- movement in splits
nmap("<c-k>", "<c-w><up>")
nmap("<c-j>", "<c-w><down>")
nmap("<c-h>", "<c-w><left>")
nmap("<c-l>", "<c-w><right>")

-- resize windows
nmap("<Up>", "<c-w>+")
nmap("<Down>", "<c-w>-")
nmap("<right>", "<c-w><")
nmap("<left>", "<c-w>>")

-- better navigation
nmap("]t", ":w|:tabnext<cr>")
nmap("[t", ":w|:tabprevious<cr>")

nmap("]b", ":BufferLineCycleNext<cr>")
nmap("[b", ":BufferLineCyclePrev<cr>")

nmap("]e", "g;")
nmap("[e", "g,")

nmap("]j", "<c-i>")
nmap("[j", "<c-o>")

-- pasting multiple times
nmap("gp", '"0p')
nmap("gP", '"0P')
vmap("gp", '"0p')
vmap("gP", '"0P')

-- close buffer
nmap("<leader>x", ":bd<CR>")

-- MINOR MAPPINGS

-- Past from + register in insert mode
imap("<c-r>", "<c-r>+")

-- visual selection in fold
nmap("viz", "v[zo]z$")

-- move visual selection up/down
vmap("J", ":m '>+1<CR>gv=gv")
vmap("K", ":m '<-2<CR>gv=gv")

-- bash like in ex mode
cmap("<C-a>", "<home>")
cmap("<C-e>", "<end>")

-- undo breaks on punctuation
imap(",", ",<C-g>u")
imap(".", ".<C-g>u")

imap("<C-h>", "<Left>")
imap("<C-j>", "<Down>")
imap("<C-k>", "<Up>")
imap("<C-l>", "<Right>")

-- save (similar to ZZ, ZQ)
nmap("ZS", ":w<CR>")

-- keep selection after indenting
vmap("<", "<gv")
vmap(">", ">gv")

-- SWAPS

-- swap colon and semicolon (dont use silent)
vim.keymap.set({ "n", "v", "c" }, ":", ";", { noremap = true, silent = false })
vim.keymap.set({ "n", "v", "c" }, ";", ":", { noremap = true, silent = false })

-- swap v and ctrl-v
-- map({ "n", "v", "c"}, "v", "<c-v>")
-- map({ "n", "v", "c"}, "<c-v>", "v")

-- useless keys
map({ "n", "v" }, "M", "<NOP>")
map({ "n", "v" }, "K", "<NOP>")
map({ "n", "v" }, "Q", "<NOP>")
map({ "n", "v" }, "gQ", "<NOP>")
map({ "n", "v" }, ",", "<NOP>")

-- ABBREVIATIONS
vim.cmd("abbr attribtue attribute")
vim.cmd("abbr attribuet attribute")
vim.cmd("abbr cosnt const")
vim.cmd("abbr fitler filter")
vim.cmd("abbr fodl fold")
vim.cmd("abbr funciton function")
vim.cmd("abbr heigth height")
vim.cmd("abbr lenght length")
vim.cmd("abbr mpa map")
vim.cmd("abbr ragne range")
vim.cmd("abbr rigth right")
vim.cmd("abbr rnage range")
vim.cmd("abbr teh the")
vim.cmd("abbr tempalte template")
vim.cmd("abbr witdh width")
