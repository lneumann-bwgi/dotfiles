setlocal foldmethod=indent
setlocal shiftwidth=2
setlocal tabstop=2

nnoremap <buffer> <Leader>e :w<CR>:!julia %<CR>

let g:JuliaFormatter_options = {
        \ 'indent'                    : 2,
        \ 'margin'                    : 92,
        \ 'always_for_in'             : v:false,
        \ 'whitespace_typedefs'       : v:false,
        \ 'whitespace_ops_in_indices' : v:true,
        \ }
