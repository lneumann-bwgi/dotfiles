require("toggleterm").setup()

function _G.set_terminal_keymaps()
	local opts = { buffer = 0 }
	vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
	vim.keymap.set("t", "<c-h>", [[<cmd>wincmd h<cr>]], opts)
	vim.keymap.set("t", "<c-j>", [[<cmd>wincmd j<cr>]], opts)
	vim.keymap.set("t", "<c-k>", [[<cmd>wincmd k<cr>]], opts)
	vim.keymap.set("t", "<c-l>", [[<cmd>wincmd l<cr>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

local Terminal = require("toggleterm.terminal").Terminal

local lazygit =
	Terminal:new({ cmd = "lazygit", direction = "float", hidden = true, float_opts = { border = "double" } })

local python = Terminal:new({
	cmd = "python",
	direction = "float",
	hidden = true,
	float_opts = { border = "double" },
})

local shell = Terminal:new({ direction = "float", hidden = true, float_opts = { border = "double" } })

function _python_toggle()
	python:toggle()
end
function _shell_toggle()
	shell:toggle()
end
function _lazygit_toggle()
	lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>G", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>q", "<cmd>lua _shell_toggle()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>Q", "<cmd>lua _python_toggle()<CR>", { noremap = true, silent = true })
