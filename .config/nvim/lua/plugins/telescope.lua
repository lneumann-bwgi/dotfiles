local telescope = require("telescope.builtin")
require("telescope").setup({})

vim.cmd([[
nnoremap <leader>tb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>tf <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>to <cmd>lua require('telescope.builtin').old_files()<cr>
nnoremap <leader>tt <cmd>lua require('telescope.builtin').current_buffer_tags()<cr>
nnoremap <leader>tr <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>tz <cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>

nnoremap <leader>tgf <cmd>lua require('telescope.builtin').git_files()<cr>
nnoremap <leader>tgs <cmd>lua require('telescope.builtin').git_status()<cr>
nnoremap <leader>tgc <cmd>lua require('telescope.builtin').git_commits()<cr>

nnoremap z=          <cmd>lua require('telescope.builtin').spell_suggest()<cr>
]])
