setlocal foldmethod=indent

let b:autoformat_autoindent=1

nnoremap <buffer> <Leader>e :w<CR>:!clang -o temp.out -lm -Wall % && ./temp.out<CR>
