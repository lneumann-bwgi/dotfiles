setlocal foldmethod=indent

let b:autoformat_autoindent=1

nnoremap <buffer> <Leader>e :w<CR>:!gcc -lmath -lncurses -Wall % && ./a.out<CR>
