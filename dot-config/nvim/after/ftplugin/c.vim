nnoremap <buffer> <Leader>E :w<CR>:!clang -o temp.out -lm -Wall % && ./temp.out<CR>
