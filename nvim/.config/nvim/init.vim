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
"|                     > Last major revision: Dec, 2019 <                      |
"|                                                                             |
"|               > 'Leader' is associated with function calls <                |
"|         > 'Ctrl' is associated with movements and autocompletion <          |
"|                         > 'g' is a 'go to' alias <                          |
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

    Plug 'Chiel92/vim-autoformat'
    Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
    Plug 'Yggdroot/indentLine'
    Plug 'dense-analysis/ale'
    Plug 'godlygeek/tabular', { 'on': 'Tabularize' }
    Plug 'itchyny/lightline.vim'
    Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
    Plug 'luochen1990/rainbow'
    Plug 'majutsushi/tagbar'
    Plug 'mhinz/vim-signify'
    Plug 'preservim/nerdtree'
    Plug 'reedes/vim-wordy', { 'on': 'Wordy' }
    Plug 'rhysd/clever-f.vim'
    " Plug 'rhysd/vim-grammarous' # needs Java8+
    Plug 'ron89/thesaurus_query.vim', { 'on': 'Goyo' }
    Plug 'sheerun/vim-polyglot'
    Plug 'terryma/vim-smooth-scroll'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-surround'

    " Color schemes
    Plug 'joshdick/onedark.vim'
    Plug 'junegunn/seoul256.vim'
    Plug 'morhetz/gruvbox'
    Plug 'sainnhe/gruvbox-material'

    call plug#end()
"}}}

" COLOR  {{{

    " URxvt doesn't support termguicolors
    set t_Co=256

    set background=dark
    set laststatus=2
    set noruler

    colorscheme seoul256
    let g:lightline = {'colorscheme' : 'seoul256'}
"}}}

    " SET DEFAULTS {{{

    filetype plugin indent on

    set autoread
    set backspace=indent,eol,start
    set cursorline
    set encoding=utf8
    " set foldcolumn=2
    set foldlevel=99
    set foldmethod=indent
    set hlsearch
    set lazyredraw
    set list
    set listchars=eol:¬
    set noincsearch
    set nowrap
    set number relativenumber
    set pastetoggle=<F2>
    set shiftround
    set showcmd
    set showmatch
    set shortmess+=c
    set smarttab
    set splitright splitbelow
    set title
    set undolevels=100
    set virtualedit=block

    " No Swap file
    set noswapfile
    set nobackup
    set nowb

    " Go to normal mode quicker
    set ttimeout
    set ttimeoutlen=100

    " Following python.org
    syntax on
    set encoding=utf-8
    set expandtab
    set fileformat=unix
    set shiftwidth=4
    set softtabstop=4
    set tabstop=4

    let python_highlight_all=1

    " Provides tab-completion for all file-related tasks
    set path+=**
    set wildmenu
    set wildmode=list:longest,full
    set wildignore=*.o,*.jpg,*.png,*.gz,*.zip
"}}}

" KEY MAPS {{{

    let mapleader=' '

    " Better
    nnoremap Y y$
    nnoremap H ^
    nnoremap L g_
    vnoremap H ^
    vnoremap L g_
    nnoremap U <C-r>

    " Save (similar to ZZ)
    nnoremap ZS :w<CR>

    " Visual selection in fold
    nnoremap viz v[zo]z$

    " Visual selection in last modified object
    nnoremap gV gv
    nnoremap gv `[v`]

    " Testing: match ( [ {
    nnoremap <Tab> %
    nnoremap <S-Tab> v%

    nnoremap <Leader>/ :nohlsearch<CR>
    nnoremap <Leader>G :set wrap linebreak nolist ignorecase<CR>:Goyo<CR>
    nnoremap <Leader>b !!bash<CR>

    nnoremap <Leader>tt :NERDTreeToggle<CR>
    nnoremap <Leader>ta :TagbarToggle<CR>

    nnoremap <Leader>w :call ToggleWrap()<CR>
    nnoremap <Leader>n :call ToggleNumber()<CR>

    nnoremap <Leader>ss :call ToggleSpell_EN()<CR>
    nnoremap <Leader>sp :call ToggleSpell_PT()<CR>

    " Git
    nnoremap <Leader>gs :Gstatus<CR>
    nnoremap <Leader>gd :Gvdiffsplit<CR>
    nnoremap <Leader>gc :Gcommit % -m "vim commit"<CR>

    " Navigation in buffers ( similar to gt, gT )
    nnoremap gb :w\|bn<CR>
    nnoremap gB :w\|bp<CR>
    nnoremap ]b :w\|bn<CR>
    nnoremap [b :w\|bp<CR>

    " Testing
    nnoremap gn *
    nnoremap gN #

    " Terminal mode
    tnoremap <Esc> <C-\><C-n>
    tnoremap <expr> <A-r> '<C-\><C-N>"'.nr2char(getchar()).'pi'
    nnoremap <Leader>T :vsp term://zsh<CR>

    " Swap colon and semicolon
    noremap ; :
    noremap : ;
    cnoremap ; :
    cnoremap : ;

    " Better navigation in jump list
    nnoremap '  `
    nnoremap `  '

    " Swap v and CTRL-V
    nnoremap    v   <C-V>
    nnoremap <C-V>     v
    vnoremap    v   <C-V>
    vnoremap <C-V>     v

    " Completion ( file, keyword, dictionary, thesaurus )
    inoremap <C-f> <C-x><C-f>
    inoremap <C-p> <C-x><C-p>
    inoremap <C-n> <C-x>s

    " Past from + register in insert mode
    inoremap <C-r> <C-r>+

    " Keep selection after indenting
    xnoremap <silent> < <gv
    xnoremap <silent> > >gv

    " Bash like in ex mode
    cnoremap <C-a> <home>
    cnoremap <C-e> <end>

    " Slip windows
    nnoremap <Up> <C-w><Up>
    nnoremap <Down> <C-w><Down>
    nnoremap <Left> <C-w><Left>
    nnoremap <Right> <C-w><Right>

    nnoremap <A-j> <C-w><Up>
    nnoremap <A-k> <C-w><Down>
    nnoremap <A-h> <C-w><Left>
    nnoremap <A-l> <C-w><Right>

    nnoremap <C-Up> <C-w>+
    nnoremap <C-Down> <C-w>-
    nnoremap <C-Left> <C-w><
    nnoremap <C-Right> <C-w>>

    " Useless keys
    nnoremap s <NOP>
    nnoremap S <NOP>
    nnoremap K <NOP>
    nnoremap M <NOP>
    nnoremap Q <NOP>
    nnoremap gQ <NOP>
    nnoremap ^ <NOP>
    nnoremap _ <NOP>
    nnoremap g_ <NOP>
    nnoremap <Space> <NOP>
    nnoremap <Backspace> <NOP>
    nnoremap <Del> <NOP>
    inoremap <Del> <NOP>

    " SSH
    " cnoremap kahuna :e scp://neumann@kahuna.iqm.unicamp.br/
    " cnoremap galileu :e scp://neumann@177.220.13.33/

    " Abbreviations
    abbr funciton function
    abbr teh the
    abbr tempalte template
    abbr fitler filter
    abbr cosnt const
    abbr attribtue attribute
    abbr attribuet attribute
"}}}

" MISC {{{

    " Change default vim register
    set clipboard=unnamed
    if has('unnamedplus')
        set clipboard=unnamed,unnamedplus
    endif

    " Highlight Column
    highlight ColorColumn ctermbg=magenta
    call matchadd('ColorColumn', '\%81v', 100)

    " Disables automatic commenting on newline
    autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

    " Automatically deletes all trailing whitespace on save
    " autocmd BufWritePre * %s/\s\+$//e

    " Shows cursor only on focus window
    autocmd InsertLeave,WinEnter * set cursorline
    autocmd InsertEnter,WinLeave * set nocursorline
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

    set nospell
    set complete+=kspell

    " Toggle wrap line
    function! ToggleWrap()
        if(&wrap == 1)
            set nowrap
        else
            set wrap linebreak nolist
        endif
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

" PLUGINS {{{

    " Ale
    let g:ale_set_highlights = 0
    let g:ale_lint_on_text_changed='never'
    let g:ale_lint_on_insert_leave=0
    let g:ale_lint_on_enter=0
    let g:ale_lint_on_save=1

    let g:ale_echo_msg_error_str = 'E'
    let g:ale_echo_msg_warning_str = 'W'
    let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

    let g:ale_set_loclist = 0
    let g:ale_set_quickfix = 1

    nnoremap <silent> [e :ALENextWrap<CR>
    nnoremap <silent> ]e :ALEPreviousWrap<CR>

    " Autoformat
    autocmd BufWrite * execute ':Autoformat'
    autocmd Filetype vim,tex,md,conf let b:autoformat_autoindent=0
    let g:autoformat_remove_trailing_spaces = 1

    " Leader-F
    let g:Lf_WindowPosition = 'popup'
    let g:Lf_PreviewInPopup = 1
    let g:Lf_HideHelp = 1

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
    noremap <silent> <C-u> :call smooth_scroll#up(&scroll, 4, 1)<CR>
    noremap <silent> <C-d> :call smooth_scroll#down(&scroll, 4, 1)<CR>
    noremap <silent> <A-=> :call smooth_scroll#up(&scroll, 4, 1)<CR>
    noremap <silent> <C--> :call smooth_scroll#down(&scroll, 4, 1)<CR>
    noremap <silent> <C-b> :call smooth_scroll#up(&scroll*2, 8, 2)<CR>
    noremap <silent> <C-f> :call smooth_scroll#down(&scroll*2, 8, 2)<CR>
"}}}

" FILES {{{

    " Workaround
    autocmd BufWinEnter * normal zR
    autocmd BufWinEnter *.vim,*vimrc,*.md,*.txt normal zM

    " Vim
    autocmd FileType vim set foldmethod=marker

    " Python
    autocmd FileType python set autoindent

    autocmd FileType python nnoremap <Leader>e :w<CR> :!python %<CR>
    autocmd FileType python nnoremap <Leader>b obreakpoint()<Esc>
    autocmd FileType python nnoremap <Leader>B !!bash<CR>
    autocmd FileType python inoremap ; :
    autocmd FileType python inoremap : ;

    " Latex and Markdown Files

    autocmd FileType tex <Leader>e :w! \| :!pdflatex -interaction=nonstopmode %<CR><CR>
    autocmd FileType tex,plaintex,markdown set foldmethod=marker

    autocmd FileType tex,plaintex,markdown nnoremap j gjzz
    autocmd FileType tex,plaintex,markdown nnoremap k gkzz
    autocmd FileType tex,plaintex,markdown nnoremap { {zz
    autocmd FileType tex,plaintex,markdown nnoremap } }zz

    autocmd FileType tex,plaintex,markdown nnoremap W w*#
    autocmd FileType tex,plaintex,markdown nnoremap <silent> Z z=1<CR><CR>
"}}}
