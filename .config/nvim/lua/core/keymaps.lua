local vim = vim

local function map(mode, shortcut, command)
    vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = false })
end

local function nmap(shortcut, command)
    map('n', shortcut, command)
end

local function vmap(shortcut, command)
    map('v', shortcut, command)
end

local function imap(shortcut, command)
    map('i', shortcut, command)
end

local function cmap(shortcut, command)
    map('c', shortcut, command)
end

-- LEADER MAPPINGS

vim.g.mapleader = ' '

nmap('<leader>/', ':nohlsearch<cr>')
nmap('<leader>G', ':lua SetGoyo()<cr>')

nmap('<leader>se', ':lua ToggleEN()<cr>')
nmap('<leader>sp', ':lua TogglePT()<cr>')

-- dictionaries
vim.cmd [[
nnoremap <space>we :execute '!dict -d wn ' . shellescape(expand('<cword>')) . ' \| head -n 25'<Cr>
nnoremap <space>wt :execute '!dict -d moby-thesaurus ' . shellescape(expand('<cword>')) . ' \| head -n 25'<Cr>
nnoremap <space>wp :execute '!dict -d fd-por-eng ' . shellescape(expand('<cword>'))<Cr>
nnoremap <space>wd :execute '!dict -d fd-deu-eng ' . shellescape(expand('<cword>'))<Cr>
]]

-- MAJOR MAPPINGS

-- common sense
nmap('H', '^')
nmap('L', 'g_')
vmap('H', '^')
vmap('L', 'g_')

nmap('Y', 'y$')
nmap('U', '<c-r>')

-- test
nmap('<tab>', '%')
vmap('<tab>', '%')

-- movement in slits
nmap('<leader>k', '<c-w><up>')
nmap('<leader>j', '<c-w><down>')
nmap('<leader>h', '<c-w><left>')
nmap('<leader>l', '<c-w><right>')

-- re size windows
nmap('<Up>', '<c-w>+')
nmap('<Down>', '<c-w>-')
nmap('<right>', '<c-w><')
nmap('<left>', '<c-w>>')
--
-- better navigation
nmap(']t', ':w|:tabnext<cr>')
nmap('[t', ':w|:tabprevious<cr>')

nmap(']b', ':w|bnext<cr>')
nmap('[b', ':w|bprevius<cr>')

nmap(']c', 'g;')
nmap('[c', 'g,')

nmap(']j', '<c-i>')
nmap('[j', '<c-o>')

-- pasting multiple times
vmap('gp', '\"0p')
vmap('gP', '\"0P')

-- write shell cmd to file
nmap('S', '!!bash<CR>')
vmap('S', '!!bash<CR>')

-- MINOR MAPPINGS

-- Past from + register in insert mode
imap('<c-r>', '<c-r>+')

-- visual selection in fold
nmap('viz', 'v[zo]z$')

-- move visual selection up/down
vmap('J', ':m \'>+1<CR>gv=gv')
vmap('K', ':m \'<-2<CR>gv=gv')

-- bash like in ex mode
cmap('<C-a>', '<home>')
cmap('<C-e>', '<end>')

-- undo breaks on punctuation
imap(',', ',<C-g>u')
imap('.', '.<C-g>u')

-- save (similar to ZZ, ZQ)
nmap('ZS', ':w<CR>')

-- keep selection after indenting
vmap('>', '>gv')
vmap('>', '>gv')

-- on jumps, keep cursor centered
nmap('[[', '[[zz')
nmap(']]', ']]zz')
nmap('}', '}zz')
nmap('{', '{zz')
-- nmap('<c-u>','<c-u>zz')
-- nmap('<c-d>','<c-d>zz')
-- nmap('<c-f>','<c-f>zz')
-- nmap('<c-b>','<c-b>zz')

-- SWAPS

-- swap colon and semicolon
nmap(':', ';')
nmap(';', ':')
vmap(':', ';')
vmap(';', ':')
imap(':', ';')
imap(';', ':')
cmap(':', ';')
cmap(';', ':')

-- swap v and ctrl-v
nmap('v', '<c-v>')
nmap('<c-v>', 'v')
vmap('v', '<c-v>')
vmap('<c-v>', 'v')

-- useless keys
nmap('s', '<NOP>')
nmap('M', '<NOP>')
nmap('Q', '<NOP>')
nmap('gQ', '<NOP>')
nmap(',', '<NOP>')

-- ABBREVIATIONS
vim.cmd('abbr attribtue attribute')
vim.cmd('abbr attribuet attribute')
vim.cmd('abbr cosnt const')
vim.cmd('abbr fitler filter')
vim.cmd('abbr fodl fold')
vim.cmd('abbr funciton function')
vim.cmd('abbr lenght length')
vim.cmd('abbr rigth right')
vim.cmd('abbr mpa map')
vim.cmd('abbr ragne range')
vim.cmd('abbr rnage range')
vim.cmd('abbr teh the')
vim.cmd('abbr tempalte template')

-- FUNCTIONS

-- highlight match in red
vim.cmd [[
function! HLNext (blinktime)
    highlight WhiteOnRed ctermfg=white ctermbg=red
    let [bufnum, lnum, col, off] = getpos('.')
    let matchlen = strlen(matchstr(strpart(getline('.'),col-1),@/))
    let target_pat = '\c\%#\%('.@/.'\)'
    let ring = matchadd('WhiteOnRed', target_pat, 101)
    redraw
    exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
    call matchdelete(ring)
    redraw
endfunction
nnoremap <silent> n   n:call HLNext(0.6)<CR>zz
nnoremap <silent> N   N:call HLNext(0.6)<CR>zz
]]

function ToggleEN()
    if vim.opt.spell.value then
        vim.opt.spell = false
    else
        vim.opt.spell = true
        vim.opt.spell.spelllang = 'en_us'
    end
end

function TogglePT()
    if vim.opt.spell.value then
        vim.opt.spell = false
    else
        vim.opt.spell = true
        vim.opt.spell.spelllang = 'pt'
    end
end

function SetGoyo()
    vim.opt.signcolumn = "no"
    vim.opt.wrap = true
    vim.opt.linebreak = true
    vim.opt.list = false
    vim.cmd('Goyo')
    vim.cmd('Limelight 0.6')
end
