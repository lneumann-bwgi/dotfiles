setlocal foldmethod=indent

nnoremap <buffer> <Leader>e :w<CR>:!clang -o temp.out -lm -Wall % && ./temp.out<CR>
