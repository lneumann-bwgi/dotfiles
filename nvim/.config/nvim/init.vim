" HEADER {{{

"_______________________________________________________________________________
"|                               _                                             |
"|                        __   _(_)_ __ ___  _ __ ___                          |
"|                        \ \ / / | '_ ` _ \| '__/ __|                         |
"|                         \ V /| | | | | | | | | (__                          |
"|                        (_)_/ |_|_| |_| |_|_|  \___|                         |
"|                                                                             |
"|-----------------------------------------------------------------------------|
"|                                                                             |
"|                  > By: Lucas Neumann ( neumann-mlucas ) <                   |
"|                     > Last major revision: Jan, 2021 <                      |
"|                                                                             |
"|               > 'Leader' is associated with function calls <                |
"|                    > 'Ctrl' is used for autocompletion <                    |
"|                         > 'g' is a 'go to' alias <                          |
"|              > '[' is similar to 'g' and used for movements <               |
"|                                                                             |
"|                                                                             |
"|                                   DOTO:                                     |
"|                  > Substitute vim-autoformat for ALEFix                     |
"|                  > Integrate ALE and COC                                    |
"|                  > Markdown preview                                         |
"|                  > asyncrun commands                                        |
"|                  > nvim-gdb                                                 |
"|                  > nvim-ipy                                                 |
"|_____________________________________________________________________________|
"  }}}

" PLUGINS {{{

  " install vim-plug
  if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
          \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  endif
  " for neovim
  if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
          \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  endif

  call plug#begin('~/.vim/plugged')

  " Testing
  Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'} " semantic highlighting for Python

  Plug 'Chiel92/vim-autoformat'                       " format code with one button press
  Plug 'Yggdroot/indentLine'                          " displaying thin vertical lines at each indentation level for code
  Plug 'dense-analysis/ale'                           " a plugin providing linting in NeoVim
  Plug 'godlygeek/tabular', { 'on': 'Tabularize' }    " line up text.
  Plug 'itchyny/lightline.vim'                        " a light and configurable statusline
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " fzf basic wrapper function for Vim
  Plug 'junegunn/fzf.vim'                             " fzf basic wrapper function for Vim
  Plug 'luochen1990/rainbow'                          " shows different levels of parentheses in different colors
  Plug 'majutsushi/tagbar'                            " easy way to browse the tags of the current file
  Plug 'mhinz/vim-signify'                            " uses the sign column to indicate added, modified and removed lines
  Plug 'preservim/nerdtree'                           " file system explorer for the Vim
  Plug 'rhysd/clever-f.vim'                           " extends f, F, t and T mappings
  Plug 'sheerun/vim-polyglot'                         " a collection of language packs for Vim.
  Plug 'tpope/vim-commentary'                         " comment stuff out
  Plug 'tpope/vim-fugitive'                           " calls any arbitrary Git command
  Plug 'tpope/vim-surround'                           " is all about surroundings: parentheses, brackets, quotes

  " Plug 'terryma/vim-smooth-scroll'
  " Plug 'tmsvg/pear-tree'

  " Writing
  Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }           " distraction-free writing in Vim.
  Plug 'junegunn/limelight.vim', { 'on' : 'Limelight'} " Goyo plugin
  " Plug 'reedes/vim-wordy', { 'on': 'Wordy' }           " uncover usage problems in your writing
  " Plug 'rhysd/vim-grammarous'                          " a powerful grammar checker for Vim
  " Plug 'ron89/thesaurus_query.vim', { 'on': 'Goyo' }   " lookup synonyms of any word under cursor

  " Color schemes
  Plug 'ajmwagar/vim-deus'
  Plug 'cocopon/iceberg.vim'
  Plug 'joshdick/onedark.vim'
  Plug 'junegunn/seoul256.vim'
  Plug 'morhetz/gruvbox'
  Plug 'sainnhe/gruvbox-material'

  call plug#end()
"}}}

" COLOR  {{{

  set t_Co=256 " URxvt doesn't support termguicolors
  set background=dark

  colorscheme onedark
  let g:lightline = {'colorscheme' : 'onedark'}
"}}}

" SET DEFAULTS {{{

  " Common Sense
  filetype plugin indent on
  syntax on

  " Testing
  set inccommand=split "better substitution behavior
  set exrc             "source directory specific vimrc

  " Basic Stuff
  set backspace=indent,eol,start
  set encoding=utf-8
  set fileformat=unix
  set foldmethod=indent
  set list
  set listchars=eol:¬
  set noerrorbells
  set nowrap
  set number relativenumber

  " Other Stuff
  set cmdheight=2           " number of screen lines to use for the command-line
  set cursorline            " highlight the screen line of the cursor
  set hidden                " buffer is not unloaded when it is abandoned
  set laststatus=2          " alwyas show status line
  set noshowmode            " insert, replace or visual mode do not put a message on the last line.
  set pastetoggle=<F2>      " better past behavior when needed
  set ruler                 " show the line and column number of the cursor position,
  set scrolloff=8           " minimal number of screen lines to keep above and below the cursor.
  set showcmd               " show partial command in the last line of the screen.
  set signcolumn=yes        " always draw the signcolumn
  set splitright splitbelow " splitting a window will put the new window right / down
  set title                 " the title of the window will be set to the value of 'titlestring'
  set virtualedit=block     " cursor can be positioned where there is no actual character

  " Undo Options
  set undodir=~/.vim/undodir
  set undofile

  " Search Options
  set ignorecase
  set nohlsearch
  set noincsearch
  set showmatch
  set smartcase

  " Speling
  set nospell
  set complete+=kspell

  " Go to Normal Mode Quicker
  set ttimeout
  set ttimeoutlen=100

  " No Swap Files
  set autoread
  set noswapfile
  set nobackup

  " Provides Tab-completion for File-related Tasks
  set path+=**
  set wildmenu
  set wildignore=*.o,*.jpg,*.png,*.gif,*.gz,*.tar,*.zip

  " Change Default Vim Register
  set clipboard=unnamed
  if has('unnamedplus')
    set clipboard=unnamed,unnamedplus
  endif

  " Tab Stuff
  set formatoptions=croql
  set expandtab
  set shiftround
  set shiftwidth=4
  set smarttab
  set softtabstop=4
  set tabstop=4

"}}}

" KEY MAPS {{{

  let mapleader=' '

  " Testing

  " Common Sense
  nnoremap Y y$
  nnoremap H ^
  nnoremap L g_
  vnoremap H ^
  vnoremap L g_
  nnoremap U <C-r>

  " Leader maps
  nnoremap <Leader>/ :nohlsearch<CR>
  nnoremap <Leader>G :set wrap linebreak nolist ignorecase<CR>:Goyo<CR>
  nnoremap <Leader>s !!bash<CR>

  nnoremap <Leader>T :vsp term://zsh<CR>
  nnoremap <Leader>ta :TagbarToggle<CR>
  nnoremap <Leader>tt :NERDTreeToggle<CR>

  nnoremap <Leader>w :call ToggleWrap()<CR>
  nnoremap <Leader>n :call ToggleNumber()<CR>

  nnoremap <Leader>ss :call ToggleSpell_EN()<CR>
  nnoremap <Leader>sp :call ToggleSpell_PT()<CR>

  " Splits navigation
  nnoremap <Leader>k <C-w><Up>
  nnoremap <Leader>j <C-w><Down>
  nnoremap <Leader>h <C-w><Left>
  nnoremap <Leader>l <C-w><Right>

  " Git
  nnoremap <Leader>gs :Gstatus<CR>
  nnoremap <Leader>gd :Gvdiffsplit<CR>
  nnoremap <Leader>gc :Gcommit % -m "vim commit"<CR>

  " Visual selection in fold
  nnoremap viz v[zo]z$

  " Visual selection in last modified object
  nnoremap gV gv
  nnoremap gv `[v`]

  " Goes to last jump (and gi to last edit)
  nnoremap gj ''

  " Better jumping
  nnoremap ]' g;
  nnoremap [' g,

  nnoremap ]e :cnext<CR>
  nnoremap [e :cprev<CR>

  nnoremap gn *
  nnoremap gN #

  nnoremap ]n *
  nnoremap [n #

  " Navigation in buffers
  nnoremap ]b :w\|bn<CR>
  nnoremap [b :w\|bp<CR>

  " Navigation in tabs
  nnoremap ]t :w\|:tabNext<CR>
  nnoremap [T :w\|:tabPrevius<CR>

  " Save (similar to ZZ, ZQ)
  nnoremap ZS :w<CR>

  " Completion
  imap <C-f> <plug>(fzf-complete-path)
  imap <C-w> <plug>(fzf-complete-word)
  imap <C-l> <plug>(fzf-complete-line)

  " Past from + register in insert mode
  inoremap <C-r> <C-r>+

  " Keep selection after indenting
  xnoremap <silent> < <gv
  xnoremap <silent> > >gv

  " Move visual selection up/down
  vnoremap J :m '>+1<CR>gv=gv
  vnoremap K :m '<-2<CR>gv=gv

  " Bash like in ex mode
  cnoremap <C-a> <home>
  cnoremap <C-e> <end>

  " Resize windows
  nnoremap <A-k> <C-w>+
  nnoremap <A-j> <C-w>-
  nnoremap <A-h> <C-w><
  nnoremap <A-l> <C-w>>

  " Terminal mode
  tnoremap <Esc> <C-\><C-n>
  tnoremap <expr> <A-r> '<C-\><C-N>"'.nr2char(getchar()).'pi'

  " Swap colon and semicolon
  cnoremap : ;
  cnoremap ; :
  nnoremap : ;
  nnoremap ; :
  vnoremap : ;
  vnoremap ; :

  " Swap ' ` (better navigation in jump list)
  nnoremap '  `
  nnoremap `  '

  " Swap v and CTRL-V
  nnoremap    v   <C-V>
  nnoremap <C-V>     v
  vnoremap    v   <C-V>
  vnoremap <C-V>     v

  " Useless keys
  nnoremap s  <NOP>
  nnoremap S  <NOP>
  nnoremap K  <NOP>
  nnoremap M  <NOP>
  nnoremap Q  <NOP>
  nnoremap gQ <NOP>
  nnoremap ,  <NOP>

  nnoremap <Up>    <NOP>
  nnoremap <Down>  <NOP>
  nnoremap <Left>  <NOP>
  nnoremap <Right> <NOP>

  " Abbreviations
  abbr attribtue attribute
  abbr attribuet attribute
  abbr cosnt const
  abbr fitler filter
  abbr fodl fold
  abbr funciton function
  abbr lenght length
  abbr mpa map
  abbr ragne range
  abbr rnage range
  abbr teh the
  abbr tempalte template
"}}}

" MISC {{{

  " Retain indent Level on Folds
  let indent_level = indent(v:foldstart)
  let indent = repeat(' ',indent_level)
  set foldtext=NeatFoldText()

  " Highlight Column
  highlight ColorColumn ctermbg=magenta
  call matchadd('ColorColumn', '\%81v', 100)

  " Disables automatic commenting on newline
  autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

  "Automatically deletes all trailing whitespace on save
  " autocmd BufWritePre * %s/\s\+$//e

  " Shows cursor only on focus window
  autocmd InsertLeave,WinEnter * set cursorline
  autocmd InsertEnter,WinLeave * set nocursorline

  " Highlight yanked text (needs nvim v0.5)
  augroup LuaHighlight
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
  augroup END

  " Workaround
  autocmd BufWinEnter * normal zR
  autocmd BufWinEnter *.vim,*vimrc,*.md,*.txt normal zM
"}}}

" FUNCTIONS {{{

  " Highlight the match in red
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

  nnoremap <silent> n   n:call HLNext(0.6)<CR>
  nnoremap <silent> N   N:call HLNext(0.6)<CR>

  " Toggle between number and relativenumber
  function! ToggleNumber()
    if(&relativenumber == 1)
      set norelativenumber
      set number
    else
      set relativenumber
    endif
  endfunction

  " Toggle spellcheck (EN)
  function! ToggleSpell_EN()
    if(&spell == 1)
      set nospell
    else
      set spell spelllang=en_us
      highlight SpellBad ctermbg=Blue
    endif
  endfunction

  " Toggle spellcheck (PT)
  function! ToggleSpell_PT()
    if(&spell == 1)
      set nospell
    else
      set spell spelllang=pt
      highlight SpellBad ctermbg=Blue
    endif
  endfunction

  " Toggle wrap line
  function! ToggleWrap()
    if(&wrap == 1)
      set nowrap
    else
      set wrap linebreak nolist
    endif
  endfunction

  function! NeatFoldText()
    let indent_level = indent(v:foldstart)
    let indent = repeat(' ',indent_level)
    let line = ' ' . substitute(getline(v:foldstart), '^\s*"\?\s*\|\s*"\?\s*{{' . '{\d*\s*', '', 'g') . ' '
    let lines_count = v:foldend - v:foldstart + 1
    let lines_count_text = '-' . printf("%10s", lines_count . ' lines') . ' '
    let foldchar = matchstr(&fillchars, 'fold:\zs.')
    let foldtextstart = strpart('+' . repeat(foldchar, v:foldlevel*2) . line, 0, (winwidth(0)*2)/3)
    let foldtextend = lines_count_text . repeat(foldchar, 8)
    let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn
    return indent . foldtextstart . repeat(foldchar, winwidth(0)-foldtextlength) . foldtextend
  endfunction

  " Count unique words in visual selection
  function! UniqueWords()
    silent '<,'>w !tr -cd "[:alpha:][:space:]-/'" |
                \ tr ' [:upper:]' '\n[:lower:]' |
                \ tr -s '\n' |
                \ sed "s/^['-]*//;s/['-]$//" | sort |
                \ uniq -c | sort -nr > /tmp/unique_vim
  endfunction
  vnoremap <Leader>c :call UniqueWords()<CR>:vsp /tmp/unique_vim \| vertical resize 30 \| w<CR> \| normal zR
"}}}

" PLUGINS CONFIG {{{

  " Ale
  let g:ale_set_highlights = 0
  let g:ale_lint_on_text_changed='never'
  let g:ale_lint_on_insert_leave=0
  let g:ale_lint_on_enter=0
  let g:ale_lint_on_save=1

  let g:ale_fix_on_save=0
  let g:ale_fixers=[]
  let g:ale_completion_enabled=0

  let g:ale_echo_msg_error_str = 'E'
  let g:ale_echo_msg_warning_str = 'W'
  let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

  let g:ale_set_loclist = 0
  let g:ale_set_quickfix = 1

  " Autoformat
  autocmd BufWrite * execute ':Autoformat'
  let g:autoformat_autoindent=0
  let g:autoformat_remove_trailing_spaces = 1

  " Indent Line
  let g:indentLine_char_list = ['|', '¦', '┆', '┊']

  " Goyo
  let g:limelight_conceal_ctermfg = 240

  autocmd! User GoyoEnter Limelight
  autocmd! User GoyoLeave Limelight!

  " Vim-polyglot
  " let g:polyglot_disabled = ['markdown.plugin','python.plugin']
  " let g:polyglot_disabled = ['autoindent']

  " NERDTree
  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

  let g:NERDTreeShowHidden=0

  " Rainbow parentheses
  let g:rainbow_active = 1

  " Smooth scroll
  " noremap <silent> <C-u> :call smooth_scroll#up(&scroll, 4, 1)<CR>
  " noremap <silent> <C-d> :call smooth_scroll#down(&scroll, 4, 1)<CR>
  " noremap <silent> <C-b> :call smooth_scroll#up(&scroll*2, 8, 2)<CR>
  " noremap <silent> <C-f> :call smooth_scroll#down(&scroll*2, 8, 2)<CR>
  " noremap <silent> <Leader><Leader> :call smooth_scroll#down(&scroll, 4, 1)<CR>
"}}}
