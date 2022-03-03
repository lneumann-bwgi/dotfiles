setlocal foldmethod=indent
setlocal shiftwidth=4
setlocal tabstop=4
setlocal iskeyword-=_

nnoremap <buffer> <Leader>e :w<CR>:!python %<CR>
nnoremap <buffer> <Leader>E :w<CR>:!pipenv run python %<CR>
nnoremap <buffer> <Leader>b obreakpoint()<Esc>

inoremap <buffer> ; :
inoremap <buffer> : ;
