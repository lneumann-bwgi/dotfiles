setlocal foldmethod=indent
setlocal shiftwidth=4
setlocal tabstop=4

let b:autoformat_autoindent=1
let b:formatters_python = ['black']

nnoremap <buffer> <Leader>e :w<CR>:!python %<CR>
nnoremap <buffer> <Leader>b obreakpoint()<Esc>

inoremap <buffer> ; :
inoremap <buffer> : ;
