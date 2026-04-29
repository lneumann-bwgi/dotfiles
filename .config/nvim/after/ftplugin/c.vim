nnoremap <buffer> <Leader>ee :w<CR>:!clang -o temp.out -lm -Wall % && ./temp.out<CR>
