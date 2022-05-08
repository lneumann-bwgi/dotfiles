local telescope = require("telescope.builtin")
require("telescope").setup({})

vim.keymap.set("n", "<leader>tb", require('telescope.builtin').buffers)
vim.keymap.set("n", "<leader>tf", require('telescope.builtin').find_files)
vim.keymap.set("n", "<leader>to", require('telescope.builtin').oldfiles)
vim.keymap.set("n", "<leader>tt", require('telescope.builtin').current_buffer_tags)
vim.keymap.set("n", "<leader>tr", require('telescope.builtin').live_grep)
vim.keymap.set("n", "<leader>tz", require('telescope.builtin').current_buffer_fuzzy_find)

vim.keymap.set("n", "<leader>gf", require('telescope.builtin').git_files)
vim.keymap.set("n", "<leader>gs", require('telescope.builtin').git_status)
vim.keymap.set("n", "<leader>gc", require('telescope.builtin').git_commits)

vim.keymap.set("n", "z=", require('telescope.builtin').spell_suggest)
