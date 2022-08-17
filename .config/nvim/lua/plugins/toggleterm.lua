require("toggleterm").setup()

local opts = { buffer = 0 }
vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)

local Terminal = require("toggleterm.terminal").Terminal

local lazygit =
	Terminal:new({ cmd = "lazygit", direction = "float", hidden = true, float_opts = { border = "double" } })
local python = Terminal:new({
	cmd = "ptpython",
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

vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>q", "<cmd>lua _shell_toggle()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>Q", "<cmd>lua _python_toggle()<CR>", { noremap = true, silent = true })
