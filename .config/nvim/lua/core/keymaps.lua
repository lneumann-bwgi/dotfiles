-- Built-in LSP mappings (0.11+):
--     grn  rename           grr  references           gri  implementation
--     gra  code_action      gO   document_symbol      CTRL-S  signature_help
--     grt  type_definition  grx  codelens_run (0.12)
--     [d / ]d  diagnostics  [D / ]D  first/last diagnostic
--
-- Built-in navigation (0.11+, vim-unimpaired style):
--     [q ]q [Q ]Q  quickfix    [l ]l [L ]L  loclist
--     [t ]t [T ]T  tags        [a ]a [A ]A  arglist
--     [b ]b [B ]B  buffers     [<Space> ]<Space>  add blank line
--
-- Treesitter selection (0.12+):
--     v_an  expand node selection    v_in  shrink node selection

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

-- use esc to also clear the highlight
nmap("<esc>", ":nohlsearch<cr><esc>")

-- write shell cmd to file
map({ "n", "v" }, "<leader>S", ":.!bash<CR>")

-- dictionary lookups via dict.org DICT protocol
local function dict_lookup(source)
  local word = vim.fn.expand("<cword>")
  if word == "" then
    return
  end
  local cmd = string.format(
    "curl -s --max-time 3 'dict://dict.org/d:%s:%s' 2>/dev/null | tr -d '\\r' | sed -E '/^[0-9][0-9][0-9] /d;/^\\.$/d'",
    word,
    source
  )
  local out = vim.fn.systemlist({ "sh", "-c", cmd })
  if #out == 0 or (#out == 1 and out[1] == "") then
    vim.notify("no definition found for '" .. word .. "' in " .. source, vim.log.levels.INFO)
    return
  end
  vim.cmd("botright 15new")
  vim.bo.buftype = "nofile"
  vim.bo.bufhidden = "wipe"
  vim.bo.swapfile = false
  vim.api.nvim_buf_set_lines(0, 0, -1, false, out)
  vim.bo.modifiable = false
  vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = 0, silent = true })
end

nmap("<leader>we", function()
  dict_lookup("wn")
end)
nmap("<leader>wt", function()
  dict_lookup("moby-thesaurus")
end)
nmap("<leader>wp", function()
  dict_lookup("fd-por-eng")
end)
nmap("<leader>wd", function()
  dict_lookup("fd-deu-eng")
end)

-- MAJOR MAPPINGS

-- common sense
map({ "n", "v" }, "H", "^")
map({ "n", "v" }, "L", "g_")

-- u: undo, U: redo
map("n", "U", "<c-r>")

-- movement in splits
nmap("<c-k>", "<c-w><up>")
nmap("<c-j>", "<c-w><down>")
nmap("<c-h>", "<c-w><left>")
nmap("<c-l>", "<c-w><right>")

-- re-size windows
nmap("<Up>", "<c-w>+")
nmap("<Down>", "<c-w>-")
nmap("<right>", "<c-w><")
nmap("<left>", "<c-w>>")

-- better navigation
nmap("]t", ":w|:tabnext<cr>")
nmap("[t", ":w|:tabprev<cr>")

nmap("]b", ":w|:bnext<cr>")
nmap("[b", ":w|:bprev<cr>")

nmap("]c", "g,")
nmap("[c", "g;")

nmap("]j", "<c-i>")
nmap("[j", "<c-o>")

-- deplete to void register multiple times
vmap("<leader>d", '"_d')

-- pasting multiple times
nmap("gp", '"0p')
nmap("gP", '"0P')
vmap("gp", '"0p')
vmap("gP", '"0P')

-- MINOR MAPPINGS

-- visual selection in fold
nmap("viz", "v[zo]z$")
nmap("vaz", "v[zo]z$")

-- move visual selection up/down
vmap("J", ":m '>+1<CR>gv=gv")
vmap("K", ":m '<-2<CR>gv=gv")

-- bash like in ex mode
cmap("<C-a>", "<home>")
cmap("<C-e>", "<end>")

-- don't move cursor when using J
nmap("J", "mzJ`z")

-- undo breaks on punctuation
imap(",", ",<C-g>u")
imap(".", ".<C-g>u")

-- save (similar to ZZ, ZQ)
nmap("ZS", ":w<CR>")

-- keep selection after indenting
vmap("<", "<gv")
vmap(">", ">gv")

-- better parenthesis navigation
nmap("<Tab>", "%")
vmap("<Tab>", "%")

-- swap semicolon and colon (don't use silent)
vim.keymap.set({ "n", "v", "c" }, ";", ":", { noremap = true, silent = false })

-- useless keys
map({ "n", "v" }, "M", "<NOP>")
map({ "n", "v" }, "Q", "<NOP>")
map({ "n", "v" }, "gQ", "<NOP>")
map({ "n", "v" }, ",", "<NOP>")

-- ABBREVIATIONS
vim.cmd("abbr attribtue attribute")
vim.cmd("abbr attribuet attribute")
vim.cmd("abbr conifg config")
vim.cmd("abbr cosnt const")
vim.cmd("abbr fitler filter")
vim.cmd("abbr flase false")
vim.cmd("abbr fodl fold")
vim.cmd("abbr foriegn foreign")
vim.cmd("abbr fucntion function")
vim.cmd("abbr funciton function")
vim.cmd("abbr heigth height")
vim.cmd("abbr lenght length")
vim.cmd("abbr mpa map")
vim.cmd("abbr ragne range")
vim.cmd("abbr recieve receive")
vim.cmd("abbr retrun return")
vim.cmd("abbr rigth right")
vim.cmd("abbr rnage range")
vim.cmd("abbr sefl self")
vim.cmd("abbr teh the")
vim.cmd("abbr tempalte template")
vim.cmd("abbr ture true")
vim.cmd("abbr widht width")
vim.cmd("abbr witdh width")
