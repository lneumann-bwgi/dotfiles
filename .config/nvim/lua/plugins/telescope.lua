local M = {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local action_layout = require("telescope.actions.layout")
        local actions = require("telescope.actions")

        require("telescope").setup({
            defaults = {
                layout_config = {
                    horizontal = {
                        preview_cutoff = 0,
                    },
                },
                mappings = {
                    n = {
                        ["<tab>"] = action_layout.toggle_preview,
                    },
                    i = {
                        ["<tab>"] = action_layout.toggle_preview,
                        ["<C-s>"] = actions.cycle_previewers_next,
                        ["<C-a>"] = actions.cycle_previewers_prev,
                    },
                },
            },
        })

        -- find files
        vim.keymap.set("n", "<leader>fb", require("telescope.builtin").buffers)
        vim.keymap.set("n", "<leader>ff", require("telescope.builtin").find_files)
        vim.keymap.set("n", "<leader>fo", require("telescope.builtin").oldfiles)

        -- find in file
        vim.keymap.set("n", "<leader>fT", require("telescope.builtin").current_buffer_tags)
        vim.keymap.set("n", "<leader>fg", require("telescope.builtin").live_grep)
        vim.keymap.set("n", "<leader>fG", require("telescope.builtin").current_buffer_fuzzy_find)

        -- git operations
        vim.keymap.set("n", "<leader>gf", require("telescope.builtin").git_files)
        vim.keymap.set("n", "<leader>gs", require("telescope.builtin").git_status)
        vim.keymap.set("n", "<leader>gc", require("telescope.builtin").git_commits)

        -- spell help
        vim.keymap.set("n", "z=", require("telescope.builtin").spell_suggest)

        -- lsp operatioins
        vim.keymap.set("n", "<leader>fr", require("telescope.builtin").lsp_references)
        vim.keymap.set("n", "<leader>fd", require("telescope.builtin").lsp_definitions)
        vim.keymap.set("n", "<leader>ft", require("telescope.builtin").lsp_dynamic_workspace_symbols)
        vim.keymap.set("n", "<leader>ic", require("telescope.builtin").lsp_incoming_calls)
        vim.keymap.set("n", "<leader>oc", require("telescope.builtin").lsp_outgoing_calls)

        vim.keymap.set("n", "<leader>d", ":Telescope diagnostics bufnr=0<cr>")
    end,
}
return M
